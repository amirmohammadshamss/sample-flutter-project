import 'package:flutter/material.dart';
import 'package:sampleflutter/screen/firstscreen/first_screen.dart';
import 'package:sampleflutter/screen/secondscreen/second_screen.dart';
import 'package:sampleflutter/Constant.dart';

class RouteWidget extends StatelessWidget {
  const RouteWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ConstantApp.titleApp,
      initialRoute: FirstScreen.routeName,
      routes: {
        FirstScreen.routeName: (context) => const FirstScreen(),
        SecondScreen.routeName: (context) => const SecondScreen(),
      },
    );
  }
}
