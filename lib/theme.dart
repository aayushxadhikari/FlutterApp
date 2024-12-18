import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
  primaryColor: const Color.fromARGB(255, 58, 53, 171),
  scaffoldBackgroundColor: Color.fromARGB(255, 255, 255, 255),
  hintColor: const Color.fromARGB(255, 32, 1, 32),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Color.fromARGB(255, 148, 30, 30)),
    bodyMedium: TextStyle(color: Color.fromARGB(255, 148, 30, 30)),
    bodySmall: TextStyle(fontWeight: FontWeight.bold, color: Color.fromARGB(255, 148, 30, 30)),
    titleLarge: TextStyle(color: Color.fromARGB(255, 148, 30, 30)),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color.fromARGB(255, 75, 52, 137),
      foregroundColor: Colors.white,
    ),
  ),
);
