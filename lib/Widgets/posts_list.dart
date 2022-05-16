import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../Apis/posts_api.dart';
import '../Style/style.dart';

class PostsList extends StatelessWidget {
  const PostsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PostsApi posts = Provider.of<PostsApi>(context);
    return (posts.loaded == false
        ? Center(
            child: SpinKitSquareCircle(
              color: Style.primaryColor,
              size: 50.0,
            ),
          )
        : Center(
            child: Text('Posts loaded!'),
          ));
  }
}
