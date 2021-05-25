import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocaleCubit extends Cubit<Locale> {
  LocaleCubit() : super(Locale('id', 'ID'));

  void switchLocale(String flag) {
    emit(Locale(flag.toLowerCase(), flag));
  }
}
