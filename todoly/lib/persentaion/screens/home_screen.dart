// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:todoly/data/models/task.dart';
import 'package:todoly/logic/providers/tasks_provider.dart';
import 'package:todoly/persentaion/screens/done_screen.dart';
import 'package:todoly/persentaion/screens/to_do_screen.dart';

import 'add_task_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //Database? db;
  List<Task> tasks = [];
  final TasksProvider tasksProvider = TasksProvider();
  /* List<Task> tasks = [
    Task(taskName: "eat breakfast"),
    Task(taskName: "drink cofee"),
    Task(taskName: "morining training"),
    Task(taskName: "Go to Work"),
  ]; */

  @override
  void initState() {
    intilizeDB();
    super.initState();
  }

  Future<void> intilizeDB() async {
    await tasksProvider.getTaksFromDB();
    setState(() {
      tasks = tasksProvider.tasks;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            /* Navigator.of(context)
                .pushNamed(AddTaskScreen.routeName, arguments: tasks); */
            var text = await Navigator.of(context)
                .pushNamed(AddTaskScreen.routeName) as String;
            final task = Task(taskName: text);
            await tasksProvider.addTaskToDB(task);

            setState(() {
              tasks = tasksProvider.tasks;
            });
          },
          child: Icon(Icons.add),
        ),
        appBar: AppBar(
          title: Text("Organize your tasks"),
          bottom: TabBar(
            tabs: [
              Tab(
                text: "All Tasks",
              ),
              Tab(
                text: "To DO",
              ),
              Tab(
                text: "Done",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    tasks[index].taskName,
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          decoration: tasks[index].isDone
                              ? TextDecoration.lineThrough
                              : null,
                        ),
                  ),
                  trailing: Checkbox(
                    onChanged: (val) async {
                      tasks[index].isDone = val!;
                      tasks[index].doneTime = DateTime.now();
                      await tasksProvider.updateTaskDoneTime(tasks[index]);

                      setState(() {
                        tasks = tasksProvider.tasks;
                      });
                    },
                    value: tasks[index].isDone,
                  ),
                );
              },
              itemCount: tasks.length,
            ),
            /* ListView(
              children: tasks
                  .map(
                    (e) => ListTile(
                      title: Text(e.taskName),
                      trailing: Checkbox(
                        onChanged: (val) {
                          setState(() {
                            e.isDone = val!;
                          });
                        },
                        value: e.isDone,
                      ),
                    ),
                  )
                  .toList(),
            ), */
            ToDoScreen(
              toDoTasks: tasks,
            ),
            DoneScreen(
              tasks: tasks,
            ),
          ],
        ),
      ),
    );
    /* DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Organize your tasks"),
          bottom: TabBar(
            // ignore: prefer_const_literals_to_create_immutables
            tabs: [
              Tab(
                child: Text(
                  "All Tasks",
                ),
              ),
              Tab(
                child: Text("ToDo Tasks"),
              ),
              Tab(
                child: Text("Done Tasks"),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListView(
              children: tasks
                  .map(
                    (e) => ListTile(
                      title: Text(
                        e.taskName,
                        style: TextStyle(
                          decoration:
                              e.isDone ? TextDecoration.lineThrough : null,
                        ),
                      ),
                      trailing: Checkbox(
                        value: e.isDone,
                        onChanged: (bool? value) {
                          setState(() {
                            e.isDone = value!;
                          });
                        },
                      ),
                    ),
                  )
                  .toList(),
            ),
            ToDoScreen(),
            DoneScreen(),
          ],
        ),
      ),
    ); */
  }
}
