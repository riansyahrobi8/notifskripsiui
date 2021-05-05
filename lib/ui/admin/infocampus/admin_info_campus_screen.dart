import 'package:flutter/material.dart';
import 'package:notifskripsiui/ui/admin/infocampus/admin_info_campus_body.dart';
import 'package:notifskripsiui/utils/constanta_colors.dart';
import 'package:notifskripsiui/utils/constanta_strings.dart';
import 'package:notifskripsiui/utils/size_config.dart';

class AdminInfoCampusScreen extends StatefulWidget {
  @override
  _AdminInfoCampusScreenState createState() => _AdminInfoCampusScreenState();
}

class _AdminInfoCampusScreenState extends State<AdminInfoCampusScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(homeMenu),
        ),
        floatingActionButton: FloatingActionButton(
          elevation: 0,
          onPressed: () {
            showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (BuildContext context) => SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(24.0, 24.0, 24.0,
                            MediaQuery.of(context).viewInsets.bottom),
                        child: buildForm(),
                      ),
                    ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft:
                            Radius.circular(getProportionateScreenWidth(16.0)),
                        topRight: Radius.circular(
                            getProportionateScreenWidth(16.0)))));
          },
          backgroundColor: accentColor,
          child: Icon(
            Icons.add,
            color: textColor1,
          ),
        ),
        body: AdminInfoCampusBody());
  }

  Widget buildForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          add,
          style: TextStyle(fontSize: 20.0, color: textColor1),
        ),
        Text(
          "Apa saja mengenai $homeMenu",
          style: TextStyle(fontSize: 12.0),
        ),
        SizedBox(
          height: getProportionateScreenWidth(36.0),
        ),
        Form(
            child: TextFormField(
          keyboardType: TextInputType.text,
          decoration: buildInputDecoration(titleInfoCampusHint),
          style: TextStyle(color: textColor2),
        )),
        SizedBox(
          height: getProportionateScreenWidth(16.0),
        ),
        Form(
            child: TextFormField(
          keyboardType: TextInputType.multiline,
          maxLines: 8,
          decoration: buildInputDecorationArea(contentInfoCampusHint),
          style: TextStyle(color: textColor2),
        )),
        SizedBox(
          height: getProportionateScreenWidth(24.0),
        ),
        SizedBox(
          width: double.infinity,
          child: RaisedButton(
              onPressed: () {
                // do something
              },
              color: accentColor,
              elevation: 0.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(1000.0)),
              padding: EdgeInsets.symmetric(
                vertical: getProportionateScreenWidth(24.0),
              ),
              child: Center(
                child: Text(
                  add,
                  style: TextStyle(color: textColor1, fontSize: 18.0),
                ),
              )),
        ),
        SizedBox(
          height: getProportionateScreenWidth(24.0),
        ),
      ],
    );
  }

  InputDecoration buildInputDecoration(String type) {
    return InputDecoration(
        contentPadding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(36.0),
            vertical: getProportionateScreenWidth(24.0)),
        filled: true,
        fillColor: textFieldAndCardColor,
        border: InputBorder.none,
        hintText: type,
        hintStyle: TextStyle(fontSize: 14, color: textColor2),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(1000.0),
            borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(1000.0),
            borderSide: BorderSide.none));
  }

  InputDecoration buildInputDecorationArea(String type) {
    return InputDecoration(
        contentPadding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(36.0),
            vertical: getProportionateScreenWidth(24.0)),
        filled: true,
        fillColor: textFieldAndCardColor,
        border: InputBorder.none,
        hintText: type,
        hintStyle: TextStyle(fontSize: 14, color: textColor2),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24.0),
            borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24.0),
            borderSide: BorderSide.none));
  }
}
