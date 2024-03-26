import 'package:dio/dio.dart';
import 'package:esperar_drivers/config/host.dart';
import 'package:esperar_drivers/core/exceptions/general.dart';
import 'package:esperar_drivers/core/interceptors/refresh_token.dart';
import 'package:esperar_drivers/domain/entities/driver/driver.dart';
import 'package:esperar_drivers/domain/entities/driver/driver_request.dart';
import 'package:esperar_drivers/domain/entities/user/user.dart';
import 'package:esperar_drivers/domain/repositories/local_storage.dart';
import 'package:esperar_drivers/domain/services/user.dart';


class UserService extends UserServiceInterface {
  UserService({required this.localStorageInterface});
  late final LocalStorageInterface localStorageInterface;
  late final Dio dio = Dio(BaseOptions(baseUrl: apiHost))
    ..interceptors.add(
        ValidateTokenInterceptor(localStorageInterface: localStorageInterface));

  @override
  Future<Driver> createDriver(DriverRequest driver) {
    // TODO: implement createDriver
    throw UnimplementedError();
  }

  @override
  Future<User?> getUserByToken() async {
    try {
      final response = await dio.get('/auth/current-user');
      if (response.statusCode == 200) {
        final dynamic data = response.data;
        return User.fromJson(data);
      }
      return null;
    } on DioException catch (_) {
      exception(_);
    }
    return null;
  }

  @override
  Future<User> getUserByUsername(String username) {
    // TODO: implement getUserByUsername
    throw UnimplementedError();
  }

  @override
  Future<User> updateUser(User user) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }
}
