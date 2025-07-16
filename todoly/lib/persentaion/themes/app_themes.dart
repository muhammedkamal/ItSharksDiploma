import 'package:flutter/material.dart';

class AppThemes {
  static final ThemeData darkTheme = ThemeData.dark().copyWith();
  static final ThemeData lightTheme = ThemeData(
    tabBarTheme: const TabBarTheme(
      labelColor: Colors.black, /* labelStyle: TextStyle(fontSize: 25) */
    ),
    primarySwatch: Colors.deepPurple,
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.indigo
        //Color(0xff4285F4),
        //const Color.fromRGBO(66, 133, 244, 1),
        ),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: Colors.black),
      toolbarTextStyle: const TextStyle(
        color: Colors.black,
      ),
      backgroundColor: Colors.grey[200],
      centerTitle: true,
      titleTextStyle: const TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(fontSize: 14),
      bodyMedium: TextStyle(
        fontSize: 18,
      ),
      titleLarge: TextStyle(
        fontSize: 28,
      ),
    ),
  );
}
