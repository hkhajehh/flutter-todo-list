import 'package:flutter/material.dart';
import 'package:todo/data.dart';
import 'package:todo/edit.dart';
import 'package:todo/widget/checkbox.dart';

class taskitem extends StatefulWidget {
  const taskitem({
    super.key,
    required this.task,
  });

  final TodoTask task;

  @override
  State<taskitem> createState() => _taskitemState();
}

class _taskitemState extends State<taskitem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => EditTodoTaskScreen(
                  task: widget.task,
                )));
      },
      onLongPress: () {
        widget.task.delete();
      },
      child: Container(
        height: 84,
        padding: const EdgeInsets.only(left: 16, right: 16),
        margin: const EdgeInsets.only(top: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Color(0xff52514D),
        ),
        child: Row(
          children: [
            TodoCheckBox(
              value: widget.task.isCompleted,
              onTap: () {
                setState(() {
                  widget.task.isCompleted = !widget.task.isCompleted;
                });
              },
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Text(
                widget.task.name,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 15,
                    decoration: widget.task.isCompleted
                        ? TextDecoration.lineThrough
                        : null),
              ),
            ),
            Icon(
              Icons.edit_note,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
