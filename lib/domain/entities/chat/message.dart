import 'package:json_annotation/json_annotation.dart';

part 'message.g.dart';

@JsonSerializable()
class Message {
  final String? id;
  final String senderId;
  final String recipientId;
  final String content;

  Message({
     this.id,
    required this.senderId,
    required this.recipientId,
    required this.content,
  });

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);
  Map<String, dynamic> toJson() => _$MessageToJson(this);
}
