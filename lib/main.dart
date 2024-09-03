import 'package:flutter/material.dart';
import 'package:notapp/config/router/app_router.dart';
import 'package:notapp/config/theme/app_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getLightTheme(), 
      darkTheme: AppTheme().getDarkTheme(),
      themeMode: dark ? ThemeMode.dark : ThemeMode.light,
    );
  }
}
