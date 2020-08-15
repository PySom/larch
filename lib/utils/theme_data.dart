import 'package:flutter/material.dart';
import 'package:lagosarchdiocese/utils/constants.dart';

ThemeData myThemeData(BuildContext context) {
  return ThemeData(
    fontFamily: "Poppins",
    primaryColor: kPrimaryColor,
    accentColor: kAccentColor,
    buttonColor: kAccentColor,
    scaffoldBackgroundColor: kPrimaryColor,
    backgroundColor: Colors.white,
    textTheme: TextTheme(
      bodyText2: TextStyle(
          color: kTextColor, fontSize: 16.0, fontWeight: FontWeight.w400),
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Color(0xFFF7F7FB),
      filled: true,
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
            color: kOutlineButtonBorderColor.withOpacity(0.3), width: 0.5),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
            color: kOutlineButtonBorderColor.withOpacity(0.3), width: 0.5),
      ),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: kButtonColor,
      height: 40,
      // minWidth: double.infinity,
      textTheme: ButtonTextTheme.accent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100.0),
      ),
    ),
    canvasColor: Colors.transparent,
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
    appBarTheme: AppBarTheme(
      brightness: Brightness.light,
      elevation: 0,
      color: kAccentColor,
      iconTheme: IconThemeData(color: Colors.white),
      textTheme: TextTheme(
        headline6: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontFamily: "Gotham",
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
  );
}
