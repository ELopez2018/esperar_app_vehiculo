import 'package:dio/dio.dart';
import 'package:esperar_drivers/config/host.dart';
import 'package:esperar_drivers/core/exceptions/general.dart';
import 'package:esperar_drivers/core/interceptors/refresh_token.dart';
import 'package:esperar_drivers/domain/entities/driver/driver.dart';
import 'package:esperar_drivers/domain/entities/driver/driver_request.dart';
import 'package:esperar_drivers/domain/entities/driver/driver_update.dart';
import 'package:esperar_drivers/domain/entities/driver/drivers_response.dart';
import 'package:esperar_drivers/domain/entities/dropdown.dart';
import 'package:esperar_drivers/domain/entities/user/user.dart';
import 'package:esperar_drivers/domain/repositories/local_storage.dart';
import 'package:esperar_drivers/domain/services/driver.dart';


class DriverService extends DriverServiceInterface {
  DriverService({
    required this.localStorageInterface,
  });

  final LocalStorageInterface localStorageInterface;
  late final Dio dio = Dio(BaseOptions(baseUrl: apiHost))
    ..interceptors.add(
      ValidateTokenInterceptor(
        localStorageInterface: localStorageInterface,
      ),
    );

  @override
  Future<Driver?> createDriver(DriverRequest driver) async {
    try {
      final response = await dio.post('/users/sign-up/natural-person',
          data: driver.toJson());
      if (response.statusCode == 200) {
        final dynamic data = response.data;
        return Driver.fromJson(data);
      }
    } on DioException catch (_) {
      exception(_);
    }
    return null;
  }

  @override
  Future<User> getDriverByUsername(String username) {
    // TODO: implement getDriverByUsername
    throw UnimplementedError();
  }

  @override
  Future<Driver?> updateDriver(DriverUpdate user, int id) async {
    try {
      final response = await dio.put('/users/$id',
          options: Options(contentType: 'application/json'), data: user);
      if (response.statusCode == 200) {
        final dynamic data = response.data;
        return Driver.fromJson(data);
      }
    } on DioException catch (_) {
      exception(_);
    }
    return null;
  }

  @override
  Future<DriversResponse?> getDrivers(int id) async {
    try {
      final response = await dio.get('/users/find-by-company/$id');
      if (response.statusCode == 200) {
        final dynamic data = response.data;
        return DriversResponse.fromJson(data);
      }
    } on DioException catch (_) {
      exception(_);
    }
    return null;
  }

  @override
  Future<List<Dropdown>?> getGender() async {
    try {
      final response = await dio.get('/users/genders');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['gendersObjects'];
        return data.map((e) => Dropdown.fromJson(e)).toList();
      }
    } on DioException catch (_) {
      exception(_);
    }
    return null;
  }

  @override
  Future<List<Dropdown>?> getDocumentTypes() async {
    try {
      final response = await dio.get('/users/document-types');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['documentTypesObjects'];
        return data.map((e) => Dropdown.fromJson(e)).toList();
      }
    } on DioException catch (_) {
      exception(_);
    }
    return null;
  }
}
