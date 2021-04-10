import 'package:flutter/material.dart';
import 'package:notifskripsiui/ui/note/note_body.dart';
import 'package:notifskripsiui/utils/size_config.dart';

class NoteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: NoteBody(),
    );
  }
}
