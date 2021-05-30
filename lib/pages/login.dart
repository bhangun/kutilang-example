import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kutilang_example/bloc/app_bloc/app.dart';

import 'package:kutilang_example/bloc/auth_bloc/auth_bloc.dart';
import 'package:kutilang_example/bloc/auth_bloc/auth_event.dart';
import 'package:kutilang_example/bloc/locale_cubit.dart';

import 'package:kutilang_example/generated/i18n.dart';
import 'package:kutilang_example/generated/localization.dart';
import 'package:kutilang_example/layout/mobile.dart';
import 'package:kutilang_example/bloc/theme_cubit.dart';

import '../utils/config.dart';
import '../widgets/empty_app_bar_widget.dart';

import '../widgets/textfield_widget.dart';

class LoginScreen extends StatefulWidget {
  @override
  _Loginpagestate createState() => _Loginpagestate();
}

class _Loginpagestate extends State<LoginScreen> {
  // text controllers
  TextEditingController _userEmailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  //focus node
  late FocusNode _passwordFocusNode;

  //form key
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _passwordFocusNode = FocusNode();

    _userEmailController.addListener(() {
      // this will be called whenever user types in some value
      context.read<AuthBloc>().setUserId(_userEmailController.text);
    });
    _passwordController.addListener(() {
      //this will be called whenever user types in some value
      context.read<AuthBloc>().setPassword(_passwordController.text);
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is removed from the Widget tree
    _userEmailController.dispose();
    _passwordController.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        primary: true,
        appBar: EmptyAppBar(),
        body: BlocBuilder<AppBloc, AppState>(
          builder: (_, state) {
            return _buildBody(context);
          },
        ));
  }

  Material _buildBody(BuildContext context) {
    return Material(
        key: _formKey,
        child: MobileLayout(
          rightChild: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SvgPicture.asset(
                IMAGE_SPLASH,
                width: 60,
                height: 60,
              ),
              SizedBox(height: 24.0),
              _buildUserIdField(),
              _buildPasswordField(),
              _buildForgotPasswordButton(),
              _buildSignInButton(),
              Row(children: [
               /*  FloatingActionButton(
                  child: const Icon(Icons.brightness_6),
                  onPressed: () => context.read<ThemeCubit>().toggleTheme(),
                ), */
                FloatingActionButton(
                    child: const Icon(Icons.flag), onPressed: () => showModal()
                    //context.read<LocaleCubit>().switchLocale('EN'),
                    ),
              ]),
            ],
          ),
          leftChild: SizedBox.expand(
              child: SvgPicture.asset(
            IMAGE_SPLASH,
            width: 100,
            height: 100,
          )),
          showProgress: false,
        ));
  }

  Widget _buildUserIdField() => TextFieldWidget(
        // hint: S.of(context)!.email,
        inputType: TextInputType.emailAddress,
        icon: Icons.person,
        iconColor: Colors.black54,
        textController: _userEmailController,
        inputAction: TextInputAction.next,
        onFieldSubmitted: (value) {
          FocusScope.of(context).requestFocus(_passwordFocusNode);
        },
        errorText: context.read<AuthBloc>().userMessage,
      );

  Widget _buildPasswordField() => TextFieldWidget(
        //hint: S.of(context)!.password,
        isObscure: true,
        padding: EdgeInsets.only(top: 16.0),
        icon: Icons.lock,
        iconColor: Colors.black54,
        textController: _passwordController,
        focusNode: _passwordFocusNode,
        errorText: context.read<AuthBloc>().passwordMessage,
      );

  Widget _buildForgotPasswordButton() => Align(
      alignment: FractionalOffset.centerRight,
      child: TextButton(
          key: Key('user_forgot_password'),
          child: Text(AppLocalizations.of(context)!.forgotPassword!),
          onPressed: () => context.read<AuthBloc>().forgotPassword()));

  Widget _buildSignInButton() => ElevatedButton(
        key: Key('user_sign_button'),
        onPressed: () => context.read<AuthBloc>().add(LoginButtonPressed()),
        child: Text(AppLocalizations.of(context)!.sign_in!),
      );

  showModal() {
    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 200,
            // color: Colors.amber,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              //mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.close))
              ],
            ),
          );
        });
  }
}
