// import 'package:f_logs/f_logs.dart';
import '../../modules/administration/services/admin_services.dart';
import '../../services/auth_jwt_services.dart';
import '../../services/apps_routes.dart';
import '../../services/navigation.dart';


class AuthenticationStore{


  
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
  

  //
  bool get canLogin => hasErrorsInLogin; //&& username !='' && password !='';

  bool get canRegister =>
      !hasErrorsInRegister &&
      username.isNotEmpty &&
      password.isNotEmpty &&
      confirmPassword.isNotEmpty;
  
  bool get canForgetPassword =>
      !hasErrorInForgotPassword && username.isNotEmpty;

  // error handling:-------------------------------------------------------------------
  
  bool get hasErrorsInLogin => username != '' || password != '';

  bool get hasErrorsInRegister =>
      username != null || password != null || confirmPassword != null;

  bool get hasErrorInForgotPassword => username != null;

  // actions:-------------------------------------------------------------------

  void setUserId(String value) {
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

    }else userMessage = '';
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
 
  /*void _validateConfirmPassword(String value) {
    if (value.isEmpty) {
      confirmPasswordMessage = "Confirm password can't be empty";
    } else if (value != password) {
      confirmPasswordMessage = "Password doesn't match";
    } else {
      confirmPasswordMessage = null;
    }
    notifyListeners();
  }*/

  
  Future register() async {
    loading = true;
  }

  
  Future gotoHome() async {
    // FLog.info(text: "Redirect to home!");
    if(loggedIn) NavigationServices.navigateTo(AppsRoutes.home);
  }

  void _loggedin(value){
    try{
      if (value){
        // FLog.info(text: "Success login!");
        NavigationServices.navigateTo(AppsRoutes.home);
        loggedIn = true;
        loading = false;
        success = true;

      }else if (value.toString().contains("Unauthorized")){
        showError = true;
        errorMessage =  "Username and password doesn't match";
        loading = false;
      } else {
        showError = true;
        errorMessage =  "Something went wrong, please check your network and try again";
        loading = false;
      }

    } catch (e) {
      showError = true;
      errorMessage =  "Something went wrong, please check your network and try again";
      loading = false;
      // FLog.info(text:e.toString());
    }
  }

  
  login() async{
    loading = true;
    success = false;
    loggedIn = false;
    AuthServices.login(username, password, rememberMe).then((v)=>_loggedin(v));
  }

  
  Future forgotPassword() async {
    loading = true;
  }
  
  
  Future logout() async {
    loading = true;
    //await AuthServices.logout();
    NavigationServices.navigateTo(AppsRoutes.login);
    loading = false;
  }

  
  Future test() async {
   /*  await AdminServices.systemHealth();
    await AdminServices.getLoggers();
    await AdminServices.systemMetrics(); */
  }

}
