import 'package:flutter/material.dart';
import 'package:kutilang_example/widgets/bottom_bar_widget.dart';

import '../bloc/app/app_bloc.dart';
import '../bloc/authentication/authentication_bloc.dart';

import '../widgets/appbar_widget.dart';
import '../widgets/drawer_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _Homepagestate createState() => _Homepagestate();
}

class _Homepagestate extends State<HomeScreen> {
  final _homeKey = GlobalKey<ScaffoldState>();
  //store
  final AuthenticationStore _authBloc = AuthenticationStore();

  //final _appBloc = AppStore();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _homeKey,
      appBar: KutAppBar(title: 'Home'),
      body: _buildBody(),
      drawer: CommonDrawer(),
      bottomNavigationBar: KutBotomBar(),
    );
  }

  _buildBody() {
    return Stack(
      children: <Widget>[
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
