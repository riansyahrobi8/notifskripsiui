import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:notifskripsiui/routing/constanta_route.dart';
import 'package:notifskripsiui/utils/constanta_colors.dart';
import 'package:notifskripsiui/utils/constanta_strings.dart';
import 'package:notifskripsiui/utils/size_config.dart';

class LoginBody extends StatelessWidget {
  final String user = "Adin";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(getProportionateScreenWidth(36.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: getProportionateScreenHeight(36.0),
          ),
          Text(
            welcome,
            style: TextStyle(
                color: textColor1, fontSize: 44.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: getProportionateScreenHeight(24.0),
          ),
          Text(
            subWelcome,
            style: TextStyle(fontSize: 18.0),
          ),
          SizedBox(
            height: getProportionateScreenHeight(36.0),
          ),
          Form(
              child: TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: buildInputDecoration(emailHint),
            style: TextStyle(color: textColor2),
          )),
          SizedBox(
            height: getProportionateScreenHeight(16.0),
          ),
          Form(
              child: TextFormField(
            keyboardType: TextInputType.text,
            obscureText: true,
            decoration: buildInputDecoration(passHint),
            style: TextStyle(color: textColor2),
          )),
          SizedBox(
            height: getProportionateScreenHeight(16.0),
          ),
          SizedBox(
            width: double.infinity,
            child: RaisedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(
                    context, user == "Admin" ? dashboard : home);
              },
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
                    btnLogin,
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
          Spacer(),
          Center(
            child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: dontHaveAnAccount,
                    style: TextStyle(
                        fontSize: 12.0,
                        color: textColor1,
                        fontFamily: "Poppins"),
                    children: [
                      TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap =
                                () => Navigator.pushNamed(context, register),
                          text: letsRegister,
                          style: TextStyle(
                              fontSize: 12.0,
                              fontFamily: "Poppins",
                              color: primaryColor,
                              fontWeight: FontWeight.bold))
                    ])),
          )
        ],
      ),
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
