part of 'auth_bloc.dart';

enum AuthStatus { initialize, authenticated, processing, unauthenticated, failure }

class AuthState extends Equatable {
  final bool isLoading;
  final bool isAuthenticated;
  final AuthStatus status;
  final bool failure;

  const AuthState._(
      {this.isAuthenticated = false,
      this.isLoading = false,
      this.status = AuthStatus.initialize,
      this.failure = false});

  const AuthState.initialize() : this._();

  const AuthState.authenticated()
      : this._(
            isAuthenticated: true,
            isLoading: false,
            status: AuthStatus.authenticated,
            failure: false);

  const AuthState.unauthenticated()
      : this._(
            isAuthenticated: false,
            isLoading: false,
            status: AuthStatus.unauthenticated,
            failure: false);

  const AuthState.failure()
      : this._(
            isAuthenticated: false,
            isLoading: false,
            status: AuthStatus.failure,
            failure: true);

  const AuthState.processing()
      : this._(
            isAuthenticated: false,
            isLoading: true,
            status: AuthStatus.processing,
            failure: false);

  @override
  List<Object?> get props => [];
}
