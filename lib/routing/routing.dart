import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notifskripsiui/routing/constanta_route.dart';
import 'package:notifskripsiui/ui/admin/dashboard/dashboard_screen.dart';
import 'package:notifskripsiui/ui/admin/infocampus/admin_info_campus_screen.dart';
import 'package:notifskripsiui/ui/admin/note/admin_note_screen.dart';
import 'package:notifskripsiui/ui/admin/schedule/admin_schedule_screen.dart';
import 'package:notifskripsiui/ui/admin/user/admin_user_screen.dart';
import 'package:notifskripsiui/ui/home/home_screen.dart';
import 'package:notifskripsiui/ui/login/login_screen.dart';
import 'package:notifskripsiui/ui/note/note_screen.dart';
import 'package:notifskripsiui/ui/profile/profile_screen.dart';
import 'package:notifskripsiui/ui/register/register_screen.dart';
import 'package:notifskripsiui/ui/schedule/schedule_screen.dart';
import 'package:notifskripsiui/ui/splash/splash_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case register:
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      case home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case dashboard:
        return MaterialPageRoute(builder: (_) => DashboardScreen());
      case adminInfoCampus:
        return MaterialPageRoute(builder: (_) => AdminInfoCampusScreen());
      case adminNote:
        return MaterialPageRoute(builder: (_) => AdminNoteScreen());
      case adminSchedule:
        return MaterialPageRoute(builder: (_) => AdminScheduleScreen());
      case adminUser:
        return MaterialPageRoute(builder: (_) => AdminUserScreen());
      case schedule:
        return MaterialPageRoute(builder: (_) => ScheduleScreen());
      case note:
        return MaterialPageRoute(builder: (_) => NoteScreen());
      case profile:
        return MaterialPageRoute(builder: (_) => ProfileScreen());
      default:
        return MaterialPageRoute(builder: (_) => SplashScreen());
    }
  }
}
