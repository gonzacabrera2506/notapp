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
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 80,
          backgroundColor: Colors.tealAccent,
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
                const SizedBox(height: 15),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Agregar Nota",
                      style:
                          TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                CustomTextFormField(
                  minLines: 1,
                  maxLines: 1,
                  hintText: "Título...",
                  suffixIcon: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.clear)),
                ),
                const SizedBox(height: 10),
                const CustomTextFormField(
                  minLines: 13,
                  maxLines: 13,
                  hintText: "Escribe aqui...",
                ),
                const SizedBox(height: 10),
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
                              size: 13,
                            )),
                        const SizedBox(width: 8),
                        IconButton(
                            tooltip: 'Cursiva',
                            onPressed: () {},
                            icon: const FaIcon(
                              FontAwesomeIcons.italic,
                              size: 13,
                            )),
                        const SizedBox(width: 8),
                        IconButton(
                            tooltip: 'Subrayado',
                            onPressed: () {},
                            icon: const FaIcon(
                              FontAwesomeIcons.underline,
                              size: 13,
                            )),
                        const SizedBox(width: 8),
                        IconButton(
                            tooltip: 'Tachado',
                            onPressed: () {},
                            icon: const FaIcon(
                              FontAwesomeIcons.strikethrough,
                              size: 13,
                            )),
                        IconButton(
                            tooltip: 'Activar/desactivar viñetas',
                            onPressed: () {},
                            icon: const FaIcon(
                              FontAwesomeIcons.listUl,
                              size: 13,
                            )),
                      ],
                    ),
                    const CustomElevatedButton(
                      text: 'Guardar',
                    ),
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
