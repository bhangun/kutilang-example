import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../utils/themes/theme_services.dart';

class ThemeCubit extends Cubit<ThemeData> {
  
  ThemeCubit() : super(ThemeServices.lightTheme());

  /// Toggles the current brightness between light and dark.
  void toggleTheme() {
    emit(state.brightness == Brightness.dark ? ThemeServices.lightTheme() : ThemeServices.darkTheme());
  }
}
