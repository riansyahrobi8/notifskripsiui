import 'package:flutter/material.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:notifskripsiui/models/data_model.dart';
import 'package:notifskripsiui/ui/note/detail/detail_note_screen.dart';
import 'package:notifskripsiui/utils/constanta_colors.dart';
import 'package:notifskripsiui/utils/constanta_strings.dart';
import 'package:notifskripsiui/utils/size_config.dart';

class AdminNoteBody extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldStateKey;

  const AdminNoteBody({Key key, this.scaffoldStateKey}) : super(key: key);

  @override
  _AdminNoteBodyState createState() => _AdminNoteBodyState(scaffoldStateKey);
}

class _AdminNoteBodyState extends State<AdminNoteBody> {
  final DateFormat dateFormat = DateFormat.yMMMMd();

  final GlobalKey<AutoCompleteTextFieldState> key =
      GlobalKey<AutoCompleteTextFieldState>();
  final GlobalKey<ScaffoldState> _scaffoldStateKey;

  final TextEditingController _nimController = TextEditingController();
  final TextEditingController _titleNoteController = TextEditingController();
  final TextEditingController _teacher1Controller = TextEditingController();
  final TextEditingController _teacher2Controller = TextEditingController();

  _AdminNoteBodyState(this._scaffoldStateKey);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: getProportionateScreenHeight(24.0),
          ),
          ...List.generate(
              dataAtNote.length,
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
                                        child: buildForm(
                                            dataAtNote[index].titleNote,
                                            dataAtNote[index].notes.first,
                                            dataAtNote[index].notes2.first)),
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
                        onTap: () => showDialog(
                            context: context,
                            builder: (_) => buildAlertDialog()),
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
                    child: buildItemContainer(
                        context,
                        dataAtNote[index].dateTime,
                        dataAtNote[index].titleNote,
                        dataAtNote[index].notes,
                        dataAtNote[index].notes2),
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
                      _scaffoldStateKey.currentState.showSnackBar(SnackBar(
                        content: Text(
                          "$noteMenu berhasil dihapus",
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

  GestureDetector buildItemContainer(BuildContext context, DateTime dateTime,
      String titleNote, List notes1, List notes2) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                fullscreenDialog: true,
                builder: (_) => DetailNoteScreen(
                      dateTime: dateTime,
                      titleNote: titleNote,
                      notes: notes1,
                      notes2: notes2,
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
                dateFormat.format(dateTime),
                maxLines: 1,
                style: TextStyle(color: textColor2, fontSize: 14.0),
              ),
              SizedBox(
                height: getProportionateScreenHeight(4.0),
              ),
              Text(
                titleNote,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: textColor1,
                  fontSize: 18.0,
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(16.0),
              ),
              Text(
                "1. ${notes1[0]}",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: textColor2, fontSize: 14.0),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildForm(String title, String teacher1, String teacher2) {
    _titleNoteController.text = title;
    _teacher1Controller.text = teacher1;
    _teacher2Controller.text = teacher2;

    List<String> suggestionList = [
      "155410100",
      "155410101",
      "155410102",
      "155410103",
      "155410104",
      "155410105",
      "155410106",
      "155410107",
      "155410108",
      "155410109",
      "155410110"
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          edit,
          style: TextStyle(fontSize: 20.0, color: textColor1),
        ),
        Text(
          "$noteMenu untuk mahasiswa yang telah melakukan seminar",
          style: TextStyle(fontSize: 14.0),
        ),
        SizedBox(
          height: getProportionateScreenWidth(36.0),
        ),
        Form(
            child: AutoCompleteTextField(
          key: key,
          controller: _nimController,
          suggestions: suggestionList,
          clearOnSubmit: false,
          itemFilter: (item, query) {
            return item.toLowerCase().startsWith(query.toLowerCase());
          },
          itemSorter: (a, b) {
            return a.compareTo(b);
          },
          itemSubmitted: (item) {
            _nimController.text = item;
          },
          itemBuilder: (context, item) {
            return Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(24.0)),
              child: Row(
                children: [
                  Text(
                    item,
                  )
                ],
              ),
            );
          },
          keyboardType: TextInputType.number,
          decoration: buildInputDecoration(searchStudent),
          style: TextStyle(color: textColor2, fontSize: 16.0),
        )),
        SizedBox(
          height: getProportionateScreenWidth(16.0),
        ),
        Form(
            child: TextFormField(
          controller: _titleNoteController,
          keyboardType: TextInputType.text,
          decoration: buildInputDecoration(titleNoteHint),
          style: TextStyle(color: textColor2, fontSize: 16.0),
        )),
        SizedBox(
          height: getProportionateScreenWidth(16.0),
        ),
        Form(
            child: TextFormField(
          controller: _teacher1Controller,
          keyboardType: TextInputType.multiline,
          maxLines: 8,
          decoration: buildInputDecorationArea(contentTeacher1Hint),
          style: TextStyle(color: textColor2, fontSize: 16.0),
        )),
        SizedBox(
          height: getProportionateScreenWidth(16.0),
        ),
        Form(
            child: TextFormField(
          controller: _teacher2Controller,
          keyboardType: TextInputType.multiline,
          maxLines: 8,
          decoration: buildInputDecorationArea(contentTeacher2Hint),
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
                _scaffoldStateKey.currentState.showSnackBar(SnackBar(
                  content: Text(
                    "$noteMenu berhasil diubah",
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
}
