import 'package:flutter/material.dart';

class Customcardwidget extends StatelessWidget {
  final Text title;
  final Text subtitle;
  const Customcardwidget({
    super.key,
    required this.title,
    required this.subtitle,
  });

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
                ListTile(
                  leading: const Icon(Icons.notes_outlined),
                  title: title,
                  subtitle: subtitle,
                ),
                const SizedBox(height: 15),
                ButtonTheme(
                  child: OverflowBar(
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
