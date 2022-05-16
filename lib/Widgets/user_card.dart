import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Models/current_user.dart';

class UserCard extends StatelessWidget {
  const UserCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Current_user current_user = Provider.of<Current_user>(context);
    return ListTile(
      leading: const CircleAvatar(
        backgroundImage: AssetImage('assets/images/userImage.webp'),
      ),
      title: Text(current_user.name),
      subtitle: Text(current_user.functionality),
    );
  }
}
