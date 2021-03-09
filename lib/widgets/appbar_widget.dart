import 'package:flutter/material.dart';

import '../bloc/authentication/authentication_bloc.dart';

class KutAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  const KutAppBar({  this.title});
  
  @override
  Widget build(BuildContext context) {
     final AuthenticationStore _authBloc = AuthenticationStore();
  void _logout(){
    _authBloc.logout();
  }
    return PreferredSize(
  preferredSize: Size.fromHeight(100.0),
  child: AppBar(
    title: Text(title!),
    actions: <Widget>[
      IconButton(
        onPressed: _logout,
        icon: Icon(
          Icons.power_settings_new,
        ),
      )
    ],
  ));
  }

  @override
  Size get preferredSize => Size.fromHeight(100.0);
}