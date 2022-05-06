import 'package:flutter/cupertino.dart';

class User with ChangeNotifier {
  final String name;
  final String email;
  final String functionality;
  final String GUID;

  User({
    required this.name,
    required this.email,
    required this.functionality,
    required this.GUID,
  });

  @override
  String toString() {
    return (name +
        ", " +
        email +
        ", " +
        functionality +
        ", " +
        email +
        ", " +
        GUID);
    return super.toString();
  }
}
