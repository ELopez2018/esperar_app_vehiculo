
import 'package:esperar_drivers/domain/entities/user/user.dart';

abstract class LocalStorageInterface {
  Future setAccessToken(String value);
  Future<String?> getAccessToken();
  Future setUser(User user);
  Future<User?> getUser();
  Future clean();
}
