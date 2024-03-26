import 'package:json_annotation/json_annotation.dart';

part 'vehicle_request.g.dart';

@JsonSerializable()
class VehicleRequest {
  VehicleRequest({
    required this.licensePlate,
    required this.secondaryPlate,
    required this.model,
    required this.brand,
    required this.year,
    required this.color,
    required this.cylinderCapacity,
    required this.capacity,
    required this.occupancy,
    required this.driver,
    required this.soatExpirationDate,
    required this.tecnoMechanicalExpirationDate,
  });

  final String? licensePlate;
  final String? secondaryPlate;
  final String? model;
  final String? brand;
  final int? year;
  final String? color;
  final double? cylinderCapacity;
  final int? capacity;
  final int? occupancy;
  final int? driver;
  final String? soatExpirationDate;
  final String? tecnoMechanicalExpirationDate;

  factory VehicleRequest.fromJson(Map<String, dynamic> json) =>
      _$VehicleRequestFromJson(json);
  Map<String, dynamic> toJson() => _$VehicleRequestToJson(this);
}
