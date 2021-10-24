import 'package:flutter/material.dart';

class AppThemes {
  static final ThemeData lightTheme = ThemeData(
    tabBarTheme: const TabBarTheme(
      labelColor: Colors.black, /* labelStyle: TextStyle(fontSize: 25) */
    ),
    primarySwatch: Colors.deepPurple,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: //Color(0xff4285F4),
          const Color.fromRGBO(66, 133, 244, 1),
    ),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
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
      bodyText1: TextStyle(fontSize: 14),
      bodyText2: TextStyle(
        fontSize: 18,
      ),
      headline6: TextStyle(
        fontSize: 28,
      ),
    ),
  );
}
