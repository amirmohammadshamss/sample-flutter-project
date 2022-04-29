import 'package:flutter/material.dart';
import 'package:sampleflutter/screen/secondscreen/second_screen.dart';
import 'package:sampleflutter/models/screen_arguments.dart';
import 'package:provider/provider.dart';

import '../../providers/cart_model.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);
  static const routeName = '/FirstScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Screen'),
      ),
      body: Column(
        children: [
          Center(
            child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    SecondScreen.routeName,
                    arguments: ScreenArguments(
                      'Extract Arguments Screen',
                      'This message is extracted in the build method.',
                    ),
                  );
                },
                child: const Text("Total price")),
          ),
          Consumer<CartModel>(
            builder: (context, cart, child) {
              return Text("Total price: ${cart.totalPrice}");
            },
          ),
        ],
      ),
    );
  }
}
