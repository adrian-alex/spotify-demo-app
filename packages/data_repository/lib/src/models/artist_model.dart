import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(explicitToJson: true)
class Artist {
  final String name;
  final String? avatar;

  Artist({
    required this.name,
    required this.avatar,
  });
}
