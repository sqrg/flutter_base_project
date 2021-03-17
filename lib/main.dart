import 'package:flutter/material.dart';

import 'package:flutter_base_project/app.locator.dart';
import 'package:flutter_base_project/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

void main() {
  setupLocator();

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
