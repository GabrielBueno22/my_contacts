import 'package:my_contacts/utils/interfaces/ilocal_db.dart';

import '../models/User.dart';

class SignUpUserException implements Exception {
  const SignUpUserException();
}

class UserRepository {
  final ILocalDB localDB;

  UserRepository({required this.localDB});

  Future signIn() async {}

  Future signOut() async {}

  Future signUp(User user) async {
    final allUsersBox = await localDB.getAll('users');
    final allUsers = allUsersBox.cast<User>();
    if (allUsers.any((element) => element.email == user.email)) {
      throw const SignUpUserException();
    }
    localDB.save('users', user.email);
  }
}
