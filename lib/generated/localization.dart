import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppLocalizations {
  AppLocalizations(this.locale);

  final Locale locale;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'title': 'hello world',
      "home": "Home",
      "sign_in": "Sign In",
      "forgot_password": "Forgot Password",
      "please_fill_field": "Please fill column",
      "user_password": "User Password",
      "password": "Password",
      "email": "Email",
      "delete": "Delete",
      "share": "Share",
      "add": "Add",
      "data_empty": "Data empty"
    },
    'id': {
      'title': 'apa kabar',
      "home": "Beranda",
      "sign_in": "Masuk",
      "forgot_password": "Lupa Sandi",
      "please_fill_field": "Silahkan isi kolom",
      "user_password": "Sandi",
      "password": "Sandi",
      "email": "Email",
      "delete": "Hapus",
      "share": "Sebar",
      "add": "Tambah",
      "data_empty": "Data Kosong"
    },
    'ar': {
      'title': 'ini arab',
      "home": "Beranda",
      "sign_in": "Masuk",
      "forgot_password": "Lupa Sandi",
      "please_fill_field": "Silahkan isi kolom",
      "user_password": "Sandi",
      "password": "Sandi",
      "email": "Email",
      "delete": "Hapus",
      "share": "Sebar",
      "add": "Tambah",
      "data_empty": "Data Kosong"
    },
  };

  String? get title {
    return _localizedValues[locale.languageCode]!['title'];
  }
  String? get email {
    return _localizedValues[locale.languageCode]!['email'];
  }
  String? get password {
    return _localizedValues[locale.languageCode]!['password'];
  }
  String? get forgotPassword {
    return _localizedValues[locale.languageCode]!['forgot_password'];
  }
  // ignore: non_constant_identifier_names
  String? get sign_in {
    return _localizedValues[locale.languageCode]!['sign_in'];
  }
}

class AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      ['en', 'id', 'ar'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) {
    // Returning a SynchronousFuture here because an async "load" operation
    // isn't needed to produce an instance of AppLocalizations.
    return SynchronousFuture<AppLocalizations>(AppLocalizations(locale));
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
