import 'package:flutter/material.dart';

const Color primary = Color.fromRGBO(33, 33, 33, 1);
const Color secondary = Colors.white;

final ThemeData theme = ThemeData(
    colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: primary,
        onPrimary: secondary,
        secondary: secondary,
        onSecondary: primary,
        error: Color.fromRGBO(244, 67, 54, 1),
        onError: secondary,
        surface: secondary,
        onSurface: primary),
    useMaterial3: true,
    fontFamily: 'Montserrat',
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: primary,
            overlayColor: secondary,
            foregroundColor: secondary,
            textStyle: const TextStyle(color: secondary))));
