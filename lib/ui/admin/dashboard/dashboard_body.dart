import 'package:flutter/material.dart';
import 'package:notifskripsiui/routing/constanta_route.dart';
import 'package:notifskripsiui/utils/constanta_colors.dart';
import 'package:notifskripsiui/utils/size_config.dart';
import 'package:notifskripsiui/utils/constanta_strings.dart';

class DashboardBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(getProportionateScreenWidth(24.0)),
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, adminInfoCampus);
              },
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: textFieldAndCardColor,
                    borderRadius: BorderRadius.circular(
                        getProportionateScreenWidth(24.0))),
                child: Padding(
                  padding: EdgeInsets.all(getProportionateScreenWidth(24.0)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(homeMenu,
                          style: TextStyle(fontSize: 20, color: textColor1)),
                      SizedBox(
                        height: getProportionateScreenHeight(8.0),
                      ),
                      Text(
                        subAdminInfoCampus,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(24.0),
          ),
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, adminSchedule);
              },
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: textFieldAndCardColor,
                    borderRadius: BorderRadius.circular(
                        getProportionateScreenWidth(24.0))),
                child: Padding(
                  padding: EdgeInsets.all(getProportionateScreenWidth(24.0)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(scheduleMenu,
                          style: TextStyle(fontSize: 20, color: textColor1)),
                      SizedBox(
                        height: getProportionateScreenHeight(8.0),
                      ),
                      Text(
                        subAdminSchedule,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(24.0),
          ),
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, adminNote);
              },
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: textFieldAndCardColor,
                    borderRadius: BorderRadius.circular(
                        getProportionateScreenWidth(24.0))),
                child: Padding(
                  padding: EdgeInsets.all(getProportionateScreenWidth(24.0)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(noteMenu,
                          style: TextStyle(fontSize: 20, color: textColor1)),
                      SizedBox(
                        height: getProportionateScreenHeight(8.0),
                      ),
                      Text(
                        subAdminNote,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
