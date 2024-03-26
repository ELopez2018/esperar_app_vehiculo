import 'package:esperar_drivers/domain/entities/coordinates/coordinates_request.dart';
import 'package:json_annotation/json_annotation.dart';

part 'route_request.g.dart';

@JsonSerializable()
class RouteRequest {
  RouteRequest({
    required this.name,
    required this.from,
    required this.to,
    required this.coordinates,
    required this.stations,
  });

  final String name;
  final String from;
  final String to;
  final List<CoordinatesRequest> coordinates;
  final List stations;

  factory RouteRequest.fromJson(Map<String, dynamic> json) =>
      _$RouteRequestFromJson(json);
  Map<String, dynamic> toJson() => _$RouteRequestToJson(this);
}
