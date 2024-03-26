import 'package:esperar_drivers/domain/entities/coordinates/coordinates.dart';
import 'package:json_annotation/json_annotation.dart';

part 'route.g.dart';

@JsonSerializable()
class Routes {
  Routes({
    required this.id,
    required this.name,
    required this.from,
    required this.to,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.coordinates,
  });

  final int? id;
  final String? name;
  final String? from;
  final String? to;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;
  final List<Coordinates?>? coordinates;

  factory Routes.fromJson(Map<String, dynamic> json) => _$RoutesFromJson(json);
  Map<String, dynamic> toJson() => _$RoutesToJson(this);
}
