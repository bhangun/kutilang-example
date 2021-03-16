import 'package:flutter/widgets.dart';

class NavigationServices {
  
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  
  static Future<dynamic> navigateTo(String routeName) {
    return navigatorKey.currentState!.pushNamed(routeName);
  }

  static close() {
    return navigatorKey.currentState!.pop(true);
  }
}
