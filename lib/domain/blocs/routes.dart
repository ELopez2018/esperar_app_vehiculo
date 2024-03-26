import 'package:esperar_drivers/domain/entities/routes/route.dart';
import 'package:esperar_drivers/domain/entities/routes/routes_response.dart';
import 'package:esperar_drivers/domain/repositories/routes.dart';
import 'package:flutter/material.dart';

class RoutesProvider extends ChangeNotifier {
  RoutesProvider({
    required this.routesInterface,
  });

  final RoutesInterface routesInterface;
  RoutesResponse? PageableRoutes;
  List<Routes>? routes;

  Future init() async {
    try {
      final response = await routesInterface.getRoutes();
      if (response != null) {
        PageableRoutes = response;
        routes = response.content.isNotEmpty ? response.content : [];
      } else {
        routes = [];
      }
      notifyListeners();
    } on String catch (_) {
      print(_);
    }
  }

  void addRoute(Routes value) {
    routes!.add(value);
    notifyListeners();
  }
}
