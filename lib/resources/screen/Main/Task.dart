import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sola/provider/totoListProvider.dart';

class Task extends StatefulWidget {
  bool checked = false;
  String taskName;
  int index;
  Task(
      {super.key,
      required this.checked,
      required this.taskName,
      required this.index});
  @override
  State<StatefulWidget> createState() {
    return _StateTask();
  }
}

class _StateTask extends State<Task> {
  @override
  Widget build(BuildContext context) {
    final todoList = Provider.of<TodoListProvider>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 230,
          // color: Colors.black,
          child: GestureDetector(
              onLongPress: () => {},
              child: SizedBox(
                  height: 40,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 20,
                        height: 20,
                        child: Checkbox(
                          onChanged: (bool? value) {
                            setState(() {
                              todoList.completed(widget.index);
                            });
                          },
                          value: widget.checked,
                          checkColor: const Color(0xFF55847A),
                          activeColor: const Color(0xFF55847A),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Flexible(
                          child: Container(
                        padding: const EdgeInsets.only(right: 13.0),
                        child: Text(
                          widget.taskName,
                          style: const TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 13,
                              overflow: TextOverflow.ellipsis),
                        ),
                      )),
                    ],
                  ))),
        ),
        const Spacer(),
        Container(
          width: 40,
          decoration: const BoxDecoration(color: Colors.redAccent),
          child: InkWell(
            child:
                const Icon(Icons.delete_outline_outlined, color: Colors.white),
            onTap: () => {},
          ),
        )
      ],
    );
  }
}

// Future<void> _dialogBuilder(BuildContext context) {
//   return showDialog(
//       context: context,
//       builder: (BuildContext context) => AlertDialog(
//             title: const Text('Warning'),
//             content: const Text('Are you sure you want to remove?'),
//             actions: [
//               TextButton(
//                 onPressed: (() => {}),
//                 child: const Text("Cancel"),
//               ),
//               TextButton(
//                 onPressed: (() => {}),
//                 child: const Text("Remove"),
//               )
//             ],
//           ));
// }
