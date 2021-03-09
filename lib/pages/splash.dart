import 'dart:async';
import 'dart:math';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kutilang_example/services/apps_routes.dart';
import 'package:flutter/material.dart';
import 'package:kutilang_example/services/local/local_datasource.dart';
import 'package:kutilang_example/services/local/local_storage.dart';

import '../utils/config.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Splashpagestate();
}

class _Splashpagestate extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(child: SvgPicture.asset(IMAGE_SPLASH)),
    );
  }

  startTimer() {
    var _duration = Duration(milliseconds: 300);
    return Timer(_duration, navigate);
  }

  navigate() async {
   
    //if ((await AppDataSource.fetch(0))!=null ) {
      //Navigator.of(context).pushReplacementNamed(AppsRoutes.home);
    
      Navigator.of(context).pushReplacementNamed(AppsRoutes.login);
    
  }
}
