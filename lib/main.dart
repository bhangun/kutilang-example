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
import 'package:kutilang_example/bloc/app_bloc/app_state.dart';
import 'package:logging/logging.dart';
import 'bloc/app_bloc/app_bloc.dart';
import 'bloc/auth_bloc/auth.dart';
import 'bloc/locale_cubit.dart';
import 'generated/localization.dart';
import 'observer.dart';
import 'services/apps_routes.dart';
import 'services/navigation.dart';
import 'utils/modules_registry.dart';
import 'bloc/theme_cubit.dart';
import 'utils/routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


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
          BlocProvider(
            create: (_) => LocaleCubit(),
          ),
          BlocProvider<AppBloc>(
            create: (_) => AppBloc(AppState.initializing()),
          ),
          BlocProvider<AuthBloc>(
            create: (_) => AuthBloc(
                 AuthState.unauthenticated()),
          ),
        ],
        child: BlocBuilder<ThemeCubit, ThemeData>(builder: (_, theme) {
          return BlocBuilder<LocaleCubit, Locale>(builder: (_, locale) {
            return MaterialApp(
              key: GlobalKey<NavigatorState>(),
              theme: theme,
              routes: RoutesService.routes,
              initialRoute: AppsRoutes.splash,
              navigatorKey: NavigationServices.navigatorKey,
              debugShowCheckedModeBanner: false,
              locale: locale,
              localeResolutionCallback: (
                Locale? _locale,
                Iterable<Locale> supportedLocales,
              ) {
                return locale;
              },
              localizationsDelegates: [
                const AppLocalizationsDelegate(),
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              supportedLocales: [
                const Locale('en', ''),
                const Locale('id', ''),
                const Locale('ar', ''),
              ],
            );
          });
        }));
  }
}
