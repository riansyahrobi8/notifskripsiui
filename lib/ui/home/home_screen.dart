import 'package:flutter/material.dart';
import 'package:notifskripsiui/ui/home/home_body.dart';
import 'package:notifskripsiui/utils/size_config.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: HomeBody(),
    );
  }
}
