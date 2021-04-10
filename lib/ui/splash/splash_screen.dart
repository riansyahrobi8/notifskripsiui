import 'dart:async';

import 'package:flutter/material.dart';
import 'package:notifskripsiui/routing/constanta_route.dart';
import 'package:notifskripsiui/ui/splash/splash_body.dart';
import 'package:notifskripsiui/utils/size_config.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final int splashDelay = 4;

  void navigateToPage() {
    Navigator.pushReplacementNamed(context, login);
  }

  Timer _loadWidget() {
    var _duration = Duration(seconds: splashDelay);
    return Timer(_duration, navigateToPage);
  }

  @override
  void initState() {
    super.initState();
    _loadWidget();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SplashBody(),
    );
  }
}
