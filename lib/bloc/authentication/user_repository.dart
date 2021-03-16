import 'dart:async';

import 'package:kutilang_example/modules/account/models/user_model.dart';
// import 'package:uuid/uuid.dart';

class UserRepository {
  late User _user;

  Future<User> getUser() async {
    if (_user != null) return _user;
    return Future.delayed(
      const Duration(milliseconds: 300),
      () => _user = User(id:0),
    );
  }
}
