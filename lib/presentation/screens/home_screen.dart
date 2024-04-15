import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
          title: const Center(
              child: Text(
            'Mis Notas',
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 3),
              child: _PopupMenuButton(menuButtons: menuButtons),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(children: [
            const SizedBox(
              height: 3,
            ),
            TextFormField(
              decoration: const InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  suffixIcon: Icon(Icons.search),
                  hintText: 'Buscar...',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ))),
            ),
            const SizedBox(
              height: 20,
            ),
            _NoteCard(),
            const SizedBox(
              height: 20,
            ),
            _NoteCard(),
          ]),
        ),
      ),
    );
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
    );
  }
}

class _NoteCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final Size size = MediaQuery.of(context).size;

    return const Card(
      color: Colors.white10,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
        Radius.circular(30),
      )),
      child: SizedBox(
        width: double.infinity,
        height: 250,
        child: Center(
          child: Text('hola mundo'),
        ),
      ),
    );
  }
}
