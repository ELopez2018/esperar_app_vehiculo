import 'package:esperar_drivers/domain/entities/Identification_data.dart';
import 'package:esperar_drivers/domain/entities/user/user.dart';
import 'package:esperar_drivers/domain/entities/vehicle/vehicle.dart';
import 'package:json_annotation/json_annotation.dart';

part 'driver.g.dart';

@JsonSerializable()
class Driver {
  Driver({
    required this.id,
    required this.email,
    required this.username,
    required this.fullName,
    required this.image,
    required this.firstName,
    required this.secondName,
    required this.lastName,
    required this.birthday,
    required this.gender,
    required this.phone,
    required this.currentCountry,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.company,
    required this.vehicle,
    required this.licenseExpirationDate,
    required this.identificationData,
  });

  final int id;
  final String? email;
  final String? username;
  final String? fullName;
  final String? image;
  final String? firstName;
  final String? secondName;
  final String? lastName;
  @JsonKey(name: 'birthdate')
  final String? birthday;
  final String? gender;
  final IdentificationData? identificationData;
  final String? phone;
  final String? currentCountry;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;
  @JsonKey(name: 'currentCompany')
  final User? company;
  @JsonKey(name: 'currentVehicle')
  final Vehicle? vehicle;
  final String? licenseExpirationDate;

  factory Driver.fromJson(Map<String, dynamic> json) => _$DriverFromJson(json);
  Map<String, dynamic> toJson() => _$DriverToJson(this);
}
