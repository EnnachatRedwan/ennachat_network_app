import 'dart:convert';
import 'package:http/http.dart' as http;

class RegisterApi {
  Future<String> register(
      String email, String password, String name, String functionality) async {
    var url = Uri.parse('http://160.168.0.176:3000/register');
    var response = await http.post(url, body: {
      "email": email,
      "password": password,
      "name": name,
      "functionality": functionality
    });
    return jsonDecode(response.body)["result"].toString();
  }
}
