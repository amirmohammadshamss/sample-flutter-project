import 'package:flutter/material.dart';
import 'package:sampleflutter/models/album.dart';
import 'package:provider/provider.dart';
import '../../../providers/cart_model.dart';

class ShowAlbumList extends StatefulWidget {
  const ShowAlbumList({Key? key}) : super(key: key);

  @override
  State<ShowAlbumList> createState() => _ShowAlbumListState();
}

class _ShowAlbumListState extends State<ShowAlbumList> {
  List<Album> names = <Album>[];

  @override
  Widget build(BuildContext context) {
    addAlboumToCart(context);

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double heightAppBar = AppBar().preferredSize.height;
    return SingleChildScrollView(
      child: SizedBox(
        height: height - 100 - heightAppBar - 44,
        width: width,
        child: Column(children: <Widget>[
          Flexible(
              child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: names.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 25,
                      width: double.infinity,
                      margin: const EdgeInsets.all(5),
                      color: Color.fromARGB(255, 185, 216, 241),
                      child: Container(
                        margin: const EdgeInsets.all(2),
                        child: Center(
                            child: Text(
                          names[index].title,
                          style: const TextStyle(fontSize: 18),
                        )),
                      ),
                    );
                  }))
        ]),
      ),
    );
  }

  void addAlboumToCart(context) {
    setState(() {
      names = Provider.of<CartModel>(context).items;
    });
    //
  }

  Widget resultOfFutureBuilder(snapshot) {
    if (snapshot.hasData) {
      // return Text(snapshot.data!.title);

    } else if (snapshot.hasError) {
      return Text('${snapshot.error}');
    }
    return Row();
  }
}
