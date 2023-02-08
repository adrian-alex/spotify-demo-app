import 'package:data_repository/src/models/album_model.dart';
import 'package:flutter/material.dart';

class SearchResultItemAlbumWidget extends StatelessWidget {
  final Album album;

  const SearchResultItemAlbumWidget(this.album, {super.key});

  @override
  Widget build(BuildContext context) {
    return _body;
  }

  ///
  Widget get _body => Container(
        color: Colors.black, //FIXME
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                color: Colors.red,
                child: Image.network(
                  "https://picsum.photos/250?image=9",
                  fit: BoxFit.cover, // add this
                ),
              ),
            ),
            Text("Name"),
            Text("Artist"),
            Text("Type/Year"),
          ],
        ),
      );
}
