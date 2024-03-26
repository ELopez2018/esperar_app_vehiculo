import 'package:json_annotation/json_annotation.dart';

part 'cities.g.dart';

@JsonSerializable()
class Cities {
  Cities({
    required this.id,
    required this.name,
  });

  final int id;
  final String name;

  factory Cities.fromJson(Map<String, dynamic> json) => _$CitiesFromJson(json);
  Map<String, dynamic> toJson() => _$CitiesToJson(this);
}
