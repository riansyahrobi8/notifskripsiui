import 'package:flutter/material.dart';
import 'package:notifskripsiui/routing/constanta_route.dart';
import 'package:notifskripsiui/ui/admin/dashboard/dashboard_body.dart';
import 'package:notifskripsiui/utils/constanta_strings.dart';
import 'package:notifskripsiui/utils/size_config.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              dashboardMenu,
              style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, profile);
              },
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(1000.0),
                  child: Image.asset(
                    "assets/images/profile2.png",
                    width: getProportionateScreenWidth(56.0),
                    height: getProportionateScreenWidth(56.0),
                    fit: BoxFit.cover,
                  )),
            )
          ],
        ),
      ),
      body: DashboardBody(),
    );
  }
}
