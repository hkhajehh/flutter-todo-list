import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/data.dart';
import 'package:todo/edit.dart';
import 'package:todo/main.dart';
import 'package:todo/widget/taskitem.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final taskbox = Hive.box<TodoTask>(todotaskBoxName);
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => EditTodoTaskScreen(
                      task: TodoTask(),
                    )));
          },
          label: Text(
            'Add New Task',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Color(0xff070709)),
          )),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 85,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(children: [
                  Row(
                    children: [
                      Image.asset('assets/images/profile.png'),
                      Text(
                        'Hossein Khajeh',
                        style: TextStyle(
                            fontWeight: FontWeight.w200, fontSize: 13),
                      ),
                    ],
                  ),
                ]),
              ),
            ),
            Expanded(
              child: ValueListenableBuilder<Box<TodoTask>>(
                valueListenable: taskbox.listenable(),
                builder: (context, value, child) {
                  return ListView.builder(
                      padding: EdgeInsets.fromLTRB(16, 16, 16, 100),
                      itemCount: taskbox.values.length + 1,
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Today Task',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Container(
                                    width: 35,
                                    height: 3,
                                    margin: EdgeInsets.only(top: 4),
                                    decoration: BoxDecoration(
                                        color: Color(0xffFEEECA),
                                        borderRadius:
                                            BorderRadius.circular(1.5)),
                                  )
                                ],
                              ),
                              MaterialButton(
                                color: Color(0xffFEEECA),
                                elevation: 0,
                                textColor: Color(0xff070709),
                                onPressed: () {
                                  taskbox.clear();
                                },
                                child: Icon(
                                  Icons.delete,
                                  size: 16,
                                ),
                              ),
                            ],
                          );
                        } else {
                          final TodoTask task =
                              taskbox.values.toList()[index - 1];
                          return taskitem(task: task);
                        }
                      });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
