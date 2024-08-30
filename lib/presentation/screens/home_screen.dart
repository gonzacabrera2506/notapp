import 'package:flutter/material.dart';
import 'package:notapp/widgets/customBottomNavigationBar_widget.dart';
import 'package:notapp/widgets/customCardWidget.dart';

class HomeScreen extends StatefulWidget {
  static const String name = 'home_screen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool dark = false;
  void _updateLabelCustomButtom() {
    setState(() {
      dark = !dark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 80,
            backgroundColor: Colors.tealAccent,
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
                    icon:
                        Icon(dark ? Icons.wb_sunny_outlined : Icons.dark_mode),
                    onPressed: _updateLabelCustomButtom,
                  ))
            ],
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
                        "Mis Notas",
                        style: TextStyle(
                            fontSize: 35, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Customcardwidget(),
                  Customcardwidget(),
                  Customcardwidget(),
                  Customcardwidget(),
                  Customcardwidget(),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
          bottomNavigationBar: const CustomNavigationBar(),
        ));
  }
}
