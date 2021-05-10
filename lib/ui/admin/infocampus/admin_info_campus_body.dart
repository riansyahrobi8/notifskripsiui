import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:notifskripsiui/models/data_model.dart';
import 'package:notifskripsiui/ui/home/detail/detail_home_screen.dart';
import 'package:notifskripsiui/utils/constanta_colors.dart';
import 'package:notifskripsiui/utils/constanta_strings.dart';
import 'package:notifskripsiui/utils/size_config.dart';

class AdminInfoCampusBody extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldStateKey;

  const AdminInfoCampusBody({Key key, this.scaffoldStateKey}) : super(key: key);

  @override
  _AdminInfoCampusBodyState createState() =>
      _AdminInfoCampusBodyState(scaffoldStateKey);
}

class _AdminInfoCampusBodyState extends State<AdminInfoCampusBody> {
  final DateFormat dateFormat = DateFormat.yMMMMd();

  final GlobalKey<ScaffoldState> scaffoldStateKey;

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  _AdminInfoCampusBodyState(this.scaffoldStateKey);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: getProportionateScreenHeight(24.0),
          ),
          ...List.generate(
              dataAtHome.length,
              (index) => Slidable(
                    actionPane: SlidableDrawerActionPane(),
                    secondaryActions: <Widget>[
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              builder: (BuildContext context) =>
                                  SingleChildScrollView(
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          24.0,
                                          24.0,
                                          24.0,
                                          MediaQuery.of(context)
                                              .viewInsets
                                              .bottom),
                                      child: buildForm(dataAtHome[index].title,
                                          dataAtHome[index].desc),
                                    ),
                                  ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(
                                          getProportionateScreenWidth(16.0)),
                                      topRight: Radius.circular(
                                          getProportionateScreenWidth(16.0)))));
                        },
                        child: Container(
                          padding: EdgeInsets.all(24.0),
                          decoration: BoxDecoration(
                              color: primaryColor, shape: BoxShape.circle),
                          child: Icon(Icons.edit_rounded, color: Colors.white),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (_) => buildAlertDialog());
                        },
                        child: Container(
                          padding: EdgeInsets.all(24.0),
                          decoration: BoxDecoration(
                              color: Colors.red, shape: BoxShape.circle),
                          child: Icon(
                            Icons.delete_forever_rounded,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                    child: buildItemContainer(context, dataAtHome[index].title,
                        dataAtHome[index].desc, dataAtHome[index].dateTime),
                  ))
        ],
      ),
    );
  }

  AlertDialog buildAlertDialog() {
    return AlertDialog(
      title: Center(
          child: Container(
        padding: EdgeInsets.all(8.0),
        decoration:
            BoxDecoration(shape: BoxShape.circle, color: Colors.red[100]),
        child: Icon(
          Icons.delete_forever_rounded,
          color: Colors.red,
        ),
      )),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            titleDialogDelete,
            style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: backgroundColor),
          ),
          SizedBox(height: getProportionateScreenWidth(16.0)),
          Text(
            subtitleDialogDelete,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12.0, color: textColor2),
          ),
          SizedBox(height: getProportionateScreenWidth(56.0)),
          Row(
            children: [
              Flexible(
                flex: 1,
                child: RaisedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    elevation: 0.0,
                    visualDensity: VisualDensity.compact,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(1000.0)),
                    padding: EdgeInsets.symmetric(
                      vertical: getProportionateScreenWidth(20.0),
                    ),
                    child: Center(
                      child: Text(
                        cancel,
                        style: TextStyle(color: primaryColor, fontSize: 14.0),
                      ),
                    )),
              ),
              SizedBox(
                width: getProportionateScreenWidth(8.0),
              ),
              Flexible(
                flex: 1,
                child: RaisedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      scaffoldStateKey.currentState.showSnackBar(SnackBar(
                        content: Text(
                          "$homeMenu berhasil dihapus",
                          style: TextStyle(
                              color: textColor1, fontFamily: "Poppins"),
                        ),
                      ));
                    },
                    color: accentColor,
                    elevation: 0.0,
                    visualDensity: VisualDensity.compact,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(1000.0)),
                    padding: EdgeInsets.symmetric(
                      vertical: getProportionateScreenWidth(20.0),
                    ),
                    child: Center(
                      child: Text(
                        yes,
                        style: TextStyle(color: textColor1, fontSize: 14.0),
                      ),
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }

  GestureDetector buildItemContainer(
      BuildContext context, String title, String desc, DateTime dateTime) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                fullscreenDialog: true,
                builder: (_) => DetailHomeScreen(
                      title: title,
                      desc: desc,
                      dateTime: dateTime,
                    )));
      },
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(
            left: getProportionateScreenWidth(24.0),
            right: getProportionateScreenWidth(24.0),
            bottom: getProportionateScreenWidth(16.0)),
        decoration: BoxDecoration(
            color: textFieldAndCardColor,
            borderRadius:
                BorderRadius.circular(getProportionateScreenWidth(24.0))),
        child: Padding(
          padding: EdgeInsets.all(getProportionateScreenWidth(24.0)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: textColor1,
                  fontSize: 18.0,
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(8.0),
              ),
              Text(
                desc,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: textColor2, fontSize: 14.0),
              ),
              SizedBox(
                height: getProportionateScreenHeight(16.0),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  dateFormat.format(dateTime),
                  textAlign: TextAlign.right,
                  maxLines: 1,
                  style: TextStyle(color: textColor2, fontSize: 14.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildForm(String title, String content) {
    _titleController.text = title;
    _contentController.text = content;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          edit,
          style: TextStyle(fontSize: 20.0, color: textColor1),
        ),
        Text(
          "Apa saja mengenai $homeMenu",
          style: TextStyle(fontSize: 14.0),
        ),
        SizedBox(
          height: getProportionateScreenWidth(36.0),
        ),
        Form(
            child: TextFormField(
          controller: _titleController,
          keyboardType: TextInputType.text,
          decoration: buildInputDecoration(titleInfoCampusHint),
          style: TextStyle(color: textColor2, fontSize: 16.0),
        )),
        SizedBox(
          height: getProportionateScreenWidth(16.0),
        ),
        Form(
            child: TextFormField(
          controller: _contentController,
          keyboardType: TextInputType.multiline,
          maxLines: 8,
          decoration: buildInputDecorationArea(contentInfoCampusHint),
          style: TextStyle(color: textColor2, fontSize: 16.0),
        )),
        SizedBox(
          height: getProportionateScreenWidth(24.0),
        ),
        SizedBox(
          width: double.infinity,
          child: RaisedButton(
              onPressed: () {
                Navigator.pop(context);
                scaffoldStateKey.currentState.showSnackBar(SnackBar(
                  content: Text(
                    "$homeMenu berhasil diubah",
                    style: TextStyle(color: textColor1, fontFamily: "Poppins"),
                  ),
                ));
              },
              color: accentColor,
              elevation: 0.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(1000.0)),
              padding: EdgeInsets.symmetric(
                vertical: getProportionateScreenWidth(24.0),
              ),
              child: Center(
                child: Text(
                  save,
                  style: TextStyle(color: textColor1, fontSize: 18.0),
                ),
              )),
        ),
        SizedBox(
          height: getProportionateScreenWidth(24.0),
        ),
      ],
    );
  }

  InputDecoration buildInputDecoration(String type) {
    return InputDecoration(
        contentPadding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(36.0),
            vertical: getProportionateScreenWidth(24.0)),
        filled: true,
        fillColor: textFieldAndCardColor,
        border: InputBorder.none,
        hintText: type,
        hintStyle: TextStyle(color: textColor2, fontSize: 16.0),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(1000.0),
            borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(1000.0),
            borderSide: BorderSide.none));
  }

  InputDecoration buildInputDecorationArea(String type) {
    return InputDecoration(
        contentPadding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(36.0),
            vertical: getProportionateScreenWidth(24.0)),
        filled: true,
        fillColor: textFieldAndCardColor,
        border: InputBorder.none,
        hintText: type,
        hintStyle: TextStyle(color: textColor2, fontSize: 16.0),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24.0),
            borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24.0),
            borderSide: BorderSide.none));
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }
}
