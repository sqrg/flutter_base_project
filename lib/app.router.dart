// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'ui/views/debug/debug_view.dart';
import 'ui/views/login_view.dart';
import 'ui/views/main_view.dart';

class Routes {
  static const String debugView = '/';
  static const String loginView = '/login-view';
  static const String mainView = '/main-view';
  static const all = <String>{
    debugView,
    loginView,
    mainView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.debugView, page: DebugView),
    RouteDef(Routes.loginView, page: LoginView),
    RouteDef(Routes.mainView, page: MainView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    DebugView: (data) {
      var args = data.getArgs<DebugViewArguments>(
        orElse: () => DebugViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => DebugView(key: args.key),
        settings: data,
      );
    },
    LoginView: (data) {
      var args = data.getArgs<LoginViewArguments>(
        orElse: () => LoginViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => LoginView(key: args.key),
        settings: data,
      );
    },
    MainView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => MainView(),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// DebugView arguments holder class
class DebugViewArguments {
  final Key key;
  DebugViewArguments({this.key});
}

/// LoginView arguments holder class
class LoginViewArguments {
  final Key key;
  LoginViewArguments({this.key});
}
