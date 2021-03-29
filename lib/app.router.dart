// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'ui/views/debug/debug_view.dart';
import 'ui/views/main_view.dart';

class Routes {
  static const String debugView = '/';
  static const String mainView = '/main-view';
  static const all = <String>{
    debugView,
    mainView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.debugView, page: DebugView),
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
