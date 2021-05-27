import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:notifskripsiui/utils/constanta_colors.dart';
import 'package:notifskripsiui/utils/constanta_strings.dart';
import 'package:notifskripsiui/utils/size_config.dart';

class DetailScheduleScreen extends StatelessWidget {
  final String name;
  final String nim;
  final String title;
  final String teacher1;
  final String teacher2;
  final String teacher3;
  final String place;
  final DateTime dateTime;
  final DateFormat dateFormat = DateFormat.yMMMMd();

  DetailScheduleScreen(
      {Key key,
      this.name,
      this.nim,
      this.title,
      this.teacher1,
      this.teacher2,
      this.teacher3,
      this.place,
      this.dateTime})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.only(
              left: getProportionateScreenWidth(24.0),
              right: getProportionateScreenWidth(24.0),
              bottom: getProportionateScreenWidth(24.0)),
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
                  textName,
                  style: TextStyle(fontSize: 14.0, color: textColor2),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(4.0),
                ),
                Text(name, style: TextStyle(color: textColor1, fontSize: 18.0)),
                SizedBox(
                  height: getProportionateScreenHeight(24.0),
                ),
                Text(
                  textNim,
                  style: TextStyle(fontSize: 14.0, color: textColor2),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(4.0),
                ),
                Text(nim, style: TextStyle(color: textColor1, fontSize: 18.0)),
                SizedBox(
                  height: getProportionateScreenHeight(24.0),
                ),
                Text(
                  textTitle,
                  style: TextStyle(fontSize: 14.0, color: textColor2),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(4.0),
                ),
                Text(title,
                    style: TextStyle(color: textColor1, fontSize: 18.0)),
                SizedBox(
                  height: getProportionateScreenHeight(24.0),
                ),
                Text(
                  textTeacher1,
                  style: TextStyle(fontSize: 14.0, color: textColor2),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(4.0),
                ),
                Text(teacher1,
                    style: TextStyle(color: textColor1, fontSize: 18.0)),
                SizedBox(
                  height: getProportionateScreenHeight(24.0),
                ),
                Text(
                  textTeacher2,
                  style: TextStyle(fontSize: 14.0, color: textColor2),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(4.0),
                ),
                Text(teacher2,
                    style: TextStyle(color: textColor1, fontSize: 18.0)),
                SizedBox(
                  height: getProportionateScreenHeight(24.0),
                ),
                Text(
                  textTeacher3,
                  style: TextStyle(fontSize: 14.0, color: textColor2),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(4.0),
                ),
                Text(teacher3,
                    style: TextStyle(color: textColor1, fontSize: 18.0)),
                SizedBox(
                  height: getProportionateScreenHeight(24.0),
                ),
                Text(
                  textPlace,
                  style: TextStyle(fontSize: 14.0, color: textColor2),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(4.0),
                ),
                Text(place,
                    style: TextStyle(color: textColor1, fontSize: 18.0)),
                SizedBox(
                  height: getProportionateScreenHeight(24.0),
                ),
                Text(
                  textTime,
                  style: TextStyle(fontSize: 14.0, color: textColor2),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(4.0),
                ),
                Text(dateFormat.format(dateTime),
                    style: TextStyle(color: textColor1, fontSize: 18.0)),
                SizedBox(
                  height: getProportionateScreenHeight(24.0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
