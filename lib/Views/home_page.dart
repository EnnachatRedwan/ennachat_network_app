import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Style/style.dart';
import '../Models/user.dart';
import '../Widgets/user_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static const String routeName = '/home_page';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    User user = ModalRoute.of(context)!.settings.arguments as User;
    return ChangeNotifierProvider.value(
      value: user,
      child: Scaffold(
        appBar: AppBar(actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ], backgroundColor: Style.appBarColor),
        body: Column(
          children: const [UserCard()],
        ),
      ),
    );
  }
}
