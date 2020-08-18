import 'package:shopping_list/item/model/item.dart';

class AppState {
  List<Item> items;

  AppState(this.items);

  factory AppState.make() {
    return AppState(List());
  }
}