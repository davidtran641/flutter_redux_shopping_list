
import 'package:shopping_list/item/model/item.dart';

class AddItemAction {
  final Item  item;
  AddItemAction(this.item);
}

class RemoveItemAction {
  final Item  item;
  RemoveItemAction(this.item);
}

class ToggleItemStateAction {
  final Item item;

  ToggleItemStateAction(this.item);

}

