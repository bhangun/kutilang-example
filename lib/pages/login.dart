import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kutilang_example/bloc/app/app_bloc.dart';
import 'package:kutilang_example/bloc/authentication/authentication_bloc.dart';
import 'package:kutilang_example/layout/mobile.dart';
import 'package:kutilang_example/services/apps_routes.dart';
import 'package:responsive_builder/responsive_builder.dart';
// import 'package:kutilang_example/generated/i18n.dart';

import '../utils/config.dart';
import '../widgets/empty_app_bar_widget.dart';
import '../widgets/progress_indicator_widget.dart';
import '../widgets/rounded_button_widget.dart';
import '../widgets/textfield_widget.dart';

class LoginScreen extends StatefulWidget {
  @override
  _Loginpagestate createState() => _Loginpagestate();
}

class _Loginpagestate extends State<LoginScreen> {
  //text controllers
  TextEditingController _userEmailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  late BuildContext _context;

  //focus node
  late FocusNode _passwordFocusNode;

  //form key
  final _formKey = GlobalKey<FormState>();

  //store
  final _authBloc = AuthenticationStore();

  @override
  void initState() {
    super.initState();
    _authBloc.gotoHome();

    _passwordFocusNode = FocusNode();

    _userEmailController.addListener(() {
      //this will be called whenever user types in some value
      _authBloc.setUserId(_userEmailController.text);
    });
    _passwordController.addListener(() {
      //this will be called whenever user types in some value
      _authBloc.setPassword(_passwordController.text);
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
    _context = context;
    return Scaffold(
      primary: true,
      appBar: EmptyAppBar(),
      body: _buildBody(),
    );
  }

  Material _buildBody() {
    return Material(
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
        //key: Key('user_id'),
        // hint: S.of(context).email,
        inputType: TextInputType.emailAddress,
        icon: Icons.person,
        iconColor: Colors.black54,
        textController: _userEmailController,
        inputAction: TextInputAction.next,
        onFieldSubmitted: (value) {
          FocusScope.of(context).requestFocus(_passwordFocusNode);
        },
        errorText: _authBloc.userMessage,
      );

  Widget _buildPasswordField() => TextFieldWidget(
        //key: Key('user_password'),
        // hint: S.of(context).password,
        isObscure: true,
        padding: EdgeInsets.only(top: 16.0),
        icon: Icons.lock,
        iconColor: Colors.black54,
        textController: _passwordController,
        focusNode: _passwordFocusNode,
        errorText: _authBloc.passwordMessage,
      );

  Widget _buildForgotPasswordButton() => Align(
      alignment: FractionalOffset.centerRight,
      child: TextButton(
          key: Key('user_forgot_password'),
         // padding: EdgeInsets.all(0.0),
          child: Text(""
              //  S.of(_context).forgot_password,
              /* style: Theme.of(_context)
                .textTheme
                .caption
                .copyWith(color: Colors.orangeAccent), */
              ),
          onPressed: () => _authBloc.forgotPassword()));

  Widget _buildSignInButton() => ElevatedButton(
      //key: Key('user_sign_button'),
      //buttonText: S.of(_context).sign_in,
     // buttonColor: Theme.of(context).buttonColor,
      // textColor: Theme.of(context).textTheme.button.color,
      onPressed: () => {Navigator.of(context).pushReplacementNamed(AppsRoutes.home)}, 
      child: Text('Sign In'),);//_authBloc.login());
}
