import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Vasco da gama",
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Mamaco do bogosort"),
          ),
          body: const Text("Mamaco"),
          bottomNavigationBar: const BottomAppBar(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: null,
                  child: Text("Voltar"),
                ),
              ],
            ),
          ),
        ));
  }

  TextStyle formata() {
    return const TextStyle(
        color: Colors.black,
        decoration: TextDecoration.none,
        fontSize: 28,
        fontWeight: FontWeight.bold,
        letterSpacing: 10,
        wordSpacing: 20);
  }
}
