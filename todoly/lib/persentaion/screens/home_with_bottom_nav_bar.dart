/* /// Flutter code sample for BottomNavigationBar

// This example shows a [BottomNavigationBar] as it is used within a [Scaffold]
// widget. The [BottomNavigationBar] has three [BottomNavigationBarItem]
// widgets, which means it defaults to [BottomNavigationBarType.fixed], and
// the [currentIndex] is set to index 0. The selected item is
// amber. The `_onItemTapped` function changes the selected item's index
// and displays a corresponding message in the center of the [Scaffold].

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:todoly/data/models/task.dart';
import 'package:todoly/logic/providers/tasks_provider.dart';
import 'package:todoly/persentaion/screens/add_task_screen.dart';
import 'package:todoly/persentaion/screens/all_tasks.dart';
import 'package:todoly/persentaion/screens/done_screen.dart';
import 'package:todoly/persentaion/screens/to_do_screen.dart';

/// This is the stateful widget that the main application instantiates.
class HomeWithNav extends StatefulWidget {
  const HomeWithNav({Key? key}) : super(key: key);

  @override
  State<HomeWithNav> createState() => _HomeWithNavState();
}

/// This is the private State class that goes with HomeWithNav.
class _HomeWithNavState extends State<HomeWithNav> {
  TextEditingController taskNameController = TextEditingController();
  int _selectedIndex = 0;
  bool isInitilzed = false;
  List<Widget> _widgetOptions = <Widget>[];
  List<Task> tasks = [];
  final TasksProvider tasksProvider = TasksProvider();
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Future<void> intilizeDB() async {
    await tasksProvider.getTaksFromDB();
    setState(() {
      _widgetOptions = [
        AllTasks(tasksProvider: tasksProvider),
        ToDoScreen(
          tasksProvider: tasksProvider,
        ),
        DoneScreen(
          tasksProvider: tasksProvider,
        ),
      ];
      isInitilzed = true;
    });
  }

  @override
  void initState() {
    intilizeDB();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Container(
                  color: Color(0xff757575),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20.0),
                          topLeft: Radius.circular(20.0)),
                    ),
                    child: Container(
                      padding: EdgeInsets.only(
                          top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Text(
                            'Add Task',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.lightBlue,
                              fontSize: 30.0,
                              //fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextField(
                            autofocus: true,
                            textAlign: TextAlign.center,
                            controller: taskNameController,
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Container(
                            height: 45.0,
                            color: Colors.lightBlue,
                            child: TextButton(
                              onPressed: () async {
                                final task =
                                    Task(taskName: taskNameController.text);
                                taskNameController.clear();
                                await tasksProvider.addTaskToDB(task);
                                setState(() {
                                  tasks = tasksProvider.tasks;
                                });
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                'Add',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text('Organize Your Tasks'),
      ),
      body: Center(
        child: isInitilzed
            ? _widgetOptions.elementAt(_selectedIndex)
            : CircularProgressIndicator(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'All',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cut),
            label: 'To Do',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.done),
            label: 'Done',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
 */

import 'package:flutter/material.dart';
import 'package:todoly/data/models/task.dart';
import 'package:todoly/logic/providers/tasks_provider.dart';
import 'package:todoly/persentaion/screens/all_tasks.dart';
import 'package:todoly/persentaion/screens/to_do_screen.dart';

import 'add_task_screen.dart';
import 'done_screen.dart';

/// This is the stateful widget that the main application instantiates.
class HomeWithNavBar extends StatefulWidget {
  List<Task> tasks = [];
  HomeWithNavBar({Key? key}) : super(key: key);

  @override
  State<HomeWithNavBar> createState() => _HomeWithNavBarState();
}

/// This is the private State class that goes with HomeWithNavBar.
class _HomeWithNavBarState extends State<HomeWithNavBar> {
  bool isLoading = true;
  List<Task> tasks = [];
  final TasksProvider tasksProvider = TasksProvider();
  TextEditingController taskNameController = TextEditingController();

  @override
  void initState() {
    intilizeDB();
    super.initState();
  }

  Future<void> intilizeDB() async {
    await tasksProvider.getTaksFromDB();
    setState(() {
      _widgetOptions = [
        AllTasks(tasksProvider: tasksProvider),
        ToDoScreen(
          tasksProvider: tasksProvider,
        ),
        DoneScreen(
          tasksProvider: tasksProvider,
        ),
      ];
    });
    setState(() {
      tasks = tasksProvider.tasks;
    });
    Future.delayed(Duration(seconds: 1)).then((value) {
      setState(() {
        isLoading = false;
      });
    });
  }

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

          /* showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Container(
                  color: Color(0xff757575),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20.0),
                          topLeft: Radius.circular(20.0)),
                    ),
                    child: Container(
                      padding: EdgeInsets.only(
                          top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Text(
                            'Add Task',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.lightBlue,
                              fontSize: 30.0,
                              //fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextField(
                            autofocus: true,
                            textAlign: TextAlign.center,
                            controller: taskNameController,
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Container(
                            height: 45.0,
                            color: Colors.lightBlue,
                            child: TextButton(
                              onPressed: () async {
                                final task =
                                    Task(taskName: taskNameController.text);
                                taskNameController.clear();
                                await tasksProvider.addTaskToDB(task);
                                setState(() {
                                  tasks = tasksProvider.tasks;
                                });
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                'Add',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ); */
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text('Organize your Tasks'),
      ),
      body: Center(
        child: isLoading
            ? CircularProgressIndicator()
            : _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'All',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.alarm),
            label: 'ToDo',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.done),
            label: 'Done',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
