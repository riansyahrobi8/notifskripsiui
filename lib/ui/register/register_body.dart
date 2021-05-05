import 'package:flutter/material.dart';
import 'package:notifskripsiui/utils/constanta_colors.dart';
import 'package:notifskripsiui/utils/constanta_strings.dart';
import 'package:notifskripsiui/utils/size_config.dart';

class RegisterBody extends StatefulWidget {
  @override
  _RegisterBodyState createState() => _RegisterBodyState();
}

class _RegisterBodyState extends State<RegisterBody> {
  List<String> users = [student, teacher];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(36.0)),
          child: Text(
            createAccount,
            style: TextStyle(
                color: textColor1, fontSize: 44.0, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: getProportionateScreenHeight(24.0),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(36.0)),
          child: Text(
            subCreateAccount,
            style: TextStyle(fontSize: 18.0),
          ),
        ),
        SizedBox(
          height: getProportionateScreenHeight(36.0),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(36.0)),
          child: Form(
              child: TextFormField(
            keyboardType: TextInputType.number,
            decoration: buildInputDecoration(nimHint),
            style: TextStyle(color: textColor2),
          )),
        ),
        SizedBox(
          height: getProportionateScreenHeight(16.0),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(36.0)),
          child: Form(
              child: TextFormField(
            keyboardType: TextInputType.name,
            decoration: buildInputDecoration(nameHint),
            style: TextStyle(color: textColor2),
          )),
        ),
        SizedBox(
          height: getProportionateScreenHeight(16.0),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(36.0)),
          child: Form(
              child: TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: buildInputDecoration(emailHint),
            style: TextStyle(color: textColor2),
          )),
        ),
        SizedBox(
          height: getProportionateScreenHeight(16.0),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(36.0)),
          child: Form(
              child: TextFormField(
            keyboardType: TextInputType.text,
            decoration: buildInputDecoration(passHint),
            style: TextStyle(color: textColor2),
          )),
        ),
        SizedBox(
          height: getProportionateScreenHeight(16.0),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(36.0)),
          child: DropdownButtonFormField(
            items: users
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
              chooseType,
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
        ),
        SizedBox(
          height: getProportionateScreenHeight(24.0),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(36.0)),
          child: SizedBox(
            width: double.infinity,
            child: RaisedButton(
              onPressed: () {},
              color: accentColor,
              elevation: 0.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(1000.0)),
              padding: EdgeInsets.only(
                left: getProportionateScreenWidth(36.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    btnRegister,
                    style: TextStyle(color: textColor1, fontSize: 18.0),
                  ),
                  Container(
                    width: getProportionateScreenWidth(56.0),
                    height: getProportionateScreenWidth(56.0),
                    margin: EdgeInsets.all(getProportionateScreenWidth(8.0)),
                    decoration: BoxDecoration(
                        color: primaryColor, shape: BoxShape.circle),
                    child: Icon(
                      Icons.arrow_forward_rounded,
                      color: textColor1,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: getProportionateScreenHeight(36.0),
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
        hintStyle: TextStyle(fontSize: 16, color: textColor2),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(1000.0),
            borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(1000.0),
            borderSide: BorderSide.none));
  }
}
