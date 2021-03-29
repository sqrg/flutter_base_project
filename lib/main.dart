import 'package:flutter/material.dart';
import 'package:flutter_base_project/ui/dialog_ui_setup.dart';

import 'package:stacked_services/stacked_services.dart';

import 'package:flutter_base_project/app.locator.dart';
import 'package:flutter_base_project/app.router.dart';

void main() {
  setupLocator();

  setupDialogUi();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Base Project',
      // TODO: Work on themes
      /*
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      */
      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: StackedRouter().onGenerateRoute,
    );
  }
}
