import 'package:flutter/material.dart';
import 'package:sampleflutter/models/screen_arguments.dart';
import 'package:sampleflutter/service/web_service_album.dart';
import 'package:sampleflutter/models/album.dart';
import 'package:sampleflutter/screen/secondscreen/widgets/show_album_list.dart';
class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);
  static const routeName = '/SecondScreen';

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  WebServiceAlbum webServiceAlbum = WebServiceAlbum();
  final TextEditingController _controller = TextEditingController();
  Future<Album>? _futureAlbum;

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;

    return Scaffold(
        appBar: AppBar(
          title: Text(args.title),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _controller,
              decoration: const InputDecoration(hintText: 'Enter Title'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _futureAlbum = webServiceAlbum.createAlbum(_controller.text);
                });
              },
              child: const Text('Create Data'),
            ),
            ShowAlbumList(futureAlbum: _futureAlbum)
          ],
        ));
  }
}


