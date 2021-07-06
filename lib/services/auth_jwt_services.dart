import 'dart:async';
import 'dart:convert';

import 'package:f_logs/f_logs.dart';
import 'package:kutilang_example/bloc/auth_bloc/auth_bloc.dart';

//import '../utils/config.dart';
import 'local/database_services.dart';
//import 'local/local_storage.dart';
import 'network/rest_services.dart';

class AuthServices {
  static var _controller = StreamController<AuthStatus>();

  Stream<AuthStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield AuthStatus.unauthenticated;
    yield* _controller.stream;
  }

  /// Path authenticate,
  /// Post authorize & Get isAuthorize
  static Future<bool> login(String _username, String _password,
      [bool _rememberMe = false]) async {
    var body = jsonEncode({
      "username": _username,
      "password": _password,
      "rememberMe": _rememberMe
    });

    FLog.info(text: '<><><>><><><1><><>><><><');
    bool result = false;
    // try {
    FLog.info(text: '<><><>><><><1><1><>><><><');

    /*  RestServices.post('authenticate', body).then((d) => _saveToken(d),
          onError: (e) => {FLog.info(text: e.toString())});
 */

    var data = await RestServices.post('authenticate', body);
    FLog.info(text: data.toString());
    return _saveToken(data);
    //  return true;
    //   FLog.info(text: '<><><>><><><2><><>><><><');

    /* if (await DatabaseServices.db.fetchToken()!='') {
        //result = true;
        _controller.add(AuthStatus.authenticated);
        FLog.info(text: "Token saved!");
      } */
    /*  } catch (e) {
      FLog.info(text: '<><><>><><><3><><>><><><');
      result = true;

      FLog.error(text: e.toString());
    } */
    //FLog.info(text: '<><><>><><><4><><>><><><');
    //_controller.close();
    // return result;
  }

  static Future<String> fetchToken() async {
    String token = await DatabaseServices.db.fetchToken();
    return token;
  }

  static void logout() {
    FLog.debug(text: 'logout');
    // AppStorage.delete(AUTH_TOKEN);
    DatabaseServices.db.deleteToken();
  }

  static bool _saveToken(token) {
    FLog.info(text: token.toString());
    String _token = token['id_token'];
    if (_token != '') {
      DatabaseServices.db.token(_token);
      //AppStorage.put(AUTH_TOKEN, _token);
      return true;
    } else
      return false;
  }

  /// changePassword
  static changePassword(String currentPassword, String newPassword) async {
    var body =
        '{"currentPassword": "$currentPassword","newPassword": "$newPassword"}';
    await RestServices.post('account/change-password', body);
  }

  /// Get getAuthorities
  static authorities() async {
    return await RestServices.fetch('users/authorities');
  }

  /// Path activate
  /// GET activateAccount
  static activate(String key) async {
    var body = " ?key=";
    await RestServices.post('activate' + "?key=" + key, body);
  }

  /// Path account/reset-password/finish
  /// POST finishPasswordReset
  static resetPasswordFinish(String key, String newPassword) async {
    var body = '{"key": "$key","newPassword": "$newPassword"}';
    await RestServices.post('account/reset-password/finish', body);
  }

  /// Path account/reset-password/init
  /// POST requestPasswordReset
  static resetPasswordInit(String email) async {
    await RestServices.post('account/reset-password/init', email);
  }
}
