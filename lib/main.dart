import 'package:ennachat_network/Views/loading_screen.dart';
import 'package:flutter/material.dart';

import './Views/intro_page.dart';
import './Views/login.dart';
import './Views/home_page.dart';
import './Views/register.dart';
import './Apis/fields_api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ennachat Network',
      routes: {
        IntroScreen.routeName: (context) => const IntroScreen(),
        LoginScreen.routeName: (context) => const LoginScreen(),
        HomePage.routeName: (context) => const HomePage(),
        RegisterScreen.routeName: (context) => const RegisterScreen(),
        LoadingScreen.routeName: (context) => const LoadingScreen(),
      },
      initialRoute: IntroScreen.routeName,
    );
  }
}
