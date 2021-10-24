import 'package:flutter/material.dart';
import 'package:todoly/persentaion/screens/add_task_screen.dart';

import 'done_screen.dart';

class ToDoScreen extends StatelessWidget {
  const ToDoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 900,
          ),
          GestureDetector(
            onTap: () {
              /* Navigator.of(context).push(
                MaterialPageRoute(builder: (context) {
                  return DoneScreen(
                    screenName: 'test',
                  );
                }),
              ); */
              Navigator.of(context).pushNamed(AddTaskScreen.routeName);
            },
            child: Container(
              height: MediaQuery.of(context).size.height * .2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                //BorderRadius.only(topLeft: Radius.circular(50)),
                gradient: LinearGradient(
                  colors: [
                    Colors.red,
                    Colors.yellow,
                    Colors.blue,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                //color: Colors.red,
                border: Border.all(
                  color: Colors.black,
                  width: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
