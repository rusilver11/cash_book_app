import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'constants.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: "Muli",
    textTheme: textTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    appBarTheme: appBarTheme(),
    inputDecorationTheme: inputDecorationTheme(),
  );
}

TextTheme textTheme() {
  return const TextTheme(
    bodyText1: TextStyle(color: kTextColor),
    bodyText2: TextStyle(color: kTextColor),
  );
}

InputDecorationTheme inputDecorationTheme() {

  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
        borderRadius: BorderRadius.circular(24),
        borderSide: BorderSide(color: Color.fromRGBO(33, 37, 47, 0.65)),
        gapPadding: 10);

  return  InputDecorationTheme(
    contentPadding: EdgeInsets.symmetric(horizontal: 42, vertical: 20),
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    border: outlineInputBorder
  );
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(
    color: Colors.white,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.black),
    titleTextStyle: TextStyle(color: Color.fromRGBO(139, 139, 139, 1), fontSize: 18),
    systemOverlayStyle: SystemUiOverlayStyle.dark
  );
}
