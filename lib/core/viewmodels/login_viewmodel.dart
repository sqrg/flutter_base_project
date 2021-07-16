import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:stacked/stacked.dart';

import 'package:flutter_base_project/app.locator.dart';
import 'package:flutter_base_project/core/services/authentication_service.dart';

import 'package:flutter_base_project/constants.dart' as Constants;

class LoginViewModel extends BaseViewModel {
  FlutterSecureStorage _secureStorage = locator<FlutterSecureStorage>();

  AuthenticationService _authenticationService = locator<AuthenticationService>();

  Future login(String username, String password) async {
    setBusy(true);

    await _authenticationService.login(username, password);

    if (true) {
      await _secureStorage.write(key: Constants.API_TOKEN, value: '');
      return true;
    }

    setBusy(false);

    return false;
  }
}
