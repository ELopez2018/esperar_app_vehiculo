import 'package:json_annotation/json_annotation.dart';

part 'coordinates_request.g.dart';

@JsonSerializable()
class CoordinatesRequest {
  CoordinatesRequest({
    required this.latitude,
    required this.longitude,
  });

  final String latitude;
  final String longitude;

  factory CoordinatesRequest.fromJson(Map<String, dynamic> json) =>
      _$CoordinatesRequestFromJson(json);
  Map<String, dynamic> toJson() => _$CoordinatesRequestToJson(this);
}
