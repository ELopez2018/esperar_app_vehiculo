import 'package:json_annotation/json_annotation.dart';

part 'driver_request.g.dart';

@JsonSerializable()
class DriverRequest {
  DriverRequest({
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
    required this.password,
    required this.confirmPassword,
    required this.licenseExpirationDate,
    required this.termsAndConditions,
  });

  final String? email;
  final String? username;
  final String password;
  final String confirmPassword;
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

  factory DriverRequest.fromJson(Map<String, dynamic> json) =>
      _$DriverRequestFromJson(json);
  Map<String, dynamic> toJson() => _$DriverRequestToJson(this);
}
