import 'package:flutter/material.dart';

import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';

import 'package:flutter_base_project/app.locator.dart';
import 'package:flutter_base_project/app.router.dart';

import 'package:flutter_base_project/ui/dialog_ui_setup.dart';
import 'package:flutter_base_project/ui/themes/dark_theme.dart';
import 'package:flutter_base_project/ui/themes/light_theme.dart';

Future main() async {
  setupLocator();

  await ThemeManager.initialise();

  setupDialogUi();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ThemeBuilder(
      lightTheme: getLightTheme(),
      darkTheme: getDarkTheme(),
      defaultThemeMode: ThemeMode.light,
      builder: (context, theme, darkTheme, themeMode) => MaterialApp(
        title: 'Flutter Base Project',
        theme: theme,
        darkTheme: darkTheme,
        themeMode: themeMode,
        navigatorKey: StackedService.navigatorKey,
        onGenerateRoute: StackedRouter().onGenerateRoute,
      ),
    );
  }
}
