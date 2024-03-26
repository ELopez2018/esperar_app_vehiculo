import 'package:json_annotation/json_annotation.dart';

part 'vehicle_update.g.dart';

@JsonSerializable()
class VehicleUpdate {
  VehicleUpdate({
    required this.soatExpirationDate,
    required this.tecnoMechanicalExpirationDate,
    required this.status,
  });

  final String? status;
  final String? soatExpirationDate;
  final String? tecnoMechanicalExpirationDate;

  factory VehicleUpdate.fromJson(Map<String, dynamic> json) =>
      _$VehicleUpdateFromJson(json);
  Map<String, dynamic> toJson() => _$VehicleUpdateToJson(this);
}
