import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Models/user.dart';

class UserCard extends StatelessWidget {
  const UserCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);
    return ListTile(
      leading: const CircleAvatar(
        backgroundImage: AssetImage('assets/images/userImage.webp'),
      ),
      title: Text(user.name),
      subtitle: Text(user.functionality),
    );
  }
}