import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:shopping_list/store/app_state.dart';
import 'package:shopping_list/item/model/item.dart';
import 'package:shopping_list/item/presentation/shopping_list_view_model.dart';

class ShoppingListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, List<Item>>(
      converter: (store) => store.state.items,
      builder: (context, list) {
        return ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) => ShoppingListItem(item: list[index]),
        );
      },
    );
  }
}

class ShoppingListItem extends StatelessWidget {
  final Item item;

  const ShoppingListItem({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ShoppingItemViewModel>(
      converter: (store) => ShoppingItemViewModel.make(store, item),
      builder: (context, viewModel) {
        return ListTile(
          leading: Checkbox(
            value: viewModel.item.isDone,
            onChanged: (newValue) {
              viewModel.onStateChanged(newValue);
            },
          ),
          title: Text(viewModel.item.name),
          trailing: IconButton(
            icon: Icon(Icons.delete),
            onPressed: viewModel.onItemRemoved,
          ),
        );
      },
    );
  }
}
