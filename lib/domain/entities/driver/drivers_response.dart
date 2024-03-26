import 'package:esperar_drivers/domain/entities/driver/driver.dart';
import 'package:esperar_drivers/domain/entities/pageable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'drivers_response.g.dart';

@JsonSerializable()
class DriversResponse {
  DriversResponse({
    required this.content,
    required this.pageable,
  });

  final List<Driver> content;
  final Pageable pageable;

  factory DriversResponse.fromJson(Map<String, dynamic> json) =>
      _$DriversResponseFromJson(json);
  Map<String, dynamic> toJson() => _$DriversResponseToJson(this);
}
