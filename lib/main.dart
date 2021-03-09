// 
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/app/app_bloc.dart';
//
import 'observer.dart';
import 'services/navigation.dart';
import 'utils/modules_registry.dart';
import 'utils/theme_cubit.dart';
import 'utils/config.dart';

import 'pages/splash.dart';
import 'utils/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
 
  /* SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]).then((_) { */
    ModulesRegistry();
    Bloc.observer = KutBlocObserver();
    runApp(KutilangApp());
  //});
}

class KutilangApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeData>(
        builder: (_, theme) {
          return MaterialApp(
            key: Key('kutilangapp'),
            theme: theme,
            routes: AppRoutes.routes,
            navigatorKey: NavigationServices.navigatorKey,
            debugShowCheckedModeBanner: false,
            // locale: Locale(_appBloc.locale, "en"),
            home: BlocProvider(
              create: (_) => AppBloc(),
              child: SplashScreen(),
            ),
          );
        },
      ),
    );
  }
}

