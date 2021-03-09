import 'package:flutter/material.dart';
import 'package:kutilang_example/services/apps_routes.dart';

class AppRoutes {
  static final AppRoutes _singleton = AppRoutes._();
  AppRoutes._();

  factory AppRoutes() => _singleton;

  static Map<String, Widget Function(BuildContext)> _routes = <String, WidgetBuilder>{};

  static Future<AppRoutes> get instance async{ 
    _routes.addAll(AppsRoutes.routes);
    return _singleton;
  }

  static get routes => _routes;

  static addRoutes(Map<String, Widget Function(BuildContext)> newRoutes) {
    _routes.addAll(newRoutes);
  }
}
