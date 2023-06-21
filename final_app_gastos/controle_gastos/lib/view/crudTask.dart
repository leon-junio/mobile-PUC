import 'package:controle_tasks/dao/daoTasks.dart';
import 'package:controle_tasks/main.dart';
import 'package:controle_tasks/model/task.dart';
import 'package:flutter/material.dart';

class CrudTask extends StatelessWidget {
  CrudTask({super.key});
  final TextEditingController nameController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final DAOTask dao = DAOTask();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(4),
            child: Center(
                child: Text(
              "Insira sua nova tarefa:",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            )),
          ),
          TextField(
            decoration: InputDecoration(labelText: "Nome"),
            controller: nameController,
          ),
          TextField(
            decoration: InputDecoration(labelText: "Data"),
            keyboardType: TextInputType.datetime,
            controller: dateController,
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Center(
                child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                textStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () => {
                dao.save(new Task(0, nameController.text, false,
                    DateTime.parse(dateController.text))),
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => MyApp()),
                )
              },
              child: Column(children: [Icon(Icons.add)]),
            )),
          )
        ],
      ),
    );
  }
}
