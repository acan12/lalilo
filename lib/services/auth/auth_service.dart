import 'package:hive/hive.dart';
import 'package:lalilo/model/user.dart';

class AuthService {
  late Box<User> _users;
  final String userBox = "usersBox";

  Future<void> init() async {
    Hive.registerAdapter(UserAdapter());
    _users = await Hive.openBox(userBox);
  }

  Future<String?> authenticateUser(
      final String username, final String password) async {
    final success = await _users.values.any((element) =>
        element.username == username && element.password == password);
    if (success) {
      return username;
    } else {
      return null;
    }
  }
}
