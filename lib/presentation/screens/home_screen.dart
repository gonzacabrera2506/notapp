import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notapp/di/locator.dart';
import 'package:notapp/presentation/blocs/bloc/dark_theme/dark_theme_bloc.dart';
import 'package:notapp/presentation/blocs/bloc/note/note_bloc.dart';
import 'package:notapp/widgets/customBottomNavigationBar_widget.dart';
import 'package:notapp/widgets/customCardWidget.dart';

class HomeScreen extends StatefulWidget {
  static const String name = 'home_screen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 1),
        child: BlocProvider(
          create: (context) => getIt<NoteBloc>()..add(const LoadNotesEvent()),
          child: Builder(builder: (BuildContext newContext) {
            return BlocListener<NoteBloc, NoteState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              child: Scaffold(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                appBar: AppBar(
                  toolbarHeight: 50,
                  backgroundColor:
                      Theme.of(context).appBarTheme.backgroundColor,
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
                  actions: [
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: IconButton(
                          icon: BlocBuilder<DarkThemeBloc, DarkThemeState>(
                            builder: (context, state) {
                              return Icon(
                                state.dark
                                    ? Icons.wb_sunny_outlined
                                    : Icons.dark_mode,
                              );
                            },
                          ),
                          onPressed: () {
                            final isDarkTheme =
                                context.read<DarkThemeBloc>().state.dark;
                            context
                                .read<DarkThemeBloc>()
                                .add(SetDarkTheme(isDarkTheme: !isDarkTheme));
                          },
                        ))
                  ],
                ),
                body: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 9),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Mis Notas",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Customcardwidget(
                        title: Text.rich(
                          TextSpan(
                            children: [
                              const TextSpan(
                                text: 'TITULOoooooooo\n', // Título con estilo
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                              TextSpan(
                                text: DateFormat('dd/MM/yyyy')
                                    .format(DateTime.now()), // Fecha con estilo
                                style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w100),
                              ),
                            ],
                          ),
                        ),
                        subtitle: const Text(
                            "note.description.toString()fsfsdfbsdhjfbsdhbfhjsdbfhjsdbfhsdbfhsdvfhsdvfjhsdvfjhsdvfhsdjvf"),
                        modified: (int index) {
                          print("modificar");
                        },
                        delete: (int index) {
                          print("eliminar");
                        },
                      ),
                      Customcardwidget(
                        title: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'TITULOoooooooo\n', // Título con estilo
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Theme.of(context).cardTheme.color,
                                ),
                              ),
                              TextSpan(
                                text: DateFormat('dd/MM/yyyy')
                                    .format(DateTime.now()), // Fecha con estilo
                                style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w100),
                              ),
                            ],
                          ),
                        ),
                        subtitle: const Text(
                            "note.description.toString()fsfsdfbsdhjfbsdhbfhjsdbfhjsdbfhsdbfhsdvfhsdvfjhsdvfjhsdvfhsdjvf"),
                        modified: (int index) {
                          print("modificar");
                        },
                        delete: (int index) {
                          print("eliminar");
                        },
                      ),
                      Flexible(
                          fit: FlexFit.loose,
                          child: BlocBuilder<NoteBloc, NoteState>(
                              builder: (context, state) {
                            if (state.notes.isEmpty) {
                              // const Center(
                              //     child: Text("No hay notas disponibles"));
                            }
                            return ListView.builder(
                              itemCount: state.notes.length,
                              itemBuilder: (context, index) {
                                final note = state.notes[index];

                                return Customcardwidget(
                                  trailing: Text(DateFormat('dd/MM/yyyy')
                                      .format(note.date)
                                      .toString()),
                                  title: Text(
                                    note.title.toString(),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  subtitle: Text(note.description.toString()),
                                  modified: (int index) {
                                    print("modificar");
                                  },
                                  delete: (int index) {
                                    print("eliminar");
                                  },
                                );
                              },
                            );
                          }))
                    ],
                  ),
                ),
                bottomNavigationBar: const CustomNavigationBar(
                  currentIndex: 0,
                ),
              ),
            );
          }),
        ));
  }
}
