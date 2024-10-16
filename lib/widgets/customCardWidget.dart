import 'package:flutter/material.dart';

class Customcardwidget extends StatelessWidget {
  final Text? trailing;
  final Text title;
  final Text subtitle;
  final Function(int) modified;
  final Function(int) delete;
  const Customcardwidget({
    super.key,
    this.trailing,
    required this.title,
    required this.subtitle,
    required this.modified,
    required this.delete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: Theme.of(context).cardTheme.color,
      shadowColor: Colors.black87,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
            height: 180,
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ListTile(
                          title: title,
                          subtitle: subtitle,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  ButtonTheme(
                    child: OverflowBar(
                      alignment: MainAxisAlignment.end,
                      children: <Widget>[
                        IconButton(
                            tooltip: 'Eliminar nota',
                            onPressed: () => delete(0),
                            icon: const Icon(Icons.delete)),
                        IconButton(
                            tooltip: 'Modificar nota',
                            onPressed: () => modified(0),
                            icon: const Icon(Icons.edit))
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
