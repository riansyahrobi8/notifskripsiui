import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';
import 'package:notifskripsiui/ui/admin/schedule/admin_schedule_body.dart';
import 'package:notifskripsiui/utils/constanta_colors.dart';
import 'package:notifskripsiui/utils/constanta_strings.dart';
import 'package:notifskripsiui/utils/size_config.dart';

class AdminScheduleScreen extends StatefulWidget {
  @override
  _AdminScheduleScreenState createState() => _AdminScheduleScreenState();
}

class _AdminScheduleScreenState extends State<AdminScheduleScreen> {
  GlobalKey<AutoCompleteTextFieldState<String>> key = new GlobalKey();
  List<String> places = [
    "U.2.1",
    "U.2.2",
    "S.2.1",
    "U.2.3",
    "S.2.3",
    "B.1.1",
    "T.3.1",
    "T.3.2",
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(scheduleMenu),
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
                      topRight:
                          Radius.circular(getProportionateScreenWidth(16.0)))));
        },
        backgroundColor: accentColor,
        child: Icon(
          Icons.add,
          color: textColor1,
        ),
      ),
      body: AdminScheduleBody(),
    );
  }

  Widget buildForm() {
    var _suggestionEditingController = TextEditingController();

    List<String> suggestionList = [
      "155410100",
      "155410101",
      "155410102",
      "155410103",
      "155410104",
      "155410105",
      "155410106",
      "155410107",
      "155410108",
      "155410109",
      "155410110"
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          add,
          style: TextStyle(fontSize: 20.0, color: textColor1),
        ),
        Text(
          "$scheduleMenu untuk mahasiswa yang ingin melakukan seminar",
          style: TextStyle(fontSize: 12.0),
        ),
        SizedBox(
          height: getProportionateScreenWidth(36.0),
        ),
        Form(
            child: AutoCompleteTextField(
          key: key,
          controller: _suggestionEditingController,
          suggestions: suggestionList,
          clearOnSubmit: false,
          itemFilter: (item, query) {
            return item.toLowerCase().startsWith(query.toLowerCase());
          },
          itemSorter: (a, b) {
            return a.compareTo(b);
          },
          itemSubmitted: (item) {
            _suggestionEditingController.text = item;
          },
          itemBuilder: (context, item) {
            return Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(24.0)),
              child: Row(
                children: [
                  Text(
                    item,
                  )
                ],
              ),
            );
          },
          keyboardType: TextInputType.number,
          decoration: buildInputDecoration(searchStudent),
          style: TextStyle(color: textColor2),
        )),
        SizedBox(
          height: getProportionateScreenWidth(16.0),
        ),
        Form(
            child: TextFormField(
          keyboardType: TextInputType.text,
          decoration: buildInputDecoration(titleScheduleHint),
          style: TextStyle(color: textColor2),
        )),
        SizedBox(
          height: getProportionateScreenWidth(16.0),
        ),
        Form(
            child: TextFormField(
          keyboardType: TextInputType.text,
          decoration: buildInputDecoration(textTeacher1),
          style: TextStyle(color: textColor2),
        )),
        SizedBox(
          height: getProportionateScreenWidth(16.0),
        ),
        Form(
            child: TextFormField(
          keyboardType: TextInputType.text,
          decoration: buildInputDecoration(textTeacher2),
          style: TextStyle(color: textColor2),
        )),
        SizedBox(
          height: getProportionateScreenWidth(16.0),
        ),
        DropdownButtonFormField(
          items: places
              .map((String value) => DropdownMenuItem(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(color: textColor2),
                  )))
              .toList(),
          onChanged: (_) {},
          elevation: 0,
          iconDisabledColor: primaryColor,
          iconEnabledColor: primaryColor,
          focusColor: textFieldAndCardColor,
          hint: Text(
            choosePlace,
            style: TextStyle(color: textColor2),
          ),
          decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(36.0),
                  vertical: getProportionateScreenWidth(24.0)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(1000.0),
              ),
              filled: true,
              fillColor: textFieldAndCardColor),
        ),
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
}
