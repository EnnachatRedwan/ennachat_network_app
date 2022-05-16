import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Models/current_user.dart';

class LoginApi {
  late Current_user current_user;

  Future<bool> login(String email, String password) async {
    var url = Uri.parse('http://192.168.1.121:3000/login');
    var response =
        await http.get(url, headers: {"email": email, "password": password});
    String GUID = jsonDecode(response.body)["GUID"];
    if (GUID == "") {
      return false;
    }
    String name = jsonDecode(response.body)["name"];
    String functionality = jsonDecode(response.body)["Functionalities"];
    current_user = Current_user(
      name: name,
      email: email,
      functionality: functionality,
      GUID: GUID,
    );
    return true;
  }
}
