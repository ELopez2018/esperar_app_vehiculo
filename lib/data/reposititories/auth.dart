

import 'package:esperar_drivers/domain/entities/auth/auth_request.dart';
import 'package:esperar_drivers/domain/entities/auth/auth_response.dart';
import 'package:esperar_drivers/domain/repositories/auth.dart';
import 'package:esperar_drivers/domain/services/auth.dart';

class AuthRepository extends AuthInterface {
  AuthRepository({
    required this.authServiceInterface,
  });

  final AuthServiceInterface authServiceInterface;

  @override
  Future<bool> changePassword(String password) async {
    try {
      return await authServiceInterface.changePassword(password);
    } on String catch (_) {
      rethrow;
    }
  }

  @override
  Future<bool> generateCodeRecoverPassword(String email) async {
    try {
      return await authServiceInterface.generateCodeRecoverPassword(email);
    } on String catch (_) {
      rethrow;
    }
  }

  @override
  Future<AuthResponse?> singIn(AuthRequest auth) async {
    try {
      return await authServiceInterface.singIn(auth);
    } on String catch (_) {
      rethrow;
    }
  }


  @override
  Future<bool> validateCodeRecoverPassword(String code) async {
    try {
      return await authServiceInterface.validateCodeRecoverPassword(code);
    } on String catch (_) {
      rethrow;
    }
  }
}
