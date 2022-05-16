import 'package:ennachat_network/Models/user.dart';
import 'package:flutter/cupertino.dart';

class Current_user extends User with ChangeNotifier {
  final String GUID;

  Current_user({
    required String name,
    required String email,
    required String functionality,
    required this.GUID,
  }) : super(
          email: email,
          name: name,
          functionality: functionality,
        );
}
