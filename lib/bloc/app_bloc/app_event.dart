import 'package:meta/meta.dart';

abstract class AppEvent {}

class AppStarted extends AppEvent {}

class AuthorizeUser extends AppEvent {
  final String? token;

  AuthorizeUser({@required this.token});
}

class DeauthorizeUser extends AppEvent {}