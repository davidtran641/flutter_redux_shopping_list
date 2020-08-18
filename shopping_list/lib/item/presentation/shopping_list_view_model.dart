import 'package:redux/redux.dart';
import 'package:shopping_list/store/app_state.dart';
import 'package:shopping_list/item/model/item.dart';
import 'package:shopping_list/item/redux/action.dart';

class ShoppingListViewModel {
  List<Item> items;
}

class ShoppingItemViewModel {
  Item item;
  Function(bool newValue) onStateChanged;
  Function() onItemRemoved;

  ShoppingItemViewModel(this.item, this.onStateChanged, this.onItemRemoved);

  factory ShoppingItemViewModel.make(Store<AppState> store, Item item) {
    return ShoppingItemViewModel(item, (bool newValue) {
      store.dispatch(ToggleItemStateAction(item..updateIsDone(newValue)));
    },() {
      store.dispatch(RemoveItemAction(item));
    });
  }
}
