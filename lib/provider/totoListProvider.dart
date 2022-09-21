import 'package:flutter/material.dart';

class TodoListProvider extends ChangeNotifier {
  final List<TodoIem> _list = [
    TodoIem(
        "mf,safdjnasdfolasdfnkasdjfhaksdfjhaskdjfhkasjdfkasdfhasjkdfhaskdfhaksdj",
        false)
  ];

  List<TodoIem> get list => _list;

  addTodo(TodoIem item) {
    _list.add(item);
    notifyListeners();
  }

  removeTodo(int index) {
    _list.removeAt(index);
    notifyListeners();
  }

  completed(int index) {
    _list[index].completed = !_list[index].completed;
    notifyListeners();
  }
}

class TodoIem {
  bool completed;
  String taskName;
  TodoIem(this.taskName, this.completed);
}
