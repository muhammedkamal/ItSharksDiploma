import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todoly/data/models/task.dart';

class DoneScreen extends StatelessWidget {
  List<Task> tasks;
  DoneScreen({Key? key, required this.tasks}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    tasks = tasks.where((element) => element.isDone == true).toList();
    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          onLongPress: () {},
          title: Text(tasks[index].taskName),
          trailing:
              Text(DateFormat("dd/MM hh:mm").format(tasks[index].doneTime!)),
        );
      },
      itemCount: tasks.length,
    );
  }
}
