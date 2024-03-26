import 'package:esperar_drivers/domain/entities/coordinates/coordinates_request.dart';
import 'package:json_annotation/json_annotation.dart';

part 'route_update.g.dart';

@JsonSerializable()
class RouteUpdate {
  RouteUpdate({
    required this.coordinates,
    required this.stations,
  });

  final List<CoordinatesRequest?>? coordinates;
  final List stations;

  factory RouteUpdate.fromJson(Map<String, dynamic> json) =>
      _$RouteUpdateFromJson(json);
  Map<String, dynamic> toJson() => _$RouteUpdateToJson(this);
}
