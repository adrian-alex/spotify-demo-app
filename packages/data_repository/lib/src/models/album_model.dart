import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(explicitToJson: true)
class Album {
  final String name;
  final String coverImage;
  final String artist;
  final String type;
  final String year;

  Album({required this.name, required this.coverImage, required this.artist, required this.type, required this.year});
}
