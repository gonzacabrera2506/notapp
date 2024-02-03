import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Scaffold(
        appBar: AppBar(
          title: const Center(
              child: Text(
            'Mis Notas',
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 3),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.settings),
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(children: [
            const SizedBox(
              height: 3,
            ),
            TextFormField(
              decoration: const InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  suffixIcon: Icon(Icons.search),
                  hintText: 'Buscar...',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ))),
            ),
            const SizedBox(
              height: 20,
            ),
            // ignore: prefer_const_constructors
            _NoteCard(),
            const SizedBox(
              height: 20,
            ),
            _NoteCard(),
          ]),
        ),
      ),
    );
  }
}

class _NoteCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final Size size = MediaQuery.of(context).size;

    return const Card(
      color: Colors.red,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
        Radius.circular(30),
      )),
      child: SizedBox(
        width: double.infinity,
        height: 250,
        child: Center(
          child: Text('hola mundo'),
        ),
      ),
    );
  }
}
