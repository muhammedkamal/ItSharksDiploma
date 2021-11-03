import 'package:flutter/material.dart';
import 'package:todoly/data/models/task.dart';
import 'package:todoly/logic/providers/tasks_provider.dart';

class AllTasks extends StatefulWidget {
  final TasksProvider tasksProvider;
  AllTasks({Key? key, required this.tasksProvider}) : super(key: key);

  @override
  _AllTasksState createState() => _AllTasksState();
}

class _AllTasksState extends State<AllTasks> {
  List<Task> tasks = [];
  @override
  void initState() {
    tasks = widget.tasksProvider.tasks;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            tasks[index].taskName,
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  decoration:
                      tasks[index].isDone ? TextDecoration.lineThrough : null,
                ),
          ),
          trailing: Checkbox(
            onChanged: (val) async {
              tasks[index].isDone = val!;
              if (val) {
                tasks[index].doneTime = DateTime.now();
              }

              await widget.tasksProvider.updateTask(tasks[index]);
              setState(() {
                tasks = widget.tasksProvider.tasks;
              });
            },
            value: tasks[index].isDone,
          ),
        );
      },
      itemCount: tasks.length,
    );
  }
}
