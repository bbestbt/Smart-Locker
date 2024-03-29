import 'package:flutter/material.dart';
import 'package:locker/constants.dart';

ThemeData theme() {
  return ThemeData(
    cursorColor:Color(0xFF6F35A5),
    scaffoldBackgroundColor: Colors.white,
    fontFamily: "Poppins",
    appBarTheme: appBarTheme(),
    textTheme: textTheme(),
    inputDecorationTheme: inputDecorationTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(28),
    borderSide: BorderSide(color:  Color(0xFF757575)),
    gapPadding: 10,
  );
  return InputDecorationTheme(
    // floatingLabelBehavior:FloatingLabelBehavior.always ,
    contentPadding: EdgeInsets.symmetric(horizontal: 42, vertical: 20),
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    border: outlineInputBorder,
  );
}

TextTheme textTheme() {
  return TextTheme(
    bodyText1: TextStyle(color:  Color(0xFF757575)),
    bodyText2: TextStyle(color:  Color(0xFF757575)),
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    color: Colors.white,
    elevation: 0,
    brightness: Brightness.light,
    iconTheme: IconThemeData(color: Colors.black),
    textTheme:
        TextTheme(headline6: TextStyle(color: Color(0XFF8B8B8B), fontSize: 18)),
  );
}
