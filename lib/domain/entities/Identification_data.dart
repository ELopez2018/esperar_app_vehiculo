import 'package:json_annotation/json_annotation.dart';

part 'Identification_data.g.dart';

@JsonSerializable()
class IdentificationData {
  IdentificationData({
    required this.documentNumber,
    required this.documentType,
  });

  final String? documentNumber;
  final String? documentType;

  factory IdentificationData.fromJson(Map<String, dynamic> json) =>
      _$IdentificationDataFromJson(json);
  Map<String, dynamic> toJson() => _$IdentificationDataToJson(this);
}
