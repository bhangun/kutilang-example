import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kutilang_example/models/module.dart';
import 'package:kutilang_example/bloc/theme_cubit.dart';

import '../../utils/routes.dart';
import 'go_routes.dart';

class GoModule implements Module {
  @override
  String? name = 'Main';

  @override
  pages() {
    return [
      Page(title: 'User Detail', route: GoRoutes.koHome),
      Page(title: 'User Form', route: GoRoutes.kojekHome),
      Page(title: 'User Form', route: GoRoutes.koPayHome),
      Page(title: 'User Form', route: GoRoutes.koSendHome),
      Page(title: 'User Form', route: GoRoutes.koShopHome),
      Page(
          title: 'User List',
          route: GoRoutes.koMartHome,
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
