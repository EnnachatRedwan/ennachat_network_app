import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:dropdown_search/dropdown_search.dart';

import '../Style/style.dart';
import '../Apis/register_api.dart';
import './login.dart';
import '../Apis/fields_api.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  static const String routeName = '/register';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();
  final nameController = TextEditingController();
  final functionalityController = TextEditingController();

  void register(
      String email,
      String password,
      String passwordConfirm,
      String name,
      String functionality,
      RoundedLoadingButtonController controller) async {
    if (email == '' ||
        password == '' ||
        passwordConfirm == '' ||
        name == '' ||
        functionality == '') {
      controller.error();
      snackBar('All fields are required');
      return;
    }
    if (password != passwordConfirm) {
      controller.error();
      snackBar('Password not matching');
      return;
    }
    RegisterApi reg = RegisterApi();
    String result = await reg.register(email, password, name, functionality);
    if (result == "SC") {
      success(controller);
    } else if (result == "AX") {
      controller.error();
      snackBar('This email is already exists!');
    } else {
      controller.error();
      snackBar('Error occurs!');
    }
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

  void success(RoundedLoadingButtonController controller) {
    controller.success();
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
    });
  }

  void resetController(RoundedLoadingButtonController controller) {
    controller.reset();
  }

  final RoundedLoadingButtonController _btnController1 =
      RoundedLoadingButtonController();

  @override
  Widget build(BuildContext context) {
    FieldsApi api = ModalRoute.of(context)!.settings.arguments as FieldsApi;
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
                    'REGISTER',
                    style: TextStyle(color: Style.textColor, fontSize: 40),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
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
                      obscureText: true,
                      autocorrect: false,
                      enableSuggestions: false,
                      controller: passwordController,
                      onChanged: (value) => resetController(_btnController1),
                    ),
                    TextField(
                      decoration:
                          const InputDecoration(labelText: 'Confirm password'),
                      obscureText: true,
                      autocorrect: false,
                      enableSuggestions: false,
                      controller: passwordConfirmController,
                      onChanged: (value) => resetController(_btnController1),
                    ),
                    TextField(
                      decoration: const InputDecoration(labelText: 'Name'),
                      controller: nameController,
                      onChanged: (value) => resetController(_btnController1),
                    ),
                    TextField(
                      decoration:
                          const InputDecoration(labelText: 'Functionality'),
                      controller: functionalityController,
                      onChanged: (value) => resetController(_btnController1),
                    ),
                    DropdownSearch<String>(
                      mode: Mode.MENU,
                      showSelectedItems: true,
                      items: api.Fields,
                      dropdownSearchDecoration: const InputDecoration(
                        labelText: "Functionality",
                        hintText: "Select your functionality",
                      ),
                      popupItemDisabled: (String s) => s.startsWith('I'),
                      onChanged: print,
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
                      onPressed: () => register(
                          emailController.text,
                          passwordController.text,
                          passwordConfirmController.text,
                          nameController.text,
                          functionalityController.text,
                          _btnController1),
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
                      onPressed: () {
                        Navigator.of(context)
                            .pushReplacementNamed(LoginScreen.routeName);
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
