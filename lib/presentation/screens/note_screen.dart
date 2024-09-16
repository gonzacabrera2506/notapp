import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notapp/widgets/customBottomNavigationBar_widget.dart';
import 'package:notapp/widgets/customElevatedButtonWidget.dart';
import 'package:notapp/widgets/customTextFormField.widget.dart';

class NoteScreen extends StatefulWidget {
  static const String name = 'note_screen';
  const NoteScreen({super.key});

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  final TextEditingController _titulo = TextEditingController();
  final TextEditingController _descripcion = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1),
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          toolbarHeight: 50,
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          title:
              const Row(mainAxisAlignment: MainAxisAlignment.start, children: [
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
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 9),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Agregar Nota",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                CustomTextFormField(
                  controller: _titulo,
                  minLines: 1,
                  maxLines: 1,
                  hintText: "Título...",
                  suffixIcon: IconButton(
                      onPressed: () {},
                      icon: const FaIcon(
                        FontAwesomeIcons.xmark,
                        size: 12,
                      )),
                ),
                const SizedBox(height: 10),
                CustomTextFormField(
                  controller: _descripcion,
                  minLines: 10,
                  maxLines: 10,
                  hintText: "Escribe aqui...",
                ),
                const SizedBox(height: 7),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                            tooltip: 'Negrita',
                            onPressed: () {},
                            icon: const FaIcon(
                              FontAwesomeIcons.bold,
                              size: 12,
                            )),
                        //const SizedBox(width: 0.5),
                        IconButton(
                            tooltip: 'Cursiva',
                            onPressed: () {},
                            icon: const FaIcon(
                              FontAwesomeIcons.italic,
                              size: 12,
                            )),
                        const SizedBox(width: 0.5),
                        IconButton(
                            tooltip: 'Subrayado',
                            onPressed: () {},
                            icon: const FaIcon(
                              FontAwesomeIcons.underline,
                              size: 12,
                            )),
                        const SizedBox(width: 0.5),
                        IconButton(
                            tooltip: 'Tachado',
                            onPressed: () {},
                            icon: const FaIcon(
                              FontAwesomeIcons.strikethrough,
                              size: 12,
                            )),
                        IconButton(
                            tooltip: 'Activar/desactivar viñetas',
                            onPressed: () {},
                            icon: const FaIcon(
                              FontAwesomeIcons.listUl,
                              size: 12,
                            )),
                      ],
                    ),
                    Expanded(
                      child: CustomElevatedButton(
                          child: IconButton(
                              tooltip: 'Guardar',
                              onPressed: () {},
                              icon: const FaIcon(
                                FontAwesomeIcons.solidFloppyDisk,
                                size: 14,
                              ))),
                    ),
                    const SizedBox(height: 3),
                  ],
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: const CustomNavigationBar(
          currentIndex: 1,
        ),
      ),
    );
  }
}
