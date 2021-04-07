import 'package:flutter/material.dart';

import 'package:flutter_base_project/ui/themes/base_theme.dart';

ThemeData getLightTheme() {
  ThemeData baseTheme = getBaseTheme();
  
  return ThemeData(
    primaryColor: baseTheme.primaryColor,
    backgroundColor: Colors.white,
    textButtonTheme: baseTheme.textButtonTheme,
  );
}
