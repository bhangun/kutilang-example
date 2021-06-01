import 'package:flutter/material.dart';

import 'pages/ko_main.dart';
import 'pages/kojek_home.dart';
import 'pages/komart_home.dart';
import 'pages/kopay_home.dart';
import 'pages/kosend_home.dart';
import 'pages/koshop_home.dart';

class KoRoutes {
  KoRoutes._();

  static const String koHome = '/ko/home';
  static const String kojekHome = '/ko/kojekHome';
  static const String koPayHome = '/ko/koPayHome';
  static const String koShopHome = '/ko/koShopHome';
  static const String koMartHome = '/ko/koMartHome';
  static const String koSendHome = '/ko/koSendHome';

  static final routes = <String, WidgetBuilder>{
    koHome: (BuildContext context) => KoMain(),
    kojekHome: (BuildContext context) => KoPayHome(),
    koPayHome: (BuildContext context) => KoMartHome(),
    koShopHome: (BuildContext context) => KojekHome(),
    koMartHome: (BuildContext context) => KoShopHome(),
    koSendHome: (BuildContext context) => KoSendHome(),
  };
}
