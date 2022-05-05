import 'dart:convert';
import 'package:http/http.dart' as http;

class FieldsApi {
  List<String> Fields = [];

  Future<void> fetchFields() async {
    var url = Uri.parse('http://192.168.1.15:3000/fields');
    var response = await http.get(url);
    var fields = jsonDecode(response.body)["fields"];
    for (String field in fields) {
      Fields.add(field);
    }
    print(Fields);
  }
}
