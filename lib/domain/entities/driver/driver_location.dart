import 'package:esperar_drivers/domain/entities/coordinates/coordinates_request.dart';
import 'package:esperar_drivers/domain/entities/driver/driver.dart';
import 'package:json_annotation/json_annotation.dart';

part 'driver_location.g.dart';

@JsonSerializable()
class DriverLocation {
  DriverLocation({
    required this.driver,
    required this.coordinates,
  });

  final Driver driver;
  final List<CoordinatesRequest> coordinates;

  factory DriverLocation.fromJson(Map<String, dynamic> json) =>
      _$DriverLocationFromJson(json);

  Map<String, dynamic> toJson() => _$DriverLocationToJson(this);
}
