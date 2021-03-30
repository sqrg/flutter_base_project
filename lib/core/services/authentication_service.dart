import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:flutter_base_project/app.locator.dart';

import 'package:flutter_base_project/core/api/api_client.dart';

import 'package:flutter_base_project/constants.dart' as Constants;

class AuthenticationService {
  FlutterSecureStorage _secureStorage = locator<FlutterSecureStorage>();
  ApiClient _apiClient = locator<ApiClient>();

  Future<bool> isUserAuthenticated() async {
    var token = await _secureStorage.read(key: Constants.API_TOKEN);

    return token != null;
  }

  Future login(String username, String password) async {}
}
