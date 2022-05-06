import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Models/user.dart';

class LoginApi {
  late User user;

  Future<bool> login(String email, String password) async {
    var url = Uri.parse('http://192.168.1.15:3000/login');
    var response =
        await http.post(url, body: {"email": email, "password": password});
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
    print(user.toString());
    return true;
  }
}
