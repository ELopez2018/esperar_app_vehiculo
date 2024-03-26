import 'package:json_annotation/json_annotation.dart';

part 'sing_up_response.g.dart';

@JsonSerializable()
class SingUpResponse {
  SingUpResponse({
    required this.id,
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
    required this.termsAndConditions,
  });
  final int id;
  final String? name;
  final String? nit;
  final int? legalRepresentativeId;
  final String? address;
  final String email;
  final String? neighborhood;
  final String? city;
  final String? department;
  final String? country;
  final String? phone;
  final String? cellPhone;
  final String? whatsApp;
  final String? username;
  final bool? termsAndConditions;

  factory SingUpResponse.fromJson(Map<String, dynamic> json) =>
      _$SingUpResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SingUpResponseToJson(this);
}
