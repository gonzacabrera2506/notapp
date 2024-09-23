import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notapp/config/router/app_router.dart';
import 'package:notapp/config/theme/app_theme.dart';
import 'package:notapp/di/locator.dart';
import 'package:notapp/presentation/blocs/bloc/dark_theme/dark_theme_bloc.dart';

void main() {
  setupLocator();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DarkThemeBloc(),
      child: BlocBuilder<DarkThemeBloc, DarkThemeState>(
        builder: (context, state) {
          return MaterialApp.router(
            routerConfig: appRouter,
            debugShowCheckedModeBanner: false,
            theme: AppTheme().getLightTheme(),
            darkTheme: AppTheme().getDarkTheme(),
            themeMode: state.dark ? ThemeMode.dark : ThemeMode.light,
          );
        },
      ),
    );
  }
}
