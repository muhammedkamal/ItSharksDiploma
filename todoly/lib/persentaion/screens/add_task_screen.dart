import 'package:flutter/material.dart';
import 'package:todoly/data/models/task.dart';
import 'package:date_time_picker/date_time_picker.dart';

class AddTaskScreen extends StatelessWidget {
  static const String routeName = "/addTask";
  AddTaskScreen({Key? key}) : super(key: key);
  TextEditingController taskNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Task"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  TextField(
                    controller: taskNameController,
                    // onChanged: (val) {
                    //   print(val);
                    // },
                    //keyboardType: TextInputType.number,
                    //enabled: false,
                    decoration: InputDecoration(
                      hintText: "Enter Task Name",
                      label: Text("Task Name"),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.secondary,
                          width: 10,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  /* DateTimePicker(
                    type: DateTimePickerType.dateTime,
                    initialValue: '',
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                    dateLabelText: 'Date',
                    onChanged: (val) => print(DateTime.parse(val)),
                    validator: (val) {
                      print(val);
                      return null;
                    },
                    onSaved: (val) => print(val),
                  ), */
                ],
              ),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                ),
                onPressed: () {
                  if (taskNameController.text != "") {
                    Navigator.of(context).pop(taskNameController.text);
                  }
                },
                child: Text("Add Task")),
          ],
        ),
      ),
    );

    /* final args = ModalRoute.of(context)!.settings.arguments as List<Task>;
    return Scaffold(
      appBar: AppBar(
        title: Text("Add new Task"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: TextField(
                  controller: taskNameController,
                  decoration: InputDecoration(
                    hintText: "Task Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        width: 2,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        width: 2,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        width: 2,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (taskNameController.text != "") {
                    //args.add(Task(taskName: taskNameController.text));
                    Navigator.pop(context, taskNameController.text);
                  }
                },
                child: Text("Add Task"),
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).primaryColor,
                ),
              )
            ],
          ),
        ),
      ),
    );
  } */
  }
}
