class User {
  final String name;
  final String email;
  final String functionality;

  User({
    required this.name,
    required this.email,
    required this.functionality,
  });

  @override
  String toString() {
    return (name + ", " + email + ", " + functionality + ", " + email);
  }
}
