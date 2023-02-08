import 'package:data_repository/src/models/album_model.dart';
import 'package:flutter/material.dart';
import 'package:spotify_demo_app/style/style.dart';

/// The widget that displays an [Album] as a card in a grid.
class SearchResultItemAlbumWidget extends StatelessWidget {
  final Album album;

  SearchResultItemAlbumWidget(this.album, {super.key});

  @override
  Widget build(BuildContext context) {
    return _bodyWidget;
  }

  Widget get _bodyWidget => SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                color: Colors.black,
                child: Image.network(
                  album.coverImage,
                  fit: BoxFit.cover, // add this
                ),
              ),
            ),
            const SizedBox(
              height: 7,
            ),
            _padding(
              Text(album.name),
            ),
            _padding(
              Text(album.artists.join(", "), overflow: TextOverflow.ellipsis, style: _subtitleStyle),
            ),
            _padding(
              Row(
                children: [
                  Text((album.type == AlbumType.single ? "${album.type.name.capitalize()} · " : ""), style: _subtitleStyle),
                  Text(album.year, style: _subtitleStyle),
                ],
              ),
            ),
          ],
        ),
      );

  final TextStyle _subtitleStyle = TextStyle(color: Colors.white.withOpacity(0.7));

  Widget _padding(Widget child) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: child,
      );
}
