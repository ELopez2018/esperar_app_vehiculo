import 'package:dio/dio.dart';
import 'package:esperar_drivers/config/host.dart';
import 'package:esperar_drivers/core/exceptions/general.dart';
import 'package:esperar_drivers/core/interceptors/refresh_token.dart';
import 'package:esperar_drivers/domain/entities/dropdown.dart';
import 'package:esperar_drivers/domain/entities/vehicle/vehicle.dart';
import 'package:esperar_drivers/domain/entities/vehicle/vehicle_request.dart';
import 'package:esperar_drivers/domain/entities/vehicle/vehicle_update.dart';
import 'package:esperar_drivers/domain/entities/vehicle/vehicles_response.dart';
import 'package:esperar_drivers/domain/repositories/local_storage.dart';
import 'package:esperar_drivers/domain/services/vehicle.dart';
class VehicleService extends VehicleServiceInterface {
  VehicleService({
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
  Future<bool?> assignDriverToVehicle(int vehicleId, int driverId) async {
    try {
      final response =
          await dio.get('/vehicles/assignDriver/$vehicleId/$driverId');
      if (response.statusCode == 204) {
        return true;
      }
    } on DioException catch (_) {
      exception(_);
    }
    return null;
  }

  @override
  Future<Vehicle?> createVehicle(VehicleRequest vehicle) async {
    try {
      final response = await dio.post('/vehicles/create',
          options: Options(contentType: 'application/json'), data: vehicle);
      if (response.statusCode == 200) {
        final dynamic data = response.data;
        return Vehicle.fromJson(data);
      }
    } on DioException catch (_) {
      exception(_);
    }
    return null;
  }

  @override
  Future<VehiclesResponse?> getVehicles(int company) async {
    try {
      final response = await dio.get('/vehicles/find-by-company/$company');
      if (response.statusCode == 200) {
        final dynamic data = response.data;
        return VehiclesResponse.fromJson(data);
      }
    } on DioException catch (_) {
      exception(_);
    }
    return null;
  }

  @override
  Future<List<Dropdown>?> getStatus() async {
    try {
      final response = await dio.get('/vehicles/vehicleStatus');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['vehicleStatuses'];
        return data.map((e) => Dropdown.fromJson(e)).toList();
      }
    } on DioException catch (_) {
      exception(_);
    }
    return null;
  }

  @override
  Future<Vehicle?> updateVehicle(VehicleUpdate vehicle, int vehicleId) async {
    try {
      final response = await dio.put('/vehicles/$vehicleId',
          options: Options(contentType: 'application/json'), data: vehicle);
      if (response.statusCode == 200) {
        final dynamic data = response.data;
        return Vehicle.fromJson(data);
      }
    } on DioException catch (_) {
      exception(_);
    }
    return null;
  }

  @override
  Future<VehiclesResponse?> getVehiclesByRoute(int route) async {
    try {
      final response = await dio.get('/vehicles/find-by-route/$route');
      if (response.statusCode == 200) {
        final dynamic data = response.data;
        return VehiclesResponse.fromJson(data);
      }
    } on DioException catch (_) {
      exception(_);
    }
    return null;
  }
}
