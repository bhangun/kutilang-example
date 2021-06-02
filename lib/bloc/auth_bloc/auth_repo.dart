import 'dart:async';


enum AuthStatus { unknown, authenticated, unauthenticated }

class AuthRepository {
  var _controller = StreamController<AuthStatus>();

  Stream<AuthStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield AuthStatus.unauthenticated;
    yield* _controller.stream;
  }

  Future<void> login(
      {required String username,
      required String password,
      bool rememberMe = false}) async {
    await Future.delayed(
      const Duration(milliseconds: 300),
      () => _controller.add(AuthStatus.authenticated),
    );
  }

  void logout() {
    _controller.add(AuthStatus.unauthenticated);
  }

  void dispose() => _controller.close();
  void checkAuthentication() {
    //dispatch(CheckAuthentication());
  }

  void onLoginButtonPressed(
      {required String username,
      required String password,
      required bool rememberMe}) {
    // dispatch(
    /* LoginButtonPressed(
        username: username,
        password: password,
        rememberMe: rememberMe
    //  ),
    ); */
  }

  rememberMe() {
    // dispatch(RememberMe());
  }

  void onLogin({required String token}) {
    //dispatch(LoggedIn(token: token));
  }

  void onLogout() {
    // dispatch(LoggedOut());
  }

  /* Future<void> _deleteToken() async {
    //removePrefs(TOKEN);
  } */



  /* Future<bool> _hasToken() async {
    bool _isTrue = false;
    //prefs(TOKEN).then((v)=> _isTrue=v.isNotEmpty);
    return _isTrue;
  } */

  /* Future<String> _login(
      String username, String password, bool rememberMe) async {
    var body = jsonEncode(
        {"username": username, "password": password, "rememberMe": rememberMe});
    try {
      //final response = await restPost("authenticate", body);
      return json.decode(body)["id_token"];
    } catch (e) {
      return e.toString();
    }
  } */
}
