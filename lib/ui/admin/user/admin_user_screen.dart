import 'package:flutter/material.dart';
import 'package:notifskripsiui/ui/admin/user/admin_user_body.dart';
import 'package:notifskripsiui/utils/constanta_strings.dart';
import 'package:notifskripsiui/utils/size_config.dart';

class AdminUserScreen extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldStateKey;

  const AdminUserScreen({Key key, this.scaffoldStateKey}) : super(key: key);

  @override
  _AdminUserScreenState createState() =>
      _AdminUserScreenState(scaffoldStateKey);
}

class _AdminUserScreenState extends State<AdminUserScreen> {
  final GlobalKey<ScaffoldState> _scaffoldStateKey;

  _AdminUserScreenState(this._scaffoldStateKey);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      key: _scaffoldStateKey,
      appBar: AppBar(
        title: Text(userMenu),
      ),
      body: AdminUserBody(),
    );
  }
}
