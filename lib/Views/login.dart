import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../Style/style.dart';
import '../Apis/login_api.dart';
import './home_page.dart';
import './register.dart';
import '../Apis/fields_api.dart';
import './loading_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const String routeName = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void login(String email, String password,
      RoundedLoadingButtonController controller) async {
    if (email == '' || password == '') {
      failed(controller, 'All fields are required');
    }
    LoginApi log = LoginApi();
    bool result = await log.login(email, password);
    result
        ? success(controller, log)
        : failed(controller, 'Email or password is wrong!');
  }

  void failed(RoundedLoadingButtonController controller, String message) {
    snackBar(message);
    controller.error();
  }

  void snackBar(String message) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Style.errorColor,
      ),
    );
  }

  void success(RoundedLoadingButtonController controller, LoginApi api) {
    controller.success();
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.of(context)
          .pushReplacementNamed(HomePage.routeName, arguments: api);
    });
  }

  void resetController(RoundedLoadingButtonController controller) {
    controller.reset();
  }

  final RoundedLoadingButtonController _btnController1 =
      RoundedLoadingButtonController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 300,
            maxHeight: 600,
          ),
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    'LOGIN',
                    style: TextStyle(color: Style.textColor, fontSize: 40),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      decoration: const InputDecoration(labelText: 'Login'),
                      controller: emailController,
                      onChanged: (value) => resetController(_btnController1),
                    ),
                    TextField(
                      decoration: const InputDecoration(labelText: 'Password'),
                      controller: passwordController,
                      obscureText: true,
                      autocorrect: false,
                      enableSuggestions: false,
                      onChanged: (value) => resetController(_btnController1),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RoundedLoadingButton(
                      controller: _btnController1,
                      onPressed: () => login(emailController.text,
                          passwordController.text, _btnController1),
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                        child: Text(
                          'Login',
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () async {
                        Navigator.of(context)
                            .pushNamed(LoadingScreen.routeName);
                        FieldsApi api = FieldsApi();
                        await api.fetchFields();
                        Navigator.of(context).pop();
                        Navigator.of(context).pushReplacementNamed(
                            RegisterScreen.routeName,
                            arguments: api);
                      },
                      child: Text(
                        'Alredy have an account?',
                        style: TextStyle(color: Style.primaryColor),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
