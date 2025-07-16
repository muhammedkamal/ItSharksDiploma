import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoly/data/models/task.dart';
import 'package:todoly/logic/providers/tasks_provider.dart';

class AllTasks extends StatelessWidget {
  AllTasks({
    Key? key,
  }) : super(key: key);
  List<Task> tasks = [];
  @override
  Widget build(BuildContext context) {
    tasks = Provider.of<TasksProvider>(context).tasks;
    return FutureBuilder(
        future: Provider.of<TasksProvider>(context, listen: false).getTaksFromDB(),
        builder: (context, snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        tasks[index].taskName,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              decoration: tasks[index].isDone ? TextDecoration.lineThrough : null,
                            ),
                      ),
                      trailing: Checkbox(
                        onChanged: (val) async {
                          tasks[index].isDone = val!;
                          if (val) {
                            tasks[index].doneTime = DateTime.now();
                          }

                          await Provider.of<TasksProvider>(context, listen: false).updateTask(tasks[index]);
                        },
                        value: tasks[index].isDone,
                      ),
                    );
                  },
                  itemCount: tasks.length,
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        });
  }
}
