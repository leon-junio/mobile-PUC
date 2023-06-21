import 'package:flutter/material.dart';
import 'package:controle_tasks/view/crudTask.dart';

class viewCadTask extends StatefulWidget {
  viewCadTask({super.key});
  @override
  State<viewCadTask> createState() => _viewCadTaskState();
}

class _viewCadTaskState extends State<viewCadTask> {
  _viewCadTaskState();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(2),
              child: Column(children: [
                Text(
                  "Cadastro de tasks",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                )
              ]),
            )
          ],
        ),
        backgroundColor: Color.fromARGB(255, 135, 89, 214),
      ),
      body: Container(child: CrudTask()),
    );
  }
}
