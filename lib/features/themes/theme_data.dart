import 'package:flutter/material.dart';

ThemeData lightTheme= ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    background: Colors.white,
    primary: Colors.white,
    secondary: Colors.grey.shade300,
    tertiary: Colors.black,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white
  )
);

ThemeData darkTheme=ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    background: Colors.grey[900]!,
    primary: Colors.black26,
    secondary: Colors.grey.shade300,
    tertiary: Colors.white,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.grey[900]!,
  )
);