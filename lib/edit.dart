import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/data.dart';
import 'package:todo/main.dart';

class EditTodoTaskScreen extends StatefulWidget {
  final TodoTask task;

  EditTodoTaskScreen({super.key, required this.task});

  @override
  State<EditTodoTaskScreen> createState() => _EditTodoTaskScreenState();
}

class _EditTodoTaskScreenState extends State<EditTodoTaskScreen> {
  late final TextEditingController _controller =
      TextEditingController(text: widget.task.name);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Todo Task',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xff070709),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          widget.task.name = _controller.text;
          if (widget.task.isInBox) {
            widget.task.save();
          } else {
            final Box<TodoTask> box = Hive.box(todotaskBoxName);
            box.add(widget.task);
          }
          Navigator.of(context).pop();
        },
        label: Text(
          'Save Task',
          style:
              TextStyle(fontWeight: FontWeight.bold, color: Color(0xff070709)),
        ),
      ),
      body: Column(
        children: [
          Image.asset('assets/images/profile.png'),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                  label: Text('Add a Task...'),
                  border: OutlineInputBorder(),
                  hoverColor: Colors.amberAccent),
            ),
          ),
        ],
      ),
    );
  }
}
