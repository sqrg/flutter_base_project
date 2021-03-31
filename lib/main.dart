import 'package:flutter/material.dart';

import 'package:overlay_support/overlay_support.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';

import 'package:flutter_base_project/app.locator.dart';
import 'package:flutter_base_project/app.router.dart';

import 'package:flutter_base_project/core/services/authentication_service.dart';

import 'package:flutter_base_project/ui/dialog_ui_setup.dart';
import 'package:flutter_base_project/ui/themes/dark_theme.dart';
import 'package:flutter_base_project/ui/themes/light_theme.dart';

import 'constants.dart' as Constants;

Future main() async {
  // See: https://stackoverflow.com/a/57775690/2584335
  WidgetsFlutterBinding.ensureInitialized();

  setupLocator();

  await ThemeManager.initialise();

  setupDialogUi();

  bool darkModeSelected = locator<SharedPreferences>().getBool(Constants.DARK_MODE_SELECTED);

  String initialRoute = await locator<AuthenticationService>().isUserAuthenticated() ? Routes.mainView : Routes.loginView;

  runApp(MyApp(
    darkModeSelected: darkModeSelected,
    initialRoute: initialRoute,
  ));
}

class MyApp extends StatelessWidget {
  final bool darkModeSelected;
  final String initialRoute;

  const MyApp({
    Key key,
    this.darkModeSelected,
    this.initialRoute,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ThemeBuilder(
      lightTheme: getLightTheme(),
      darkTheme: getDarkTheme(),
      defaultThemeMode: darkModeSelected ?? false ? ThemeMode.dark : ThemeMode.light,
      builder: (context, theme, darkTheme, themeMode) => OverlaySupport(
        child: MaterialApp(
          title: 'Flutter Base Project',
          theme: theme,
          darkTheme: darkTheme,
          themeMode: themeMode,
          navigatorKey: StackedService.navigatorKey,
          onGenerateRoute: StackedRouter().onGenerateRoute,
          initialRoute: initialRoute,
        ),
      ),
    );
  }
}
