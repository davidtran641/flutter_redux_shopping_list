import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:shopping_list/item/presentation/shopping_home_page.dart';

import '../store/app_state.dart';

class ShoppingListApp extends StatelessWidget {
  final Store<AppState> store;

  ShoppingListApp(this.store);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: 'Shopping List',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: ShoppingHomePage(),
      ),
    );
  }
}
