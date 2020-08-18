import 'package:shopping_list/store/app_state.dart';
import 'package:shopping_list/item/redux/action.dart';

AppState appReducer(AppState appState, dynamic action) {
  if(action is AddItemAction) {
    return addItem(appState, action);
  } else if (action is ToggleItemStateAction){
    return toggleItemState(appState, action);
  } else if (action is RemoveItemAction) {
    return removeItem(appState, action);
  }
  return appState;
}

AppState addItem(AppState appState, AddItemAction action) {
  return AppState(List.from(appState.items)..add(action.item));
}

AppState removeItem(AppState appState, RemoveItemAction action) {
  return AppState(List.from(appState.items)..remove(action.item));
}

AppState toggleItemState(AppState appState, ToggleItemStateAction  action) {
  return AppState(appState.items.map ((item) => item.name == action.item.name ? action.item : item).toList());
}