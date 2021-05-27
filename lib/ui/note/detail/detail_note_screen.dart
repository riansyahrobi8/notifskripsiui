import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:notifskripsiui/utils/constanta_colors.dart';
import 'package:notifskripsiui/utils/constanta_strings.dart';
import 'package:notifskripsiui/utils/size_config.dart';

class DetailNoteScreen extends StatelessWidget {
  final DateTime dateTime;
  final String titleNote;
  final List<String> notes;
  final List<String> notes2;
  final List<String> notes3;
  final DateFormat dateFormat = DateFormat.yMMMMd();

  DetailNoteScreen(
      {Key key,
      this.dateTime,
      this.titleNote,
      this.notes,
      this.notes2,
      this.notes3})
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
                  dateFormat.format(dateTime),
                  style: TextStyle(color: textColor2, fontSize: 16.0),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(4.0),
                ),
                Text(
                  titleNote,
                  style: TextStyle(color: textColor1, fontSize: 20.0),
                ),
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
                RichText(
                    text: TextSpan(children: [
                  ...List.generate(
                      notes.length,
                      (index) => TextSpan(
                          text: "${index + 1}. ${notes[index]}\n\n",
                          style: TextStyle(
                              color: textColor1,
                              fontSize: 14.0,
                              fontFamily: "Poppins")))
                ])),
                Text(
                  textTeacher2,
                  style: TextStyle(fontSize: 14.0, color: textColor2),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(4.0),
                ),
                RichText(
                    text: TextSpan(children: [
                  ...List.generate(
                      notes2.length,
                      (index) => TextSpan(
                          text: "${index + 1}. ${notes2[index]}\n\n",
                          style: TextStyle(
                              color: textColor1,
                              fontSize: 14.0,
                              fontFamily: "Poppins")))
                ])),
                Text(
                  textTeacher3,
                  style: TextStyle(fontSize: 14.0, color: textColor2),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(4.0),
                ),
                RichText(
                    text: TextSpan(children: [
                  ...List.generate(
                      notes3.length,
                      (index) => TextSpan(
                          text: "${index + 1}. ${notes3[index]}\n\n",
                          style: TextStyle(
                              color: textColor1,
                              fontSize: 14.0,
                              fontFamily: "Poppins")))
                ])),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
