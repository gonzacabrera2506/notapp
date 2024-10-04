import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                  child: SingleChildScrollView(
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
                        Flexible(
                            fit: FlexFit.loose,
                            child: BlocBuilder<NoteBloc, NoteState>(
                                builder: (context, state) {
                              if (state.notes.isEmpty) {
                                return const Center(
                                    child: Text("No hay notas disponibles"));
                              }
                              for (var note in state.notes) {
                                print(
                                    "Nota: Título - ${note.title}, Descripción - ${note.description}");
                              }
                              return ListView.builder(
                                itemCount: state.notes.length,
                                itemBuilder: (context, index) {
                                  final note = state.notes[index];

                                  return Customcardwidget(
                                      title: Text(note.title.toString()),
                                      subtitle:
                                          Text(note.description.toString()));
                                },
                              );
                            }))
                        // SizedBox(height: 10),
                        // Customcardwidget(),
                        // SizedBox(height: 15),
                        // Customcardwidget(),
                        // SizedBox(height: 15),
                        // Customcardwidget(),
                        // SizedBox(height: 15),
                        // Customcardwidget(),
                        // SizedBox(height: 15),
                        // Customcardwidget(),
                        // SizedBox(height: 15),
                      ],
                    ),
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
