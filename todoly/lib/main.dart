import 'package:flutter/material.dart';
import 'package:todoly/persentaion/screens/add_task_screen.dart';
import 'package:todoly/persentaion/screens/home_screen.dart';
import 'package:todoly/persentaion/themes/app_themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDoly',
      theme: AppThemes.lightTheme,
      home: HomeScreen(),
      routes: {
        // '/' : (context)=>HomeScreen(),
        '/add_task': (context) => AddTaskScreen(),
      },
    );
  }
}
