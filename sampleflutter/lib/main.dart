import 'package:flutter/material.dart';
import 'package:sampleflutter/providers/cart_model.dart';
import 'package:sampleflutter/route_widget.dart';
import 'package:provider/provider.dart';
void main() {
    runApp(
    ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: const RouteWidget(),
    ),
  );
}
