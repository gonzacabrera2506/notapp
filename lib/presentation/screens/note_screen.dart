import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:notapp/widgets/customBottomNavigationBar_widget.dart';
import 'package:notapp/widgets/customTextFormField.widget.dart';

class NoteScreen extends StatefulWidget {
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
        body: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Agregar Nota",
                      style:
                          TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                CustomTextFormField(
                  minLines: 1,
                  maxLines: 1,
                  hintText: "Título...",
                ),
                SizedBox(height: 10),
                CustomTextFormField(
                  minLines: 15,
                  maxLines: 15,
                  hintText: "Escribe aqui...",
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
        bottomNavigationBar: const CustomNavigationBar(),
      ),
    );
  }
}
