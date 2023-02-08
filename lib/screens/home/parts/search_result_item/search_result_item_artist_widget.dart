import 'package:data_repository/data_repository.dart';
import 'package:flutter/material.dart';

class SearchResultItemArtistWidget extends StatelessWidget {
  final Artist artist;

  const SearchResultItemArtistWidget(this.artist, {super.key});

  @override
  Widget build(BuildContext context) {
    return _body;
  }

  ///
  Widget get _body => Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(
                    artist.avatar,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(artist.name)
          ],
        ),
      );
}
