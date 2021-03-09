import 'dart:async';
import 'dart:convert';

// import 'package:f_logs/f_logs.dart';

import '../modules/account/models/user_model.dart';
import '../utils/config.dart';
import '../utils/helper.dart';
import 'local/local_storage.dart';
import 'network/rest_error_util.dart';
import 'network/rest_services.dart';

class AuthServices {
  static const _API_ACCOUNT = 'account';

  static const _PROFILE = 'profile';

// POST changePassword
  static const _API_ACCOUNT_CHANGE_PASSWORD = "account/change-password";

//POST finishPasswordReset
  static const _API_ACCOUNT_RESET_FINISH = "account/reset-password/finish";

// POST requestPasswordReset
  static const _API_ACCOUNT_RESET_INIT = "account/reset-password/init";

// GET activateAccount
  static const _API_ACTIVATE = "activate";

// POST registerAccount
  static const _API_REGISTER = "register";

// GET getActiveProfiles
  static const _API_PROFILE_INFO = "profile-info";

// POST authorize
//GET isAuthenticated
  static const _API_USERS_AUTHENTICATE = "authenticate";

// GET getAuthorities
  static const _API_USERS_AUTHORITIES = "users/authorities";

  /* static Future<bool> login(String _username, String _password,
      [bool _rememberMe = false]) async {
    var body = jsonEncode({
      "username": _username,
      "password": _password,
      "rememberMe": _rememberMe
    });
    bool result = false;
    try {
      await RestServices.post(_API_USERS_AUTHENTICATE, body)
          .then((d) => _saveToken(d), onError: (e) => {print(e.toString())});
      if (await AppStorage.fetch(AUTH_TOKEN) != null) {
        result = true;
       // FLog.info(text: "Token saved!");
      }
    } catch (e) {
      // FLog.error(text: DioErrorUtil.handleError(e));
    }
    return result;
  }

  static void logout() {
     AppStorage.delete(AUTH_TOKEN);
  }

  static bool _saveToken(token) {
    String _token = token['id_token'];
    if (_token != null) {
      AppStorage.put(AUTH_TOKEN, _token);
      return true;
    } else
      return false;
  }

  static changePassword(String currentPassword, String newPassword) async {
    var body = '{"currentPassword": "$currentPassword","newPassword": "$newPassword"}';
    await RestServices.post(_API_ACCOUNT_CHANGE_PASSWORD, body);
  }

  static authorities() async{
    return await RestServices.fetch(_API_USERS_AUTHORITIES);
  }

  static activate(String key) async {
    var body=" ?key=";
     await RestServices.post(_API_ACTIVATE+"?key="+key, body);
  }

  static resetPasswordFinish(String key, String newPassword) async {
     var body = '{"key": "$key","newPassword": "$newPassword"}';
     await RestServices.post(_API_ACCOUNT_RESET_FINISH, body);
  }

  static resetPasswordInit(String email) async {
    await RestServices.post(_API_ACCOUNT_RESET_INIT, email);
  }

  static profileInfo() async {
    var data = await RestServices.fetch(_API_PROFILE_INFO);
    User user = User.fromJson(json.decode(data.toString()));
    return user;
  }

  static register(String login, String email, String password, String langkey) async{
    var body = '{ $login, $email, $password, $langkey }';
    await RestServices.post(_API_REGISTER, body);
  }

  List<User> usersData(String data) {
    final parsed = json.decode(data).cast<Map<String, dynamic>>();
    List<User> lu = parsed.map<User>((json) => User.fromJson(json)).toList();
    return lu;
  }

  Future<User> userProfile() async {
    String profile = await prefs(_PROFILE);
    return User.fromJson(json.decode(profile));
  } */
}
