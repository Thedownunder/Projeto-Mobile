import 'package:flutter/material.dart';

final ThemeData lightGrayTheme = ThemeData(
  primarySwatch: Colors.grey,
  brightness: Brightness.light,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.grey[800],
    foregroundColor: Colors.white,
  ),
);

final ThemeData darkGrayTheme = ThemeData(
  primarySwatch: Colors.grey,
  brightness: Brightness.dark,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.grey[900],
    foregroundColor: Colors.white,
  ),
);
