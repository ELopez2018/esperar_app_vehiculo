import 'package:dio/dio.dart';
import 'package:esperar_drivers/config/host.dart';
import 'package:esperar_drivers/core/exceptions/general.dart';
import 'package:esperar_drivers/core/interceptors/refresh_token.dart';
import 'package:esperar_drivers/domain/entities/routes/route.dart';
import 'package:esperar_drivers/domain/entities/routes/route_request.dart';
import 'package:esperar_drivers/domain/entities/routes/route_update.dart';
import 'package:esperar_drivers/domain/entities/routes/routes_response.dart';
import 'package:esperar_drivers/domain/repositories/local_storage.dart';
import 'package:esperar_drivers/domain/services/routes.dart';

class RouteService extends RoutesServiceInterface {
  final LocalStorageInterface localStorageInterface;
  late final Dio dio = Dio(BaseOptions(baseUrl: apiHost))
    ..interceptors.add(
      ValidateTokenInterceptor(
        localStorageInterface: localStorageInterface,
      ),
    );

  RouteService({required this.localStorageInterface});
  @override
  Future<Routes?> createRoute(RouteRequest route) async {
    try {
      final response = await dio.post(
        '/routes',
        options: Options(contentType: 'application/json'),
        data: route.toJson(),
      );
      if (response.statusCode == 200) {
        final dynamic data = response.data;
        return Routes.fromJson(data);
      }
    } on DioException catch (_) {
      exception(_);
    }
    return null;
  }

  @override
  Future<RoutesResponse?>? getRoutes() async {
    try {
      final response = await dio.get(
        '/routes',
      );
      if (response.statusCode == 200) {
        final dynamic data = response.data;
        return RoutesResponse.fromJson(data);
      }
      return null;
    } on DioException catch (_) {
      exception(_);
    }
    return null;
  }

  @override
  Future<Routes?> updateRoute(RouteUpdate route, int id) async {
    try {
      final response = await dio.put('/routes/$id',
          data: route, options: Options(contentType: 'application/json'));
      if (response.statusCode == 200) {
        final dynamic data = response.data;
        if (data != null) {
          return Routes.fromJson(data);
        }
        return null;
      }
    } on DioException catch (_) {
      exception(_);
    }
    return null;
  }

  @override
  Future<bool?> assignRoute(int route, int vehicle) async {
    try {
      final response =
          await dio.get('/routes/assign-vehicle-to-route/$route/$vehicle');
      if (response.statusCode == 200) {
        return true;
      }
    } on DioException catch (_) {
      exception(_);
    }
    return null;
  }
}
