import 'package:flutter/material.dart';

class AppTheme {
  ThemeData getLightTheme() {
    const seedColor = Colors.tealAccent;

    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: seedColor,
      appBarTheme: const AppBarTheme(backgroundColor: seedColor),
      navigationBarTheme:
          const NavigationBarThemeData(backgroundColor: Colors.white),
      bottomNavigationBarTheme:
          const BottomNavigationBarThemeData(backgroundColor: seedColor),
      elevatedButtonTheme: const ElevatedButtonThemeData(
          style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(seedColor),
        foregroundColor: WidgetStatePropertyAll(Colors.black),
      )),
      cardTheme: const CardTheme(color: Colors.white),
      brightness: Brightness.light,
      scaffoldBackgroundColor: Colors.white,
    );
  }

  ThemeData getDarkTheme() {
    const darkSeedColor = Color.fromARGB(255, 26, 1, 70);

    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: darkSeedColor,
      appBarTheme: const AppBarTheme(backgroundColor: darkSeedColor),
      cardTheme: const CardTheme(
          color: Colors.black12,
          shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.white, width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(15.0)))),
      navigationBarTheme:
          const NavigationBarThemeData(backgroundColor: Colors.black),
      bottomNavigationBarTheme:
          const BottomNavigationBarThemeData(backgroundColor: darkSeedColor),
      elevatedButtonTheme: const ElevatedButtonThemeData(
          style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(darkSeedColor),
        foregroundColor: WidgetStatePropertyAll(Colors.white),
      )),
      primaryColorDark: darkSeedColor,
      scaffoldBackgroundColor: Colors.black,
      brightness: Brightness.dark,
    );
  }
}
