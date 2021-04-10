import 'package:flutter/material.dart';
import 'package:notifskripsiui/ui/profile/profile_body.dart';
import 'package:notifskripsiui/utils/size_config.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(),
      body: ProfileBody(),
    );
  }
}
