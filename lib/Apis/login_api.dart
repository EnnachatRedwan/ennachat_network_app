import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Models/user.dart';

class LoginApi {
  late User user;

  Future<bool> login(String email, String password) async {
    var url = Uri.parse('http://160.168.0.176:3000/login');
    var response =
        await http.get(url, headers: {"email": email, "password": password});
    String GUID = jsonDecode(response.body)["GUID"];
    if (GUID == "") {
      return false;
    }
    String name = jsonDecode(response.body)["name"];
    String functionality = jsonDecode(response.body)["functionality"];
    user = User(
      name: name,
      email: email,
      functionality: functionality,
      GUID: GUID,
    );
    return true;
  }
}
