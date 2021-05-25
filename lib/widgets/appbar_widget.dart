import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kutilang_example/bloc/auth_bloc/auth_bloc.dart';
import 'package:kutilang_example/bloc/auth_bloc/auth_event.dart';
import 'package:kutilang_example/bloc/auth_bloc/auth_state.dart';

class KutAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final VoidCallback? onLogout;
  const KutAppBar({this.title, this.onLogout});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
            preferredSize: Size.fromHeight(100.0),
            child: AppBar(
              title: Text(title!),
              actions: <Widget>[
                IconButton(
                  onPressed: () => onLogout,//context.read<AuthenticationBloc>().logout(),
                  icon: Icon(
                    Icons.power_settings_new,
                  ),
                )
              ],
            )
            );
  }

  logout(BuildContext context){
    print('<><>logout<><>');
    context.read<AuthenticationBloc>().add(LoggedOut());
  }

  @override
  Size get preferredSize => Size.fromHeight(100.0);
}
