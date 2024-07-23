

import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    surface: Colors.amber.shade500,
    primary: Colors.grey.shade300,
    secondary: Colors.grey.shade200,
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: Colors.black, // Text color for light theme
    ),
  )
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    surface: Color.fromRGBO(255, 193, 7, 1),
    primary: Colors.grey.shade900,
    secondary: Colors.grey.shade800
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: Colors.white, // Text color for dark theme
    ),
  )
);