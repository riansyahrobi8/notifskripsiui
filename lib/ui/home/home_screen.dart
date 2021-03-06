import 'package:flutter/material.dart';
import 'package:notifskripsiui/routing/constanta_route.dart';
import 'package:notifskripsiui/ui/home/home_body.dart';
import 'package:notifskripsiui/ui/note/note_screen.dart';
import 'package:notifskripsiui/ui/schedule/schedule_screen.dart';
import 'package:notifskripsiui/utils/constanta_colors.dart';
import 'package:notifskripsiui/utils/constanta_strings.dart';
import 'package:notifskripsiui/utils/size_config.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 1;

  final _listPage = <Widget>[
    ScheduleScreen(),
    HomeBody(),
    NoteScreen(),
  ];

  final List<String> title = [scheduleMenu, homeM, noteMenu];

  final _bottomNavBarItems = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
        icon: Icon(
          Icons.calendar_today_rounded,
          size: 16.0,
        ),
        label: scheduleMenu),
    BottomNavigationBarItem(
        icon: Icon(Icons.info_outline_rounded, size: 20.0), label: homeM),
    BottomNavigationBarItem(
        icon: Icon(Icons.receipt_long_rounded, size: 18.0), label: noteMenu),
  ];

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
              _currentIndex == 0
                  ? scheduleMenu
                  : _currentIndex == 1
                      ? homeM
                      : noteMenu,
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
      body: SafeArea(child: _listPage[_currentIndex]),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(24.0),
            vertical: getProportionateScreenWidth(16.0)),
        child: Container(
          height: getProportionateScreenWidth(72.0),
          color: Colors.transparent,
          child: ClipRRect(
            borderRadius:
                BorderRadius.circular(getProportionateScreenWidth(36)),
            child: BottomNavigationBar(
              backgroundColor: textFieldAndCardColor,
              elevation: 4,
              currentIndex: _currentIndex,
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              selectedItemColor: primaryColor,
              unselectedItemColor: textColor2,
              items: _bottomNavBarItems,
            ),
          ),
        ),
      ),
    );
  }
}
