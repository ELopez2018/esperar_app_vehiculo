
import 'package:esperar_drivers/domain/entities/user/user.dart';

abstract class UserInterface {
  Future<User?> getUserByToken();
  Future<User?> getUserByUsername(String username);
  Future<User> updateUser(User user);
}
