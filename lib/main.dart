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
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kutilang_example/bloc/auth_bloc/auth.dart';
import 'package:kutilang_example/pages/home.dart';
import 'package:kutilang_example/pages/login.dart';
import 'package:kutilang_example/services/local/logger.dart';
import 'package:logging/logging.dart';

import 'bloc/app/app_bloc.dart';
import 'bloc/auth_bloc/auth_bloc.dart';
import 'generated/i18n.dart';
import 'observer.dart';
import 'services/navigation.dart';
import 'utils/modules_registry.dart';
import 'bloc/theme_cubit.dart';
import 'utils/config.dart';

import 'pages/splash.dart';
import 'utils/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ModulesRegistry();
  Bloc.observer = KutBlocObserver();

  Logger.root.level = Level.ALL; // defaults to Level.INFO
  Logger.root.onRecord.listen((record) {
    print(
        '${record.time}-(${record.level.name}) (${record.loggerName}): ${record.message} ${record.object}');
  });
  runApp(KutilangApp());
}

class KutilangApp extends StatelessWidget {
  final log = Logger('main');
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => ThemeCubit(),
          ),
          BlocProvider<AppBloc>(
            create: (_) => AppBloc(),
          ),
          BlocProvider<AuthenticationBloc>(
            create: (_) =>
                AuthenticationBloc(AuthenticationState.unauthenticated()),
          ),
        ],
        child: BlocBuilder<ThemeCubit, ThemeData>(builder: (_, theme) {
          return MaterialApp(
              key: Key('kutilangapp'),
              theme: theme,
              routes: AppRoutes.routes,
              navigatorKey: NavigationServices.navigatorKey,
              debugShowCheckedModeBanner: false,
              locale: Locale('en', "EN"),
              localizationsDelegates: [S.delegate],
              supportedLocales: S.delegate.supportedLocales,
              localeResolutionCallback: S.delegate
                  .resolution(fallback: new Locale(LOCALE_ENGLISH, "en")),
              // onGenerateRoute: (_) => SplashScreen.route(),
              //home: HomeScreen(),
              /*  builder: (context, child) {
                switch (context.read<AuthenticationBloc>().processingLogin()) {
                    case AuthStatus.authenticated:
                     return HomeScreen();
                    case AuthStatus.unauthenticated:
                      return LoginScreen();
                    default:
                      return SplashScreen();
                  }
                    }
          ); */
              builder: (context, child) {
                return BlocBuilder<AuthenticationBloc, AuthenticationState>(
                    builder: (context, state) {
                  switch (state.status) {
                    case AuthStatus.authenticated:
                      return HomeScreen();
                    case AuthStatus.unauthenticated:
                      return LoginScreen();
                    default:
                      return SplashScreen();
                  }
                  /* switch (state.status) {
                    case AuthStatus.authenticated:
                      //context.read<AuthenticationBloc>().processingLogin();
                      break;
                    case AuthStatus.unauthenticated:
                      break;
                    default:
                      break;
                  } */
                });
              });
        }));
  }
}
