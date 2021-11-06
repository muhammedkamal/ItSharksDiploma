import 'package:flutter/material.dart';
import 'package:todoly/data/models/task.dart';
import 'package:todoly/logic/helpers/db_helper.dart';

class TasksProvider with ChangeNotifier {
  List<Task> tasks = [];
  Future<List<Task>> getTaksFromDB() async {
    List<Map<String, dynamic>> dbList = await DBHelper.getData("tasks");
    tasks = [];
    for (var item in dbList) {
      tasks.add(Task.fromMap(item));
    }
    notifyListeners();
    return tasks;
  }

  Future<void> addTaskToDB(Task task) async {
    int id = await DBHelper.insert("tasks", task.toMap());
    task.id = id;
    tasks.add(task);
    notifyListeners();
  }

  Future<void> updateTask(Task task) async {
    tasks.firstWhere((element) => element.id == task.id) != task;
    DBHelper.update("tasks", task.toMap());
    notifyListeners();
  }
}
