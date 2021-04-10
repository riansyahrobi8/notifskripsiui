import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:notifskripsiui/utils/constanta_colors.dart';
import 'package:notifskripsiui/utils/size_config.dart';

class DetailHomeScreen extends StatelessWidget {
  final String title;
  final String desc;
  final DateTime dateTime;
  final DateFormat dateFormat = DateFormat.yMMMMd();

  DetailHomeScreen({Key key, this.title, this.desc, this.dateTime})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(),
      body: Container(
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
                style: TextStyle(
                  color: textColor1,
                  fontSize: 22.0,
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(8.0),
              ),
              Text(
                desc,
                style: TextStyle(color: textColor2, fontSize: 16.0),
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
                  style: TextStyle(color: textColor2, fontSize: 16.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
