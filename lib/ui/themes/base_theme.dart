import 'package:flutter/material.dart';

ThemeData getBaseTheme() {
  return ThemeData(
    primaryColor: Colors.purple,
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        primary: Colors.white,
        backgroundColor: Colors.purple,
      ),
    ),
  );
}
