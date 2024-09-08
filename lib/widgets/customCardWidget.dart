import 'package:flutter/material.dart';

class Customcardwidget extends StatelessWidget {
  const Customcardwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      color: Theme.of(context).cardTheme.color,
      shadowColor: Colors.black87,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
            height: 180,
            child: Column(
              children: [
                const SizedBox(height: 15),
                const ListTile(
                  leading: Icon(Icons.notes_outlined),
                  title: Text(
                    'The Enchanted Nightingale',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle:
                      Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
                ),
                const SizedBox(height: 15),
                ButtonTheme(
                  child: ButtonBar(
                    children: <Widget>[
                      IconButton(
                          tooltip: 'Eliminar nota',
                          onPressed: () {},
                          icon: const Icon(Icons.delete)),
                      IconButton(
                          tooltip: 'Modificar nota',
                          onPressed: () {},
                          icon: const Icon(Icons.edit))
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
