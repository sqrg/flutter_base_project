// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';

import '';
import 'core/api/api_client.dart';
import 'core/services/authentication_service.dart';

final locator = StackedLocator.instance;

void setupLocator() {
  locator.registerLazySingleton(() => ApiClient());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => ThemeService.getInstance());
  locator.registerLazySingleton(() => AuthenticationService());
}
