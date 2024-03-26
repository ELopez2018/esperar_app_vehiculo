import 'package:esperar_drivers/domain/entities/user/rol.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  User({
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
    required this.documentNumber,
    required this.documentType,
    required this.phone,
    required this.currentCountry,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.rol,
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
  final int? documentNumber;
  final String? documentType;
  final String? phone;
  final String? currentCountry;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;
  @JsonKey(name: 'role')
  final Rol rol;

  factory User.fromJson(Map<String, dynamic> json) =>
      _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
