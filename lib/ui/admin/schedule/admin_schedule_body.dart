import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:notifskripsiui/models/data_model.dart';
import 'package:notifskripsiui/ui/schedule/detail/detail_schedule_screen.dart';
import 'package:notifskripsiui/utils/constanta_colors.dart';
import 'package:notifskripsiui/utils/constanta_strings.dart';
import 'package:notifskripsiui/utils/size_config.dart';

class AdminScheduleBody extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldStateKey;

  const AdminScheduleBody({Key key, this.scaffoldStateKey}) : super(key: key);

  @override
  _AdminScheduleBodyState createState() =>
      _AdminScheduleBodyState(scaffoldStateKey);
}

class _AdminScheduleBodyState extends State<AdminScheduleBody> {
  final DateFormat dateFormat = DateFormat.yMMMMd();

  final GlobalKey<ScaffoldState> _scaffoldStateKey;

  _AdminScheduleBodyState(this._scaffoldStateKey);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: getProportionateScreenHeight(24.0),
          ),
          ...List.generate(
              dataAtSchedule.length,
              (index) => Slidable(
                    actionPane: SlidableDrawerActionPane(),
                    secondaryActions: <Widget>[
                      GestureDetector(
                        onTap: () => print("Ubah"),
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
                        dataAtSchedule[index].name,
                        dataAtSchedule[index].nim,
                        dataAtSchedule[index].title,
                        dataAtSchedule[index].teacher1,
                        dataAtSchedule[index].otherTeacher,
                        dataAtSchedule[index].place,
                        dataAtSchedule[index].dateTime),
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
                          "$scheduleMenu berhasil dihapus",
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
      BuildContext context,
      String name,
      String nim,
      String title,
      String teacher1,
      String otherTeacher,
      String place,
      DateTime dateTime) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                fullscreenDialog: true,
                builder: (_) => DetailScheduleScreen(
                      name: name,
                      nim: nim,
                      title: title,
                      teacher1: teacher1,
                      otherTeacher: otherTeacher,
                      place: place,
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
                name,
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
                nim,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: textColor2, fontSize: 14.0),
              ),
              SizedBox(
                height: getProportionateScreenHeight(16.0),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: textColor2, fontSize: 14.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
