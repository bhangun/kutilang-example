
import 'dart:async';
import 'dart:convert';

import 'auth_bloc.dart';
import 'auth_event.dart';

class AuthenticationRepository {
  var _controller ;//= StreamController<AuthenticationStatus>();

  void checkAuthentication() {
    //dispatch(CheckAuthentication());
  }

  void onLoginButtonPressed({required String username, required String password, required bool rememberMe}) {
   // dispatch(
      /* LoginButtonPressed(
        username: username,
        password: password,
        rememberMe: rememberMe
    //  ),
    ); */
  }

   rememberMe(){
   // dispatch(RememberMe());
  }

  void onLogin({required String token}) {
    //dispatch(LoggedIn(token: token));
  }

  void onLogout() {
   // dispatch(LoggedOut());
  }


  Future<void> _deleteToken() async {
   //removePrefs(TOKEN);
  }

  Future<void> _persistToken(String token) async {
    //setPrefs(TOKEN,token);
  }

  Future<bool> _hasToken() async {
    bool _isTrue=false;
    //prefs(TOKEN).then((v)=> _isTrue=v.isNotEmpty);
    return _isTrue;
    
  }

  Future<String> _login(String username, String password, bool rememberMe) async {
    var body = jsonEncode(
        {"username": username, "password": password, "rememberMe": rememberMe});
    try {
      //final response = await restPost("authenticate", body);
      return json.decode(body)["id_token"];
      
    }catch(e){
      return e.toString();
    }
  }

}