import 'package:flutter/material.dart';

class Globals {
  static final ThemeData ligth_Theme = ThemeData(
    useMaterial3: true,
    textTheme: TextTheme(
      displayMedium: TextStyle(
        color: Colors.black,
      ),
    ),
    colorScheme: ColorScheme.light(
      brightness: Brightness.light,
      primary: Colors.blue,
      secondary: Colors.white,
    ),
  );

  static final ThemeData dark_Theme = ThemeData(
    useMaterial3: true,
    textTheme: TextTheme(
      displayMedium: TextStyle(
        color: Colors.white,
      ),
    ),
    colorScheme: ColorScheme.dark(
      brightness: Brightness.dark,
      primary: Color(0xfff9f9f9),
      secondary: Color(0xfff9f9f9),
    ),
  );
}



// backgroundColor: Color(0xfff9f9f9),