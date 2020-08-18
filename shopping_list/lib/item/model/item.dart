class Item {
  String name;
  bool isDone;

  Item(this.name, this.isDone);

  void updateIsDone(bool newValue) {
    isDone = newValue;
  }
}
