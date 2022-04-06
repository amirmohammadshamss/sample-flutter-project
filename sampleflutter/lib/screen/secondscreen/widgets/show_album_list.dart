import 'package:flutter/material.dart';
import 'package:sampleflutter/models/album.dart';
import 'package:provider/provider.dart';
import '../../../providers/cart_model.dart';
class ShowAlbumList extends StatelessWidget {
  const ShowAlbumList({
    Key? key,
    required Future<Album>? futureAlbum,
  }) : _futureAlbum = futureAlbum, super(key: key);

  final Future<Album>? _futureAlbum;

  @override
  Widget build(BuildContext context) {
    _futureAlbum?.then((value) => Provider.of<CartModel>(context, listen: false).add(value));
    return FutureBuilder<Album>(
      future: _futureAlbum,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data!.title);
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return const CircularProgressIndicator();
      },
    );
  }
}