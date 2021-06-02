import 'dart:async';
import 'package:bloc/bloc.dart';

import 'app_event.dart';
import 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc(AppState state) : super(state);

  AppState get initialState {
    return AppState.initializing();
  }

  void onAppStart() {
    // dispatch(AppStarted());
  }

  void onLoggedIn({required String token}) {
    //dispatch(AuthorizeUser(token: token));
  }

  void onLogout() {
    // dispatch(DeauthorizeUser());
  }

  @override
  Stream<AppState> mapEventToState(AppEvent event) async* {
    if (event is AppStarted) {
      final bool hasToken = await _hasToken();
      // User user =await prefs(TOKEN);

      // fetchUser(token);
      if (hasToken) {
        //yield AppState.authorizedUser();
      } else {
        // yield AppState.unauthenticated();
      }
    }

    if (event is AuthorizeUser) {
      yield state.copyWith(isLoading: true);

      await _fetchProfile(event.token!);
    }

    if (event is DeauthorizeUser) {
      yield state.copyWith(isLoading: true);

      await _deleteToken();
    }
  }

  Future<void> _deleteToken() async {
    // removePrefs(TOKEN);
  }

  Future<bool> _hasToken() async {
    bool _isTrue = false;
    // prefs(TOKEN).then((v)=> _isTrue=v.isNotEmpty);
    return _isTrue;
  }

  _fetchProfile(String token) async {
    //JWT jj = await jwt();
    //log.info(jj.getClaim("auth"));
  }
}
