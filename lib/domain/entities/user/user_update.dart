import 'package:esperar_drivers/domain/entities/user/rol.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_update.g.dart';

@JsonSerializable()
class UserUpdate {
  UserUpdate({
    required this.email,
    required this.username,
    required this.fullName,
    required this.image,
    required this.firstName,
    required this.secondName,
    required this.lastName,
    required this.documentNumber,
    required this.documentType,
    required this.phone,
    required this.currentCountry,
    required this.rol,
  });

  final String? email;
  final String? username;
  final String? fullName;
  final String? image;
  final String? firstName;
  final String? secondName;
  final String? lastName;
  final int? documentNumber;
  final String? documentType;
  final String? phone;
  final String? currentCountry;
  @JsonKey(name: 'role')
  final Rol rol;

  factory UserUpdate.fromJson(Map<String, dynamic> json) =>
      _$UserUpdateFromJson(json);
  Map<String, dynamic> toJson() => _$UserUpdateToJson(this);
}
