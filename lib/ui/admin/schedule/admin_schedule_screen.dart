import 'package:flutter/material.dart';
import 'package:notifskripsiui/ui/admin/schedule/admin_schedule_body.dart';
import 'package:notifskripsiui/utils/constanta_colors.dart';
import 'package:notifskripsiui/utils/constanta_strings.dart';
import 'package:notifskripsiui/utils/size_config.dart';

class AdminScheduleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(scheduleMenu),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // do something
        },
        backgroundColor: accentColor,
        child: Icon(
          Icons.add,
          color: textColor1,
        ),
      ),
      body: AdminScheduleBody(),
    );
  }
}
