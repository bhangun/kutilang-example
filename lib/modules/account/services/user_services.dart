import 'dart:async';
import 'dart:convert';

import '../../../services/network/rest_services.dart';
import '../models/user_model.dart';

class UserServices {
  // GET getAllUsers
  // POST createUser
  // PUT updateUser
  static const API_USERS = "users";

  // GET getUser
  // DELETE deleteUser
  static const API_USER = "users/";

   // Regex for acceptable logins
  static final String LOGIN_REGEX = "^(?>[a-zA-Z0-9!\$${'&'}*+=?^_`{|}~.-]+@[a-zA-Z0-9-]+(?:\\.[a-zA-Z0-9-]+)*)|(?>[_.@A-Za-z0-9-]+)\$";

  static regex(String login){
    // Iterable<RegExpMatch> matches;
    try{
    RegExp exp = new RegExp(LOGIN_REGEX);
    return exp.stringMatch(login);
     // if () return login;
    }catch(e){
      print('>>>>>>>>>>>>>>>>> '+e.toString());
      return login;
    }
  }

  // Fetch single user
  /* static Future<User> user(String login) async {
    //String param = '{"login":"'+login+'"}';
    String param = '{login:$login}';
    var response = await RestServices.fetch(API_USER + regex(param)); //param);//
    return User.fromJson(response);//User.fromJson(json.decode(response));
  }


  // Fetch all user
  static Future<List<User>> users([var page, var size, var sort]) async {
    List<dynamic> data = await RestServices.fetch(API_USERS);
    return User.listFromJson(data);
  }

  // Create user
  static createUser(User user) async {
    await RestServices.post(API_USER, user);
  }

  // Update user
  static updateUser(User user) async {
    await RestServices.put(API_USER, user);
  }

  // Delete user
  static deleteUser(String userID) async {
    await RestServices.delete(API_USER, userID);
  } */

}
