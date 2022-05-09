import 'dart:convert';
import 'package:http/http.dart' as http;

class FieldsApi {
  List<String> Fields = [];

  Future<void> fetchFields() async {
    var url = Uri.parse('http://160.168.0.176:3000/fields');
    var response = await http.get(url);
    var fields = jsonDecode(response.body)["fields"];
    for (String field in fields) {
      Fields.add(field);
    }
  }
}
