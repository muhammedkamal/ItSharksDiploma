import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todoly/data/models/task.dart';
import 'package:todoly/logic/providers/tasks_provider.dart';

class DoneScreen extends StatelessWidget {
  DoneScreen({Key? key}) : super(key: key);
  List<Task> tasks = [];
  @override
  Widget build(BuildContext context) {
    var tasksProvider = Provider.of<TasksProvider>(context);
    tasks = Provider.of<TasksProvider>(context).tasks;
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
