import 'package:equatable/equatable.dart';

enum AuthStatus { initialize, authenticated, processing, unauthenticated, failure }

class AuthenticationState extends Equatable {
  final bool isLoading;
  final bool isAuthenticated;
  final AuthStatus status;
  final bool failure;

  const AuthenticationState._(
      {this.isAuthenticated = false,
      this.isLoading = false,
      this.status = AuthStatus.initialize,
      this.failure = false});

  const AuthenticationState.initialize() : this._();

  const AuthenticationState.authenticated()
      : this._(
            isAuthenticated: true,
            isLoading: false,
            status: AuthStatus.authenticated,
            failure: false);

  const AuthenticationState.unauthenticated()
      : this._(
            isAuthenticated: false,
            isLoading: false,
            status: AuthStatus.unauthenticated,
            failure: false);

  const AuthenticationState.failure()
      : this._(
            isAuthenticated: false,
            isLoading: false,
            status: AuthStatus.failure,
            failure: true);

  const AuthenticationState.processing()
      : this._(
            isAuthenticated: false,
            isLoading: true,
            status: AuthStatus.processing,
            failure: false);

  @override
  List<Object?> get props => [];
}
