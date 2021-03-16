import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:kutilang_example/services/apps_routes.dart';
import 'package:kutilang_example/services/auth_jwt_services.dart';
import 'package:kutilang_example/services/navigation.dart';

import 'auth_event.dart';
import 'auth_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc(AuthenticationState? state) : super(state!);

  final _controller = StreamController<AuthStatus>();

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event) async* {
    if (event is CheckAuthentication) {
      print('CheckAuthentication');
      yield (await _hasToken())
          ? AuthenticationState.authenticated()
          : AuthenticationState.unauthenticated();
    }

    if (event is LoginButtonPressed) {
      print('LoginButtonPressed');
      yield (await processingLogin())
          ? AuthenticationState.authenticated()
          : AuthenticationState.unauthenticated();
    }

    if (event is LoggedIn) {
      print('LoggedIn');
      await _persistToken(event.token);
      yield AuthenticationState.authenticated();
    }

    if (event is LoggedOut) {
      print('LoggedOut');
      await _deleteToken();
      yield AuthenticationState.unauthenticated();
    }

    if (event is ClickRememberMe) {
  
    }
  }

  @override
  Future<void> close() {
    // _authStatusSubscription.cancel();
    _controller.close();
    return super.close();
  }

  AuthStatus status = AuthStatus.initialize;

  Future<bool> processingLogin() async {
    bool v = await AuthServices.login(username, password, rememberMe);
    // if(v)NavigationServices.navigateTo(AppsRoutes.home);
    print('>>>>>>>>'+ v.toString());
    return v;
  }

 


  void setUserId(String value) {
    print('>>> ' + value);
    username = value;
    _validateUserEmail(value);
  }

  void setPassword(String value) {
    password = value;
    _validatePassword(value);
  }

  void setConfirmPassword(String value) {
    confirmPassword = value;
  }

  void _validateUserEmail(String value) {
    // Regex for email validation
    String p = "[a-zA-Z0-9\+\.\_\%\-\+]{1,256}" +
        "\\@" +
        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
        "(" +
        "\\." +
        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
        ")+";

    RegExp regExp = new RegExp(p);

    if (value.isEmpty) {
      userMessage = "Email can't be empty";
    } else if (regExp.hasMatch(value)) {
    } else
      userMessage = '';
    /* else if (!isEmail(value)) {
      userMessage = 'Please enter a valid email address';
    } */
    /*else {

      showError = true;
      errorMessage = 'Email provided isn\'t valid.Try another email address';
    }*/
  }

  void _validatePassword(String value) {
    if (value.isEmpty) {
      passwordMessage = "Password can't be empty";
    } /* else if (value.length < 6) {
      password = "Password must be at-least 6 characters long";
    }  */
    else {
      passwordMessage = '';
    }
  }

  Future<void> _persistToken(String token) async {
    //setPrefs(TOKEN,token);
  }

  Future<void> _deleteToken() async {
    //removePrefs(TOKEN);
  }

  Future<bool> _hasToken() async {
    bool _isTrue = false;
    //prefs(TOKEN).then((v)=> _isTrue=v.isNotEmpty);
    return _isTrue;
  }

  String username = '';

  String userMessage = '';

  String password = '';

  String passwordMessage = '';

  String confirmPassword = '';

  String confirmPasswordMessage = '';

  bool success = false;

  bool loggedIn = false;

  bool loading = false;

  bool rememberMe = false;

  String errorMessage = 'error';

  bool showError = false;

  Future register() async {
    loading = true;
  }

  Future gotoHome() async {
    // FLog.info(text: "Redirect to home!");
    if (loggedIn) NavigationServices.navigateTo(AppsRoutes.home);
  }

  void _loggedin(value) {
    try {
      NavigationServices.navigateTo(AppsRoutes.home);
      if (value) {
        print(value);
        // FLog.info(text: "Success login!");
        NavigationServices.navigateTo(AppsRoutes.home);
        loggedIn = true;
        loading = false;
        success = true;
      } else if (value.toString().contains("Unauthorized")) {
        showError = true;
        errorMessage = "Username and password doesn't match";
        loading = false;
      } else {
        showError = true;
        errorMessage =
            "Something went wrong, please check your network and try again";
        loading = false;
      }
    } catch (e) {
      showError = true;
      errorMessage =
          "Something went wrong, please check your network and try again";
      loading = false;
      // FLog.info(text:e.toString());
    }
  }

  
  Future forgotPassword() async {
    loading = true;
  }

  Future logout() async {
    print('<><><><:<:<:<:>');
    AuthenticationState.unauthenticated();
   
    //await AuthServices.logout();
    
    
  }

/*   Future<String> _isRole(){
   // isRole(ADMIN);
  } */

}