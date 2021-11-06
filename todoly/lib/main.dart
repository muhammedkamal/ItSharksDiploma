import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoly/logic/providers/tasks_provider.dart';
import 'package:todoly/persentaion/screens/add_task_screen.dart';
import 'package:todoly/persentaion/screens/home_with_bottom_nav_bar.dart';
import 'package:todoly/persentaion/ui_controllers/home_controller.dart';
import 'package:todoly/persentaion/themes/app_themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => TasksProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'ToDoly',
        theme: AppThemes.lightTheme,
        routes: {
          '/': (_) => HomeWithNavBar(),
          AddTaskScreen.routeName: (context) => AddTaskScreen(),
        },
      ),
    );
  }
}
