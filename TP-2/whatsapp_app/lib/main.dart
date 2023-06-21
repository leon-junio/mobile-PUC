import 'package:whatsapp_app/view/listaContatos.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Whatsapp"),
        backgroundColor: Color.fromARGB(255, 7, 94, 84),
      ),
      body: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.all(4),
            child: Card(
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(4),
                    child: Icon(Icons.search),
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Pesquisar",
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(4),
                    child: Icon(Icons.camera_alt),
                  ),
                ],
              ),
            ),
          ),
          ListaContatos(),
        ],
      )),
      bottomNavigationBar:
          BottomAppBar(child: Text("Desenvolvimento mobile 2023 - Leon Junio")),
    );
  }
}
