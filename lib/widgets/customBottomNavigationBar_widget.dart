import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomNavigationBar extends StatelessWidget {
  final int currentIndex;
  const CustomNavigationBar({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      height: 55,
      backgroundColor: Theme.of(context).navigationBarTheme.backgroundColor,
      onDestinationSelected: (int index) {
        if (index != currentIndex) {
          switch (index) {
            case 0:
              context.go('/home');
              break;
            case 1:
              context.go('/add-note');
              break;
          }
        }
      },
      indicatorColor:
          Theme.of(context).bottomNavigationBarTheme.backgroundColor,
      selectedIndex: currentIndex,
      destinations: const <Widget>[
        NavigationDestination(
          tooltip: '',
          selectedIcon: Icon(Icons.home),
          icon: Icon(Icons.home_outlined),
          label: 'Home',
        ),
        NavigationDestination(
          tooltip: '',
          selectedIcon: Icon(Icons.add_circle_outlined),
          icon: Icon(Icons.add_circle_outline_sharp),
          label: 'Agregar nota',
        ),
        // NavigationDestination(
        //   selectedIcon: Icon(Icons.settings_outlined),
        //   icon: Icon(Icons.settings_rounded),
        //   label: 'Configuraciones',
        // ),
      ],
    );
  }
}
