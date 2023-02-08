import 'package:json_annotation/json_annotation.dart';

enum AlbumType { single, album, other }

@JsonSerializable(explicitToJson: true)
class Album {
  final String name;
  final String coverImage;
  final List<String> artists;
  final AlbumType type;
  final String year;

  Album({required this.name, required this.coverImage, required this.artists, required this.type, required this.year});
}
