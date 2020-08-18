import 'package:flutter/material.dart';
import 'package:shopping_list/app/app.dart';
import 'package:shopping_list/store/store.dart';

void main() {
  final store = createStore();
  runApp(ShoppingListApp(store));
}
