import 'package:json_annotation/json_annotation.dart';

part 'rol.g.dart';

@JsonSerializable()
class Rol{
  final int id;
  final String name;

  Rol({required this.id, required this.name});

  
  factory Rol.fromJson(Map<String, dynamic> json) =>
      _$RolFromJson(json);
  Map<String, dynamic> toJson() => _$RolToJson(this);
}