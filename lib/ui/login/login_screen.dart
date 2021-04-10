import 'package:flutter/material.dart';
import 'package:notifskripsiui/ui/login/login_body.dart';
import 'package:notifskripsiui/utils/size_config.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: LoginBody(),
    );
  }
}
