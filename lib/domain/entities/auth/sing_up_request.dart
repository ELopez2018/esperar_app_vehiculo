import 'package:json_annotation/json_annotation.dart';

part 'sing_up_request.g.dart';

@JsonSerializable()
class SingUpRequest {
  SingUpRequest({
    required this.name,
    required this.nit,
    required this.legalRepresentativeId,
    required this.address,
    required this.email,
    required this.neighborhood,
    required this.city,
    required this.department,
    required this.country,
    required this.phone,
    required this.cellPhone,
    required this.whatsApp,
    required this.username,
    required this.password,
    required this.confirmPassword,
    required this.termsAndConditions,
  });
  final String name;
  final String nit;
  final int legalRepresentativeId;
  final String address;
  final String email;
  final String neighborhood;
  final String city;
  final String department;
  final String country;
  final String phone;
  final String cellPhone;
  final String whatsApp;
  final String username;
  final String password;
  final String confirmPassword;
  final bool termsAndConditions;

  factory SingUpRequest.fromJson(Map<String, dynamic> json) =>
      _$SingUpRequestFromJson(json);
  Map<String, dynamic> toJson() => _$SingUpRequestToJson(this);
}
