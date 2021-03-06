import 'package:kutilang_example/modules/account/models/user_model.dart';

abstract class UserEvent {}

class AppStarted extends UserEvent {}

class AuthorizeUser extends UserEvent {
  final String token;

  AuthorizeUser({required this.token});
}

class DeauthorizeUser extends UserEvent {}

class FetchUser extends UserEvent {
  final int id;
  FetchUser({required this.id});
}

class SaveUser extends UserEvent {
  final User user;
  SaveUser({required this.user});
}