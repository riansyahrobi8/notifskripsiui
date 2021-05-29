import 'package:flutter/material.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:notifskripsiui/models/data_model.dart';
import 'package:notifskripsiui/ui/schedule/detail/detail_schedule_screen.dart';
import 'package:notifskripsiui/utils/constanta_colors.dart';
import 'package:notifskripsiui/utils/constanta_strings.dart';
import 'package:notifskripsiui/utils/size_config.dart';

class AdminScheduleBody extends StatefulWidget {
  @override
  _AdminScheduleBodyState createState() =>
      _AdminScheduleBodyState();
}

class _AdminScheduleBodyState extends State<AdminScheduleBody> {
  final DateFormat dateFormat = DateFormat.yMMMMd();
  DateTime _selectedDate;

  final TextEditingController _textDateController = TextEditingController();
  final TextEditingController _suggestionEditingController =
      TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _teacher1Controller = TextEditingController();
  final TextEditingController _teacher2Controller = TextEditingController();
  final TextEditingController _teacher3Controller = TextEditingController();

  final GlobalKey<AutoCompleteTextFieldState<String>> key = GlobalKey();

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

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: getProportionateScreenHeight(24.0),
          ),
          ...List.generate(
              dataAtSchedule.length,
              (index) => Slidable(
                    actionPane: SlidableDrawerActionPane(),
                    secondaryActions: <Widget>[
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              builder: (BuildContext context) =>
                                  SingleChildScrollView(
                                    child: Padding(
                                        padding: EdgeInsets.fromLTRB(
                                            24.0,
                                            24.0,
                                            24.0,
                                            MediaQuery.of(context)
                                                .viewInsets
                                                .bottom),
                                        child: buildForm(
                                            dataAtSchedule[index].title,
                                            dataAtSchedule[index].teacher1,
                                            dataAtSchedule[index].teacher2,
                                            dataAtSchedule[index].teacher3)),
                                  ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(
                                          getProportionateScreenWidth(16.0)),
                                      topRight: Radius.circular(
                                          getProportionateScreenWidth(16.0)))));
                        },
                        child: Container(
                          padding: EdgeInsets.all(24.0),
                          decoration: BoxDecoration(
                              color: primaryColor, shape: BoxShape.circle),
                          child: Icon(Icons.edit_rounded, color: Colors.white),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => showDialog(
                            context: context,
                            builder: (_) => buildAlertDialog()),
                        child: Container(
                          padding: EdgeInsets.all(24.0),
                          decoration: BoxDecoration(
                              color: Colors.red, shape: BoxShape.circle),
                          child: Icon(
                            Icons.delete_forever_rounded,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                    child: buildItemContainer(
                        context,
                        dataAtSchedule[index].name,
                        dataAtSchedule[index].nim,
                        dataAtSchedule[index].title,
                        dataAtSchedule[index].teacher1,
                        dataAtSchedule[index].teacher2,
                        dataAtSchedule[index].teacher3,
                        dataAtSchedule[index].place,
                        dataAtSchedule[index].dateTime),
                  ))
        ],
      ),
    );
  }

  AlertDialog buildAlertDialog() {
    return AlertDialog(
      title: Center(
          child: Container(
        padding: EdgeInsets.all(8.0),
        decoration:
            BoxDecoration(shape: BoxShape.circle, color: Colors.red[100]),
        child: Icon(
          Icons.delete_forever_rounded,
          color: Colors.red,
        ),
      )),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            titleDialogDelete,
            style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: backgroundColor),
          ),
          SizedBox(height: getProportionateScreenWidth(16.0)),
          Text(
            subtitleDialogDelete,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12.0, color: textColor2),
          ),
          SizedBox(height: getProportionateScreenWidth(56.0)),
          Row(
            children: [
              Flexible(
                flex: 1,
                child: RaisedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    elevation: 0.0,
                    visualDensity: VisualDensity.compact,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(1000.0)),
                    padding: EdgeInsets.symmetric(
                      vertical: getProportionateScreenWidth(20.0),
                    ),
                    child: Center(
                      child: Text(
                        cancel,
                        style: TextStyle(color: primaryColor, fontSize: 14.0),
                      ),
                    )),
              ),
              SizedBox(
                width: getProportionateScreenWidth(8.0),
              ),
              Flexible(
                flex: 1,
                child: RaisedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                          "$scheduleMenu berhasil dihapus",
                          style: TextStyle(
                              color: textColor1, fontFamily: "Poppins"),
                        ),
                      ));
                    },
                    color: accentColor,
                    elevation: 0.0,
                    visualDensity: VisualDensity.compact,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(1000.0)),
                    padding: EdgeInsets.symmetric(
                      vertical: getProportionateScreenWidth(20.0),
                    ),
                    child: Center(
                      child: Text(
                        yes,
                        style: TextStyle(color: textColor1, fontSize: 14.0),
                      ),
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }

  GestureDetector buildItemContainer(
      BuildContext context,
      String name,
      String nim,
      String title,
      String teacher1,
      String teacher2,
      String teacher3,
      String place,
      DateTime dateTime) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                fullscreenDialog: true,
                builder: (_) => DetailScheduleScreen(
                      name: name,
                      nim: nim,
                      title: title,
                      teacher1: teacher1,
                      teacher2: teacher2,
                      teacher3: teacher3,
                      place: place,
                      dateTime: dateTime,
                    )));
      },
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(
            left: getProportionateScreenWidth(24.0),
            right: getProportionateScreenWidth(24.0),
            bottom: getProportionateScreenWidth(16.0)),
        decoration: BoxDecoration(
            color: textFieldAndCardColor,
            borderRadius:
                BorderRadius.circular(getProportionateScreenWidth(24.0))),
        child: Padding(
          padding: EdgeInsets.all(getProportionateScreenWidth(24.0)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: textColor1,
                  fontSize: 18.0,
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(8.0),
              ),
              Text(
                nim,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: textColor2, fontSize: 14.0),
              ),
              SizedBox(
                height: getProportionateScreenHeight(16.0),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: textColor2, fontSize: 14.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildForm(
      String title, String teacher1, String teacher2, String teacher3) {
    _titleController.text = title;
    _teacher1Controller.text = teacher1;
    _teacher2Controller.text = teacher2;
    _teacher3Controller.text = teacher3;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          edit,
          style: TextStyle(fontSize: 20.0, color: textColor1),
        ),
        Text(
          "$scheduleMenu untuk mahasiswa yang ingin melakukan seminar",
          style: TextStyle(fontSize: 14.0),
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
          style: TextStyle(color: textColor2, fontSize: 16.0),
        )),
        SizedBox(
          height: getProportionateScreenWidth(16.0),
        ),
        Form(
            child: TextFormField(
          keyboardType: TextInputType.text,
          controller: _titleController,
          decoration: buildInputDecoration(titleScheduleHint),
          style: TextStyle(color: textColor2, fontSize: 16.0),
        )),
        SizedBox(
          height: getProportionateScreenWidth(16.0),
        ),
        Form(
            child: TextFormField(
          onTap: () => _showDialog(),
          readOnly: true,
          keyboardType: TextInputType.text,
          controller: _teacher1Controller,
          decoration: buildInputDecoration(textTeacher1),
          style: TextStyle(color: textColor2, fontSize: 16.0),
        )),
        SizedBox(
          height: getProportionateScreenWidth(16.0),
        ),
        Form(
            child: TextFormField(
          onTap: () => _showDialog(),
          readOnly: true,
          keyboardType: TextInputType.text,
          controller: _teacher2Controller,
          decoration: buildInputDecoration(textTeacher2),
          style: TextStyle(color: textColor2, fontSize: 16.0),
        )),
        SizedBox(
          height: getProportionateScreenWidth(16.0),
        ),
        Form(
            child: TextFormField(
          onTap: () => _showDialog(),
          readOnly: true,
          keyboardType: TextInputType.text,
          controller: _teacher3Controller,
          decoration: buildInputDecoration(textTeacher3),
          style: TextStyle(color: textColor2, fontSize: 16.0),
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
            style: TextStyle(fontSize: 16.0),
            decoration: buildInputDecoration(choosePlace)),
        SizedBox(
          height: getProportionateScreenWidth(16.0),
        ),
        Form(
            child: TextFormField(
                onTap: () {
                  FocusScope.of(context).requestFocus(new FocusNode());
                  _selectDate(context);
                },
                style: TextStyle(color: textColor2, fontSize: 16.0),
                controller: _textDateController,
                focusNode: AlwaysDisabledFocusNode(),
                keyboardType: TextInputType.name,
                decoration: buildInputDecoration(chooseDate))),
        SizedBox(
          height: getProportionateScreenWidth(24.0),
        ),
        SizedBox(
          width: double.infinity,
          child: RaisedButton(
              onPressed: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                    "$scheduleMenu berhasil diubah",
                    style: TextStyle(color: textColor1, fontFamily: "Poppins"),
                  ),
                ));
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
                  save,
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

  void _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            contentPadding: EdgeInsets.all(getProportionateScreenWidth(16.0)),
            titlePadding: EdgeInsets.only(
                right: getProportionateScreenWidth(16.0),
                left: getProportionateScreenWidth(16.0),
                top: getProportionateScreenWidth(16.0)),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  chooseTeacher,
                  style: TextStyle(
                      fontSize: getProportionateScreenWidth(14.0),
                      color: textColor2),
                ),
                SizedBox(height: getProportionateScreenWidth(16.0)),
                Form(
                    child: TextFormField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(16.0),
                          vertical: getProportionateScreenWidth(4.0)),
                      filled: true,
                      fillColor: textColor1,
                      border: InputBorder.none,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              getProportionateScreenWidth(8.0)),
                          borderSide: BorderSide.none),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              getProportionateScreenWidth(8.0)),
                          borderSide: BorderSide.none),
                      hintText: seacrhTeacher,
                      hintStyle: TextStyle(
                          fontSize: getProportionateScreenWidth(16.0),
                          color: textColor2)),
                )),
              ],
            ),
            content: ListView.builder(
                itemCount: 100,
                itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: getProportionateScreenWidth(16.0)),
                      child: Text("Bambang Promosidi",
                          style: TextStyle(
                              color: textColor2,
                              fontSize: getProportionateScreenWidth(16.0))),
                    )),
            actions: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: EdgeInsets.only(
                      right: getProportionateScreenWidth(16.0),
                      bottom: getProportionateScreenWidth(8.0)),
                  child: Text(close,
                      style: TextStyle(
                          color: primaryColor,
                          fontWeight: FontWeight.w700,
                          fontSize: getProportionateScreenWidth(16.0))),
                ),
              ),
            ],
          );
        });
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
        hintStyle: TextStyle(fontSize: 16, color: textColor2),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(1000.0),
            borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(1000.0),
            borderSide: BorderSide.none));
  }

  _selectDate(BuildContext context) async {
    bool _decideWhichDayToEnable(DateTime day) {
      if (day.isAfter(DateTime.now().subtract(Duration(days: 1))) &&
          day.weekday != 6 &&
          day.weekday != 7) {
        return true;
      }
      return false;
    }

    DateTime newSelectedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2021),
        lastDate: DateTime(2100),
        selectableDayPredicate: _decideWhichDayToEnable,
        builder: (context, child) => Theme(
            data: ThemeData.light().copyWith(
              primaryColor: primaryColor,
              accentColor: primaryColor,
              colorScheme: ColorScheme.light(primary: primaryColor),
              buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
            ),
            child: child));
    if (newSelectedDate != null) {
      _selectedDate = newSelectedDate;
      _textDateController
        ..text = DateFormat.yMMMd().format(_selectedDate)
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: _textDateController.text.length,
            affinity: TextAffinity.upstream));
    }
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
