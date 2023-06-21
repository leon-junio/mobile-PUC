import 'package:controle_tasks/dao/daoTasks.dart';
import 'package:controle_tasks/view/listaTask.dart';
import 'package:flutter/material.dart';
import 'package:controle_tasks/view/viewCadTask.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.dark(brightness: Brightness.dark)),
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
  final DAOTask dao = DAOTask();
  final TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Column(children: [
            Row(children: [
              Text("Lista de Tarefas"),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  child: Icon(Icons.check_circle))
            ]),
          ]),
          backgroundColor: Color.fromARGB(255, 135, 89, 214),
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => viewCadTask()));
            }),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(padding: EdgeInsets.all(10)),
              Center(
                child: Card(
                  child: Row(
                    children: [
                      Padding(
                          padding: EdgeInsets.all(4),
                          child: IconButton(
                            onPressed: () {
                              ListaTasks(name: nameController.text);
                            },
                            icon: Icon(
                              Icons.search,
                              color: Color.fromARGB(255, 135, 89, 214),
                            ),
                          )),
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
                        child: Icon(Icons.sort),
                      ),
                    ],
                  ),
                ),
              ),
              ListaTasks(),
            ],
          ),
        ));
  }
}
