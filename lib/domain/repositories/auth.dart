import 'package:esperar_drivers/domain/entities/auth/auth_request.dart';
import 'package:esperar_drivers/domain/entities/auth/auth_response.dart';

abstract class AuthInterface {
  Future<AuthResponse?> singIn(AuthRequest auth);
  Future<bool> generateCodeRecoverPassword(String email);
  Future<bool> validateCodeRecoverPassword(String code);
  Future<bool> changePassword(String password);
}
