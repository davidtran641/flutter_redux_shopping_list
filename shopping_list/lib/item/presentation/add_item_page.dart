
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:shopping_list/store/app_state.dart';
import 'package:shopping_list/item/redux/action.dart';
import 'package:shopping_list/item/model/item.dart';
import 'package:redux/redux.dart';

class AddItemPage extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AddItemPageViewModel>(
      converter: (store) => AddItemPageViewModel.make(store),
      builder: (context, viewModel) {
        return AlertDialog(
          contentPadding: EdgeInsets.all(16),
          content: Row(
            children: <Widget>[
              Expanded(
                child: TextField(
                  autofocus: true,
                  decoration: InputDecoration(labelText: 'Item name', hintText: 'eg. Apple'),
                  controller: _controller,
                ),
              )
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Cancel'),
              onPressed: () { Navigator.pop(context); },
            ),
            FlatButton(
              child: Text('Add'),
              onPressed: () {
                Navigator.pop(context);
                viewModel.addItemCallback(_controller.text);
              },
            )
          ],
        );
      },
    );
  }
}

class AddItemPageViewModel {
  Function(String itemName) addItemCallback;
  AddItemPageViewModel(this.addItemCallback);

  factory AddItemPageViewModel.make(Store<AppState> store) {
    return AddItemPageViewModel(
        (itemName) => store.dispatch(AddItemAction(Item(itemName, false)))
    );
  }
}