import 'dart:js';

import 'package:flutter/material.dart';
import 'tela2.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
    initialRoute: "/",
    routes: {"/tela2": (context) => Tela2("VASCO DA GAMA")},
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            /*Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Tela2("Vasco da gama")));*/
          },
          child: Text("Página 2"),
        ),
      ),
    );
  }
}
