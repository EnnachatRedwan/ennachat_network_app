import 'package:flutter/material.dart';

import '../Style/style.dart';

import './login.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  static const String routeName = '/intro';

  void switchToLogin(BuildContext ctx) async {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(ctx).pushReplacementNamed(LoginScreen.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    switchToLogin(context);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text(
            'Ennachat Network',
            style: TextStyle(color: Style.primaryColor),
          ),
        ),
      ),
    );
  }
}
