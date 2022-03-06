import 'package:cibus/data/providers/auth_provider.dart';
import 'package:cibus/logic/auth/auth_bloc.dart';
import 'package:cibus/logic/auth/auth_event.dart';
import 'package:cibus/presentation/auth/user_info.dart';
import 'package:cibus/presentation/home/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthPage extends StatefulWidget {
  final AuthProvider authProvider;
  const AuthPage({Key? key, required this.authProvider}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  String userUid = "NONE";

  String action = "Log In";

  Future<String?>? _authUser(LoginData data) async {
    User? user = await widget.authProvider
        .login(email: data.name, password: data.password);

    setState(() {
      userUid = user!.uid;
      action = "Log In";
    });
    return null;
  }

  Future<String?>? _signupUser(SignupData data) async {
    await widget.authProvider
        .registerUser(email: data.name!, password: data.password!);

    setState(() {
      action = "Sign Up";
    });
    return null;
  }

  Future<String>? _recoverPassword(String name) {
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: "cibus",
      titleTag: "food for everyone",
      theme:
          LoginTheme(pageColorLight: Colors.green, pageColorDark: Colors.white),
      onLogin: _authUser,
      onSignup: _signupUser,
      onRecoverPassword: _recoverPassword,
      onSubmitAnimationCompleted: () {
        if (action == "Log In") {
          BlocProvider.of<AuthBloc>(context).add(LoggedIn());
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => Home(),
          ));
        } else {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => UserInfoPage(
              uid: userUid,
            ),
          ));
        }
      },
    );
  }
}
