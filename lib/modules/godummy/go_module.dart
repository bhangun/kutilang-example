import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kutilang_example/models/module.dart';
import 'package:kutilang_example/services/apps_routes.dart';
import 'package:kutilang_example/bloc/theme_cubit.dart';

import '../../utils/routes.dart';
import 'go_routes.dart';

class GoModule implements Module {
  @override
  String? name = 'Main';

  @override
  pages() {
    return [
      Page(title: 'User Detail', route: GoRoutes.KoHome),
      Page(title: 'User Form', route: GoRoutes.KojekHome),
      Page(title: 'User Form', route: GoRoutes.KoPayHome),
      Page(title: 'User Form', route: GoRoutes.KoSendHome),
      Page(title: 'User Form', route: GoRoutes.KoShopHome),
      Page(
          title: 'User List',
          route: GoRoutes.KoMartHome,
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
     
    ];
  }

  @override
  void routes() {
    RoutesService.addRoutes(GoRoutes.routes);
  }
}
