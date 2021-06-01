import 'package:flutter/material.dart';

import 'pages/ko_main.dart';
import 'pages/kojek_home.dart';
import 'pages/komart_home.dart';
import 'pages/kopay_home.dart';
import 'pages/kosend_home.dart';
import 'pages/koshop_home.dart';

class GoRoutes {
  GoRoutes._();

  static const String KoHome = '/go/home';
  static const String KojekHome = '/go/KojekHome';
  static const String KoPayHome = '/go/KoPayHome';
  static const String KoShopHome = '/go/KoShopHome';
  static const String KoMartHome = '/go/KoMartHome';
  static const String KoSendHome = '/go/KoSendHome';

  static final routes = <String, WidgetBuilder>{
    KoHome: (BuildContext context) => KoMain(),
    KojekHome: (BuildContext context) => KoPayHome(),
    KoPayHome: (BuildContext context) => KoMartHome(),
    KoShopHome: (BuildContext context) => KojekHome(),
    KoMartHome: (BuildContext context) => KoShopHome(),
    KoSendHome: (BuildContext context) => KoSendHome(),
  };
}
