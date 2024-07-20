import 'package:flutter/material.dart';

const Color primary = Color.fromRGBO(33, 33, 33, 1);
const Color secondary = Colors.white;

final ThemeData theme = ThemeData(
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: primary,
      onPrimary: secondary,
      secondary: Color.fromRGBO(117, 117, 117, 1),
      onSecondary: primary,
      error: Color.fromRGBO(244, 67, 54, 1),
      onError: secondary,
      surface: secondary,
      onSurface: primary,
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
            backgroundColor: primary,
            overlayColor: secondary,
            foregroundColor: secondary,
            textStyle: const TextStyle(color: secondary))));
