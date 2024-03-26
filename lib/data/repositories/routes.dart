import 'package:esperar_drivers/domain/entities/routes/route.dart';
import 'package:esperar_drivers/domain/entities/routes/route_request.dart';
import 'package:esperar_drivers/domain/entities/routes/route_update.dart';
import 'package:esperar_drivers/domain/entities/routes/routes_response.dart';
import 'package:esperar_drivers/domain/repositories/routes.dart';
import 'package:esperar_drivers/domain/services/routes.dart';

class RoutesRepository extends RoutesInterface {
  RoutesRepository({
    required this.routesServiceInterface,
  });

  final RoutesServiceInterface routesServiceInterface;

  @override
  Future<Routes?> createRoute(RouteRequest route) async {
    try {
      return await routesServiceInterface.createRoute(route);
    } on String catch (_) {
      rethrow;
    }
  }

  @override
  Future<RoutesResponse?> getRoutes() async {
    try {
      return await routesServiceInterface.getRoutes();
    } on String catch (_) {
      rethrow;
    }
  }

  @override
  Future<Routes?> updateRoute(RouteUpdate route, int id) async {
    try {
      return await routesServiceInterface.updateRoute(route, id);
    } on String catch (_) {
      rethrow;
    }
  }

  @override
  Future<bool?> assignRoute(int route, int vehicle) async {
    return await routesServiceInterface.assignRoute(route, vehicle);
  }
}
