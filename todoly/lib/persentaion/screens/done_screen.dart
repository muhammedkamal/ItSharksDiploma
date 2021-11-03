import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todoly/data/models/task.dart';
import 'package:todoly/logic/providers/tasks_provider.dart';

class DoneScreen extends StatelessWidget {
  final TasksProvider tasksProvider;
  DoneScreen({Key? key, required this.tasksProvider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Task> tasks = tasksProvider.tasks;
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
