import 'package:flutter/material.dart';
import 'package:sampleflutter/models/screen_arguments.dart';
import 'package:sampleflutter/service/web_service_album.dart';
import 'package:sampleflutter/screen/secondscreen/widgets/show_album_list.dart';
import 'package:sampleflutter/screen/secondscreen/controlerer_second_screen.dart';
import 'package:provider/provider.dart';
import '../../../providers/cart_model.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);
  static const routeName = '/SecondScreen';

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  WebServiceAlbum webServiceAlbum = WebServiceAlbum();
  final TextEditingController _controller =
      TextEditingController(text: 'quidem molestiae enim');
  ControlereSencondScreen controlereSencondScreen = ControlereSencondScreen();

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;

    return Scaffold(
        appBar: AppBar(
          title: Text(args.title),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 50,
              margin: EdgeInsets.all(10),
              child: TextField(
                controller: _controller,
              ),
            ),
            SizedBox(
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    controlereSencondScreen.getAlbum(_controller.text).then(
                        (value) => {
                              Provider.of<CartModel>(context, listen: false)
                                  .add(value)
                            });
                  });
                },
                child: const Text('Create Data'),
              ),
            ),
             const ShowAlbumList()
          ],
        ));
  }
}
