import 'package:json_annotation/json_annotation.dart';

part 'driver_update.g.dart';

@JsonSerializable()
class DriverUpdate {
  DriverUpdate({
    required this.email,
    required this.username,
    required this.firstName,
    required this.secondName,
    required this.lastName,
    required this.birthday,
    required this.gender,
    required this.documentNumber,
    required this.documentType,
    required this.phone,
    required this.licenseExpirationDate,
    required this.termsAndConditions,
  });

  final String? email;
  final String? username;
  final String? firstName;
  final String? secondName;
  final String? lastName;
  @JsonKey(name: 'birthdate')
  final String? birthday;
  final String? gender;
  final int? documentNumber;
  final String? documentType;
  final String? phone;
  final bool termsAndConditions;
  final String licenseExpirationDate;

  factory DriverUpdate.fromJson(Map<String, dynamic> json) =>
      _$DriverUpdateFromJson(json);
  Map<String, dynamic> toJson() => _$DriverUpdateToJson(this);
}
