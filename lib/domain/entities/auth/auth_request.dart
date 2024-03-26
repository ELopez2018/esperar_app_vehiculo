import 'package:json_annotation/json_annotation.dart';

part 'auth_request.g.dart';

@JsonSerializable()
class AuthRequest {
  AuthRequest({
    required this.username,
    required this.password,
    this.confirmPassword,
  });

  final String username;
  final String password;
  final String? confirmPassword;
  
  factory AuthRequest.fromJson(Map<String, dynamic> json) =>
      _$AuthRequestFromJson(json);
  Map<String, dynamic> toJson() => _$AuthRequestToJson(this);
}
