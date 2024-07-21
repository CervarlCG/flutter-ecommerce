import 'package:flutter/material.dart';

final ThemeData theme = ThemeData(
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: Color.fromRGBO(127, 85, 57, 1),
      onPrimary: Colors.white,
      secondary: Color.fromRGBO(117, 117, 117, 1),
      onSecondary: Colors.black,
      error: Color.fromRGBO(244, 67, 54, 1),
      onError: Colors.white,
      surface: Colors.white,
      onSurface: Colors.black,
    ),
    textTheme: const TextTheme(
        titleMedium: TextStyle(fontWeight: FontWeight.w700),
        titleLarge: TextStyle(fontWeight: FontWeight.w700),
        labelLarge: TextStyle(fontWeight: FontWeight.w700)),
    useMaterial3: true,
    fontFamily: 'Montserrat',
    scaffoldBackgroundColor: const Color.fromRGBO(245, 245, 245, 1),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromRGBO(127, 85, 57, 1),
            overlayColor: Colors.white,
            foregroundColor: Colors.white,
            textStyle: const TextStyle(color: Colors.white))));
