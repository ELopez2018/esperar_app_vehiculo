import 'package:esperar_drivers/domain/entities/pageable.dart';
import 'package:esperar_drivers/domain/entities/routes/route.dart';
import 'package:json_annotation/json_annotation.dart';

part 'routes_response.g.dart';

@JsonSerializable()
class RoutesResponse {
  RoutesResponse({
    required this.content,
    required this.pageable,
  });

  final List<Routes> content;
  final Pageable pageable;

  factory RoutesResponse.fromJson(Map<String, dynamic> json) =>
      _$RoutesResponseFromJson(json);
  Map<String, dynamic> toJson() => _$RoutesResponseToJson(this);
}
