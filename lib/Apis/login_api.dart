import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginApi {
  String GUID = "";

  Future<bool> login(String email, String password) async {
    var url = Uri.parse('http://192.168.1.104:3000/login');
    var response =
        await http.post(url, body: {"email": email, "password": password});
    GUID = jsonDecode(response.body)["GUID"];
    if (GUID == "") {
      return false;
    }
    return true;
  }
}
