// ignore_for_file: file_names

class User {
  final String email;
  final String password;
  final String username;
  bool? logged;

  User(
      {required this.email,
      required this.password,
      required this.username,
      logged = false});
}
