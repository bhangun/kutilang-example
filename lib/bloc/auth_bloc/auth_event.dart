import 'package:equatable/equatable.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class CheckAuthentication extends AuthenticationEvent {}

class ClickRememberMe extends AuthenticationEvent{}

class LoginButtonPressed extends AuthenticationEvent {
  
}

class LoggedIn extends AuthenticationEvent {
   final String token;

  LoggedIn({required this.token}); 
}

class LoggedOut extends AuthenticationEvent {}