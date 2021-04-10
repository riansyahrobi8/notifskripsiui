import 'package:flutter/material.dart';
import 'package:notifskripsiui/utils/constanta_colors.dart';
import 'package:notifskripsiui/utils/size_config.dart';

class SplashBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: -72.0,
          right: -120.0,
          child: Container(
            width: getProportionateScreenWidth(280.0),
            height: getProportionateScreenWidth(280.0),
            decoration:
                BoxDecoration(color: primaryColor, shape: BoxShape.circle),
          ),
        ),
        Center(
          child: Text(
            "My App",
            style: TextStyle(
                color: textColor1, fontSize: 44.0, fontWeight: FontWeight.bold),
          ),
        ),
        Positioned(
          left: -72.0,
          bottom: -120.0,
          child: Container(
            width: getProportionateScreenWidth(280.0),
            height: getProportionateScreenWidth(280.0),
            decoration:
                BoxDecoration(color: primaryColor, shape: BoxShape.circle),
          ),
        ),
      ],
    );
  }
}
