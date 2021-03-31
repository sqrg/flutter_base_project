import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';

import 'package:flutter_base_project/ui/views/debug/debug_view.dart';
import 'package:flutter_base_project/ui/views/login_view.dart';
import 'package:flutter_base_project/ui/views/main_view.dart';

import 'package:flutter_base_project/core/api/api_client.dart';
import 'package:flutter_base_project/core/services/authentication_service.dart';
import 'package:flutter_base_project/core/services/overlay_service.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: DebugView, initial: true),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: MainView),
  ],
  dependencies: [
    LazySingleton(classType: ApiClient),
    LazySingleton(classType: AuthenticationService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: FlutterSecureStorage),
    LazySingleton(classType: OverlayService),
    LazySingleton(classType: ThemeService, resolveUsing: ThemeService.getInstance),
    Presolve(classType: SharedPreferences, presolveUsing: SharedPreferences.getInstance),
  ],
)
class AppSetup {}
