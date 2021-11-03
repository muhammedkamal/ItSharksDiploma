// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:todoly/data/models/task.dart';
import 'package:todoly/logic/providers/tasks_provider.dart';
import 'package:todoly/persentaion/screens/all_tasks.dart';
import 'package:todoly/persentaion/screens/done_screen.dart';
import 'package:todoly/persentaion/screens/to_do_screen.dart';

import '../screens/add_task_screen.dart';

class HomeController extends StatefulWidget {
  const HomeController({Key? key}) : super(key: key);

  @override
  _HomeControllerState createState() => _HomeControllerState();
}

class _HomeControllerState extends State<HomeController> {
  bool isLoading = true;
  List<Task> tasks = [];
  final TasksProvider tasksProvider = TasksProvider();

  @override
  void initState() {
    intilizeDB();
    super.initState();
  }

  Future<void> intilizeDB() async {
    await tasksProvider.getTaksFromDB();
    Future.delayed(Duration(seconds: 1)).then((value) {
      setState(() {
        isLoading = false;
      });
    });
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
        body: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : TabBarView(
                children: [
                  AllTasks(tasksProvider: tasksProvider),
                  ToDoScreen(
                    tasksProvider: tasksProvider,
                  ),
                  DoneScreen(
                    tasksProvider: tasksProvider,
                  ),
                ],
              ),
      ),
    );
  }
}
