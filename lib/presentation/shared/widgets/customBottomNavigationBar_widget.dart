import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({super.key});

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      onDestinationSelected: (int index) {
        setState(() {
          currentPageIndex = index;
        });

        switch (index) {
          case 0:
            context.push('/home');
            break;
          case 1:
            context.push('/add-note');
            break;
        }
      },
      indicatorColor: Colors.tealAccent,
      selectedIndex: currentPageIndex,
      destinations: const <Widget>[
        NavigationDestination(
          selectedIcon: Icon(Icons.home),
          icon: Icon(Icons.home_outlined),
          label: 'Home',
        ),
        NavigationDestination(
          selectedIcon: Icon(Icons.add),
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
