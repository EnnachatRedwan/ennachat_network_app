import 'dart:convert';
import 'package:http/http.dart' as http;

class FieldsApi {
  List<String> Functionalities = [];

  Future<void> fetchFields() async {
    var url = Uri.parse('http://192.168.1.121:3000/functionalities');
    var response = await http.get(url);
    var functionalities = jsonDecode(response.body)["functionalities"];
    for (String functionality in functionalities) {
      Functionalities.add(functionality);
      print(functionality);
    }
  }
}
