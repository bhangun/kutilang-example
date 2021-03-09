import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kutilang_example/bloc/app/app_bloc.dart';
import 'package:kutilang_example/models/module.dart';
import 'package:kutilang_example/services/apps_routes.dart';
import 'package:kutilang_example/utils/theme_cubit.dart';

import '../utils/routes.dart';
import 'account/services/user_routes.dart';

class MainModule implements Module {
  @override
  String? name = 'Main';

  @override
  pages() {
    return [
      Page(title: 'User Detail', route: UserRoutes.userDetail),
      Page(title: 'User Form', route: UserRoutes.userForm),
      Page(
          title: 'User List',
          route: UserRoutes.userList,
          showInDrawer: true,
          showInHome: true)
    ];
  }

  @override
  services() {}

  @override
  List<BlocProvider> providers() {
    return [
      BlocProvider(
        create: (_) => ThemeCubit(),
      ),
      BlocProvider<AppBloc>(
        create: (_) => AppBloc(),
      ),
    ];
  }

  @override
  void routes() {
    AppRoutes.addRoutes(AppsRoutes.routes);
    AppRoutes.addRoutes(UserRoutes.routes);
  }
}
