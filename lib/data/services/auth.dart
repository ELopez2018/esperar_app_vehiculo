import 'package:dio/dio.dart';
import 'package:esperar_drivers/config/host.dart';
import 'package:esperar_drivers/core/exceptions/general.dart';
import 'package:esperar_drivers/domain/entities/auth/auth_request.dart';
import 'package:esperar_drivers/domain/entities/auth/auth_response.dart';
import 'package:esperar_drivers/domain/services/auth.dart';

class AuthService extends AuthServiceInterface {
  final Dio dio = Dio(BaseOptions(baseUrl: apiHost));

  @override
  Future<bool> changePassword(String password) {
    // TODO: implement changePassword
    throw UnimplementedError();
  }

  @override
  Future<bool> generateCodeRecoverPassword(String email) {
    // TODO: implement generateCodeRecoverPassword
    throw UnimplementedError();
  }

  @override
  Future<AuthResponse?> singIn(AuthRequest auth) async {
    try {
      final response = await dio.post('/auth/login',
          options: Options(headers: {
            'Content-Type': 'application/json',
          }),
          data: auth.toJson());
      if (response.statusCode == 200) {
        final dynamic data = response.data;
        return AuthResponse.fromJson(data);
      }
      return null;
    } on DioException catch (_) {
      exception(_);
    }
    return null;
  }


  @override
  Future<bool> validateCodeRecoverPassword(String code) {
    // TODO: implement validateCodeRecoverPassword
    throw UnimplementedError();
  }
}
