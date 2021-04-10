import 'package:flutter/material.dart';
import 'package:notifskripsiui/ui/register/register_body.dart';
import 'package:notifskripsiui/utils/size_config.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(),
      body: RegisterBody(),
    );
  }
}
