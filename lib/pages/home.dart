import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kutilang_example/bloc/auth_bloc/auth_bloc.dart';
import 'package:kutilang_example/services/apps_routes.dart';
import 'package:kutilang_example/services/navigation.dart';
import 'package:kutilang_example/widgets/bottom_bar_widget.dart';

import '../bloc/app/app_bloc.dart';
// import '../bloc/authentication/authentication_bloc.dart';

import '../widgets/appbar_widget.dart';
import '../widgets/drawer_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _Homepagestate createState() => _Homepagestate();
}

class _Homepagestate extends State<HomeScreen> {
  final _homeKey = GlobalKey<ScaffoldState>();
  //store
  //final AuthenticationBloc _authBloc = AuthenticationBloc();

  //final _appBloc = AppStore();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, int>(
          builder: (constext, count) {
            return Scaffold(
      key: _homeKey,
      appBar: KutAppBar(title: 'Home', onLogout: test(),),
      body: _buildBody(),
      // drawer: CommonDrawer(),
      bottomNavigationBar: KutBotomBar(),
    );}
    );
  }

  test(){
    print('O)O)O)O)O)');
// context.read<AuthenticationBloc>().logout();
NavigationServices.navigateTo(AppsRoutes.login);
  }

  _buildBody() {
    return Stack(
      children: <Widget>[
        Text('data')
       /*  Container(); //_authBloc.loggedIn
                
          },
        ),
        Observer(
          key: Key('error'),
          builder: (context) {
            return //_authBloc.success
                 Container();
                
          },
        ) */
      ],
    );
  }
}
