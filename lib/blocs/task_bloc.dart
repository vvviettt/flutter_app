import 'dart:async';

class TaskBloc {
  final StreamController _taskController = StreamController();

  Stream get taskStream => _taskController.stream;

  bool checkTask(String task) {
    if (task.isEmpty) {
      _taskController.addError("Please enter task name");
      return false;
    }
    _taskController.add("Ok");
    return true;
  }

  void dispose() {
    _taskController.close();
  }
}
