import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Apis/posts_api.dart';
import '../Widgets/posts_list.dart';

class Posts extends StatelessWidget {
  const Posts({Key? key, required this.guid}) : super(key: key);

  final String guid;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PostsApi(guid),
      child: PostsList(),
    );
  }
}
