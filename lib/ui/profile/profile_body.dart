import 'package:flutter/material.dart';
import 'package:notifskripsiui/utils/constanta_colors.dart';
import 'package:notifskripsiui/utils/size_config.dart';

class ProfileBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(getProportionateScreenWidth(24.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(1000.0),
              child: Image.asset(
                "assets/images/profile.png",
                width: getProportionateScreenWidth(144.0),
                height: getProportionateScreenWidth(144.0),
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(36.0),
            ),
            Text(
              "Opri Nasrullah",
              style: TextStyle(
                  color: textColor1,
                  fontSize: 36.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: getProportionateScreenHeight(4.0),
            ),
            Text(
              "195410177",
              style: TextStyle(color: textColor2, fontSize: 18.0),
            ),
            SizedBox(
              height: getProportionateScreenHeight(8.0),
            ),
            Text(
              "oprinasrullah@gmail.com",
              style: TextStyle(color: textColor2, fontSize: 18.0),
            )
          ],
        ),
      ),
    );
  }
}
