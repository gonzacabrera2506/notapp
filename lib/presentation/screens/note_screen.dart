import 'package:flutter/material.dart';
import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:notapp/di/locator.dart';
import 'package:notapp/domain/entities/note.dart';
import 'package:notapp/presentation/blocs/bloc/note/note_bloc.dart';
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
      child: BlocProvider(
        create: (context) => getIt<NoteBloc>(),
        child: Builder(builder: (BuildContext newContext) {
          return BlocListener<NoteBloc, NoteState>(
            listener: (context, state) {},
            child: Scaffold(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              appBar: AppBar(
                toolbarHeight: 50,
                backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(10),
                )),
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
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
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
                              text: "Guardar",
                              child: const FittedBox(
                                fit: BoxFit.none,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    FaIcon(
                                      FontAwesomeIcons.solidFloppyDisk,
                                      size: 14,
                                    ),
                                    SizedBox(width: 1),
                                    Text("Guardar")
                                  ],
                                ),
                              ),
                              action: () {
                                if (_titulo.text.isEmpty &&
                                    _descripcion.text.isEmpty) {
                                  MotionToast.error(
                                    displaySideBar: false,
                                    title: const Text(
                                      "Atencion!",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    description: const Text(
                                        "Los campos titulo y descripcion no pueden estar vacios."),
                                    toastDuration: const Duration(seconds: 3),
                                    barrierColor: Colors.red.shade100,
                                  ).show(context);
                                  return;
                                }
                                if (_titulo.text.isEmpty) {
                                  MotionToast.error(
                                    displaySideBar: false,
                                    title: const Text(
                                      "Atencion!",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    description: const Text(
                                      "El campo titulo no puede estar vacio.",
                                    ),
                                    toastDuration: const Duration(seconds: 3),
                                    barrierColor: Colors.red.shade100,
                                  ).show(context);
                                  return;
                                }
                                if (_descripcion.text.isEmpty) {
                                  MotionToast.error(
                                    displaySideBar: false,
                                    title: const Text(
                                      "Atencion!",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    description: const Text(
                                        "El campo descripcion no puede estar vacio."),
                                    toastDuration: const Duration(seconds: 3),
                                    barrierColor: Colors.red.shade100,
                                  ).show(context);
                                  return;
                                }

                                final newNote = Note(
                                  date: DateTime.now(),
                                  title: _titulo.text,
                                  description: _descripcion.text,
                                );

                                try {
                                  newContext
                                      .read<NoteBloc>()
                                      .add(AddNewNoteEvent(note: newNote));
                                } catch (e) {
                                  log(e.toString());
                                }
                              },
                            ),
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
        }),
      ),
    );
  }
}
