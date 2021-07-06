part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class CheckAuthentication extends AuthEvent {}

class ClickRememberMe extends AuthEvent{}

class LoginButtonPressed extends AuthEvent {
  
}

class LoggedIn extends AuthEvent {
   final String token;

  LoggedIn({required this.token}); 
}

class LoggedOut extends AuthEvent {}