import 'package:flutter/material.dart';
import 'package:notifskripsiui/utils/size_config.dart';

class ScheduleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Center(
        child: Text("Schedule"),
      ),
    );
  }
}
