import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../Models/post.dart';
import '../Models/user.dart';

class PostsApi with ChangeNotifier {
  List<Post> Posts = [];
  bool loaded = false;

  PostsApi(String Guid) {
    fetchPosts(Guid);
  }

  void fetchPosts(String Guid) async {
    var url = Uri.parse('http://192.168.1.121:3000/posts');
    var response = await http.get(url, headers: {"GUID": Guid});
    loaded = true;
    print(response.body);
    notifyListeners();
  }
}
