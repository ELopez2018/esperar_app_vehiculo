import 'package:json_annotation/json_annotation.dart';

part 'dropdown.g.dart';

@JsonSerializable()
class Dropdown {
  Dropdown({
    required this.name,
    required this.value,
  });

  final String? name;
  final String? value;

  factory Dropdown.fromJson(Map<String, dynamic> json) =>
      _$DropdownFromJson(json);
  Map<String, dynamic> toJson() => _$DropdownToJson(this);
}
