import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:shopping_list/item/presentation/summary_bottom_bar.dart';
import 'package:shopping_list/store/app_state.dart';
import 'package:shopping_list/item/presentation/add_item_page.dart';
import 'package:shopping_list/item/presentation/shopping_list_page.dart';

class ShoppingHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, ShoppingHomePageViewModel>(
      converter: (store) => ShoppingHomePageViewModel.make(store),
      builder: (context, list) {
        return Scaffold(
          appBar: AppBar(title: Text('Shopping List')),
          body: ShoppingListPage(),
          floatingActionButton: FloatingActionButton(
            onPressed: () => _openAddItemPage(context),
            child: Icon(Icons.add),
          ),
          bottomSheet: SummaryBottomBar(),
        );
      },
    );
  }

  void _openAddItemPage(BuildContext context) {
    showDialog(context: context, builder: (context) => AddItemPage());
  }
}

class ShoppingHomePageViewModel {
  ShoppingHomePageViewModel();

  factory ShoppingHomePageViewModel.make(Store<AppState> store) {
    return ShoppingHomePageViewModel();
  }
}
