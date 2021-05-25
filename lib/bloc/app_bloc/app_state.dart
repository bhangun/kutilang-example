import 'package:kutilang_example/modules/account/models/user_model.dart';
import 'package:meta/meta.dart';


class AppState {
  final bool isInitializing;
  final bool isLoading;
  final bool isAuthenticated;
  final User? authorizedUser;
  final List<dynamic>? roles;

  const AppState({
    required this.isInitializing,
    required this.isLoading,
    required this.isAuthenticated,
    this.authorizedUser,
    this.roles
  });

  factory AppState.initializing() {
    return AppState(
      isInitializing: true,
      isAuthenticated: false,
      isLoading: false,
    );
  }

  factory AppState.authorizedUser(User user) {
    return AppState(
      isInitializing: false,
      isAuthenticated: true,
      isLoading: false,
      authorizedUser: user,
      roles: user.authorities
    );
  }
  AppState copyWith({
    bool? isInitializing,
    bool? isAuthenticated,
    bool? isLoading,
    User? authorizedUser,
    List<dynamic>? roles,
  }) {
    return AppState(
      isInitializing: isInitializing ?? this.isInitializing,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      isLoading: isLoading ?? this.isLoading,
      authorizedUser: authorizedUser ?? this.authorizedUser,
      roles: roles ?? this.roles
    );
  }


@override
  bool operator ==( Object other) =>
      identical( this, other) ||
      other is AppState &&
          runtimeType == other.runtimeType &&
          isInitializing == other.isInitializing &&
          isAuthenticated == other.isAuthenticated  &&
          authorizedUser == other.authorizedUser &&
          roles == other.roles;

@override
  int get hashCode =>
      isInitializing.hashCode ^ isAuthenticated.hashCode ^
      authorizedUser.hashCode ^ roles.hashCode;

  @override
  String toString() =>
      'AppState { isInitializing: $isInitializing, isLoading: $isLoading, '+
      'isAuthenticated: $isAuthenticated }';

  
}