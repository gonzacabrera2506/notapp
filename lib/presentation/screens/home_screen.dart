import 'package:flutter/material.dart';
import 'package:notapp/presentation/shared/widgets/customSwitch.widget.dart';
import 'package:notapp/presentation/shared/widgets/customTextFormField.widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool dark = false;
  void _updateLabelCustomButtom() {
    setState(() {
      dark = !dark;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> menuButtons = [
      const _IconTextWidget(
        iconData: Icons.list,
        text: 'Lista de notas',
      ),
      const _IconTextWidget(
        iconData: Icons.delete,
        text: 'Eliminar nota',
      ),
      // Agrega más elementos de menú según sea necesario
    ];

    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Scaffold(
            appBar: AppBar(
              toolbarHeight: 80,
              backgroundColor: Colors.tealAccent,
              title: const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.note),
                        SizedBox(width: 10),
                        Text(
                          'NotApp',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ]),
              actions: [
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: IconButton(
                      icon: Icon(
                          dark ? Icons.wb_sunny_outlined : Icons.dark_mode),
                      onPressed: _updateLabelCustomButtom,
                    ))
              ],
            ),
            body: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  SizedBox(height: 15),
                  Text(
                    "Mis Notas",
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )));
  }
}

class _IconTextWidget extends StatelessWidget {
  final IconData iconData;
  final String text;

  const _IconTextWidget({
    Key? key,
    required this.iconData,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(iconData),
        // ignore: prefer_const_constructors
        SizedBox(width: 8), // Espacio entre el icono y el texto
        Text(
          text,
        ),
      ],
    );
  }
}

class _PopupMenuButton extends StatelessWidget {
  const _PopupMenuButton({
    required this.menuButtons,
  });

  final List<Widget> menuButtons;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      itemBuilder: (BuildContext context) {
        return menuButtons.map((Widget menuButton) {
          return PopupMenuItem<String>(
            value: 'menuItem',
            child: menuButton,
          );
        }).toList();
      },
      icon: const Icon(Icons.more_horiz),
      tooltip: "Menú",
    );
  }
}
