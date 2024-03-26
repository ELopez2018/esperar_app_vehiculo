import 'package:esperar_drivers/domain/entities/driver/driver.dart';
import 'package:esperar_drivers/domain/entities/driver/driver_request.dart';
import 'package:esperar_drivers/domain/entities/user/user.dart';

abstract class UserServiceInterface {
  Future<User?> getUserByToken();
  Future<User?> getUserByUsername(String username);
  Future<Driver> createDriver(DriverRequest driver);
  Future<User> updateUser(User user);
}
