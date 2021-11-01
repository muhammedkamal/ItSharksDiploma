import 'package:todoly/data/models/task.dart';
import 'package:todoly/logic/helpers/db_helper.dart';

class TasksProvider {
  List<Task> tasks = [];
  Future<void> getTaksFromDB() async {
    List<Map<String, dynamic>> dbList = await DBHelper.getData("tasks");
    for (var item in dbList) {
      tasks.add(Task.fromMap(item));
    }
  }

  Future<void> addTaskToDB(Task task) async {
    int id = await DBHelper.insert("tasks", task.toMap());
    task.id = id;
    tasks.add(task);
  }

  Future<void> updateTaskDoneTime(Task task) async {
    tasks.firstWhere((element) => element.id == task.id) != task;
    DBHelper.update("tasks", task.toMap());
  }
}
