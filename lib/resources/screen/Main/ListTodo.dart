import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sola/blocs/task_bloc.dart';
import 'package:sola/provider/totoListProvider.dart';
import 'package:sola/resources/screen/Main/Task.dart';

class Todos extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StateTodo();
  }
}

class _StateTodo extends State<Todos> {
  @override
  Widget build(BuildContext context) {
    final todoData = Provider.of<TodoListProvider>(context);
    final todoList = todoData.list;
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            "Todo Tasks",
            style: TextStyle(fontSize: 20, fontFamily: "Poppins", height: 1.5),
          ),
          const SizedBox(
            height: 31,
          ),
          Container(
              width: 340,
              height: 240,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.5),
                    blurRadius: 5,
                    offset: Offset(0, 4), // Shadow position
                  ),
                ],
              ),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                child: Column(
                  children: [
                    SizedBox(
                      height: 34,
                      child: Row(
                        children: <Widget>[
                          const Text("Dairy  Tasks.",
                              style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 13,
                                  height: 1.6)),
                          const Spacer(),
                          SizedBox(
                            width: 30,
                            height: 30,
                            child: FloatingActionButton(
                                backgroundColor: Colors.black,
                                onPressed: () => {_dialogBuilder(context)},
                                child: const Icon(Icons.add, size: 20)),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                        child: Scrollbar(
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: todoList.length,
                        padding: const EdgeInsets.symmetric(vertical: 17),
                        itemBuilder: (BuildContext context, int index) {
                          return Task(
                            checked: todoList[index].completed,
                            taskName: todoList[index].taskName,
                            index: index,
                          );
                        },
                      ),
                    ))
                  ],
                ),
              ))
        ]);
  }
}

Future<void> _dialogBuilder(BuildContext context) {
  TextEditingController tasksController = TextEditingController();
  TaskBloc taskBloc = TaskBloc();
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        final todoData = Provider.of<TodoListProvider>(context);
        return AlertDialog(
          title: const Text(
            "Add task.",
            style: TextStyle(fontFamily: "Poppins", fontSize: 20),
          ),
          actionsPadding:
              const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          content: SizedBox(
              child: StreamBuilder(
            builder: (context, snapshot) => TextField(
              controller: tasksController,
              decoration: InputDecoration(
                  hintText: "Enter your task",
                  border: InputBorder.none,
                  filled: true,
                  fillColor: Colors.white,
                  errorText:
                      snapshot.hasError ? snapshot.error.toString() : null),
            ),
            stream: taskBloc.taskStream,
          )),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                if (taskBloc.checkTask(tasksController.text)) {
                  todoData.addTodo(TodoIem(tasksController.text, false));
                  Navigator.of(context).pop();
                }
              },
              child: const Text("Add"),
            )
          ],
          backgroundColor: const Color(0xFFF5F5F5),
        );
      });
}
