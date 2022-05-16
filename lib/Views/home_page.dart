import 'package:ennachat_network/Widgets/posts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Style/style.dart';
import '../Widgets/user_card.dart';
import '../Models/current_user.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static const String routeName = '/home_page';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Current_user current_user =
        ModalRoute.of(context)!.settings.arguments as Current_user;
    return ChangeNotifierProvider.value(
      value: current_user,
      child: Scaffold(
        appBar: AppBar(actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ], backgroundColor: Style.appBarColor),
        body: Column(
          children: [
            const UserCard(),
            Posts(guid: current_user.GUID),
          ],
        ),
      ),
    );
  }
}
