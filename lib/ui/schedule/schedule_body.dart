import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:notifskripsiui/models/data_model.dart';
import 'package:notifskripsiui/ui/schedule/detail/detail_schedule_screen.dart';
import 'package:notifskripsiui/utils/constanta_colors.dart';
import 'package:notifskripsiui/utils/size_config.dart';

class ScheduleBody extends StatelessWidget {
  final DateFormat dateFormat = DateFormat.yMMMMd();

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
              (index) => buildItemContainer(
                  context,
                  dataAtSchedule[index].name,
                  dataAtSchedule[index].nim,
                  dataAtSchedule[index].title,
                  dataAtSchedule[index].teacher1,
                  dataAtSchedule[index].teacher2,
                  dataAtSchedule[index].teacher3,
                  dataAtSchedule[index].place,
                  dataAtSchedule[index].dateTime))
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
      String teacher2,
      String teacher3,
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
                      teacher2: teacher2,
                      teacher3: teacher3,
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
                  fontSize: 22.0,
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(8.0),
              ),
              Text(
                nim,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: textColor2, fontSize: 16.0),
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
