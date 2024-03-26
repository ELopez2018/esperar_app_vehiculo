import 'package:esperar_drivers/domain/entities/user/user.dart';
import 'package:esperar_drivers/domain/repositories/user.dart';
import 'package:esperar_drivers/domain/services/user.dart';

class UserRepository extends UserInterface {
  UserRepository({
    required this.userServiceInterface,
  });

  final UserServiceInterface userServiceInterface;

  @override
  Future<User?> getUserByToken() async {
    try {
      return await userServiceInterface.getUserByToken();
    } on String catch (_) {
      rethrow;
    }
  }

  @override
  Future<User?> getUserByUsername(String username) async {
    try {
      return await userServiceInterface.getUserByUsername(username);
    } on String catch (_) {
      rethrow;
    }
  }

  @override
  Future<User> updateUser(User user) async {
    try {
      return await userServiceInterface.updateUser(user);
    } on String catch (_) {
      rethrow;
    }
  }
}
