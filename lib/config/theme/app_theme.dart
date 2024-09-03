import 'package:flutter/material.dart';

class AppTheme {
  ThemeData getLightTheme() {
    const seedColor = Colors.tealAccent;

    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: seedColor,
      brightness: Brightness.light,
    );
  }

  ThemeData getDarkTheme() {
    const darkSeedColor = Colors.purple;

    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: darkSeedColor,
      brightness: Brightness.dark,
    );
  }
}

