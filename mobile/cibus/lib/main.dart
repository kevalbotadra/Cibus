import 'package:cibus/data/providers/auth_provider.dart';
import 'package:cibus/logic/auth/auth_bloc.dart';
import 'package:cibus/logic/auth/auth_event.dart';
import 'package:cibus/logic/auth/auth_state.dart';
import 'package:cibus/presentation/auth/user_info.dart';
import 'package:cibus/presentation/home/home.dart';
import 'package:cibus/presentation/landing/lading_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(BlocProvider(
    create: (context) =>
        AuthBloc(AuthProvider(firebaseAuth: FirebaseAuth.instance))
          ..add(AppStarted()),
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cibus',
      home: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
        if (state is Unauthenticated) {
          return LandingPage();
        } else if (state is Authenticated) {
          return Home();
        } else {
          return LandingPage();
        }
      }),
    );
  }
}
