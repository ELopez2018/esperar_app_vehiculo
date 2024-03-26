import 'package:esperar_drivers/domain/entities/pageable.dart';
import 'package:esperar_drivers/domain/entities/vehicle/vehicle.dart';
import 'package:json_annotation/json_annotation.dart';

part 'vehicles_response.g.dart';

@JsonSerializable()
class VehiclesResponse {
  VehiclesResponse({
    required this.content,
    required this.pageable,
  });

  final List<Vehicle> content;
  final Pageable pageable;

  factory VehiclesResponse.fromJson(Map<String, dynamic> json) =>
      _$VehiclesResponseFromJson(json);
  Map<String, dynamic> toJson() => _$VehiclesResponseToJson(this);
}
