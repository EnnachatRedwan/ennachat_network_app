import 'package:ennachat_network/Models/user.dart';

class Post {
  final User publisher;
  final String content;
  final List<User> taggedPeople;

  Post({
    required this.content,
    required this.publisher,
    required this.taggedPeople,
  });
}
