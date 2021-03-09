// import 'package:f_logs/f_logs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kutilang_example/services/apps_routes.dart';
import 'package:kutilang_example/services/navigation.dart';

enum AppEvent {
  /// Notifies bloc to increment state.
  increment,

  /// Notifies bloc to decrement state.
  decrement,

  /// Notifies the bloc of an error
  error,
}

class AppBloc extends Bloc<AppEvent, int> {
  /// {@macro counter_bloc}
  AppBloc() : super(0);

  @override
  Stream<int> mapEventToState(AppEvent event) async* {
    switch (event) {
      case AppEvent.decrement:
        yield state - 1;
        break;
      case AppEvent.increment:
        yield state + 1;
        break;
      case AppEvent.error:
        addError(Exception('unsupported event'));
    }

  
  String locale = 'en';

  
  bool isLightTheme = false;

  bool isLocale = true;

  String errorMessage='error';

  bool showError = false;


  /* 
  goTo(String route) {
    NavigationServices.navigateTo(route);
  } */

  
  goTo(int index) {
    switch (index) {
        case 0:
          NavigationServices.navigateTo(AppsRoutes.home);
          break;
        default:
      }
    
  }

  }
}