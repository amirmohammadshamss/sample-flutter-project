import 'dart:collection';
import 'package:flutter/foundation.dart';
import '../models/album.dart';

class CartModel extends ChangeNotifier {
 
  final List<Album> _items = [];
  UnmodifiableListView<Album> get items => UnmodifiableListView(_items);
  int get totalPrice => _items.length * 42;
 
  void add(Album item) {
    _items.add(item);
    notifyListeners();
  }

  void removeAll() {
    _items.clear();
    notifyListeners();
  }
}
