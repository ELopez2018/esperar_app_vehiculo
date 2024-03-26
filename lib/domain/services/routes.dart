import 'package:esperar_drivers/domain/entities/routes/route.dart';
import 'package:esperar_drivers/domain/entities/routes/route_request.dart';
import 'package:esperar_drivers/domain/entities/routes/route_update.dart';
import 'package:esperar_drivers/domain/entities/routes/routes_response.dart';

abstract class RoutesServiceInterface {
  Future<Routes?> createRoute(RouteRequest route);
  Future<Routes?> updateRoute(RouteUpdate route, int id);
  Future<RoutesResponse?>? getRoutes();
  Future<bool?> assignRoute(int route, int vehicle);
}
