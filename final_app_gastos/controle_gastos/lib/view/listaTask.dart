import 'package:controle_tasks/dao/daoTasks.dart';
import 'package:flutter/material.dart';
import 'package:controle_tasks/model/task.dart';
import 'package:intl/intl.dart';
//import 'package:sqflite_common_ffi/sqflite_ffi.dart';

// ignore: must_be_immutable
class ListaTasks extends StatefulWidget {
  ListaTasks({Key? key, this.name = ""}) : super(key: key);
  String name = "";
  @override
  State<ListaTasks> createState() => _ListaTasksState(name);
}

class _ListaTasksState extends State<ListaTasks> {
  final DAOTask dao = DAOTask();
  String name = "";
  _ListaTasksState(this.name);

  // @override
  // void initState() {
  //   super.initState();
  //   initializeDatabaseFactory();
  // }

  // void initializeDatabaseFactory() {
  //   sqfliteFfiInit();
  //   databaseFactory = databaseFactoryFfi;
  // }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Task>>(
      future: this.name == "" ? dao.query() : dao.queryByName(this.name),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          List<Task> listTask = snapshot.data ?? [];
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: listTask
                .map(
                  (task) => GestureDetector(
                    child: Card(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 15,
                            ),
                            padding: EdgeInsets.all(0),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              border: Border.all(
                                width: 2,
                                color: Color.fromARGB(255, 135, 89, 214),
                              ),
                            ),
                            child: Checkbox(
                              value: task.completed,
                              onChanged: (value) {
                                setState(() {
                                  task.completed = value!;
                                });
                                dao.update(task);
                              },
                            ),
                          ),
                          Column(
                            children: [
                              Text(
                                task.name,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                DateFormat('dd/MM/yyyy hh:mm')
                                    .format(task.date),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                listTask.remove(task);
                              });
                              dao.remove(task.id);
                            },
                            icon: Icon(
                              Icons.remove,
                              color: Color.fromARGB(255, 135, 89, 214),
                            ),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        task.completed = !task.completed;
                      });
                      dao.update(task);
                    },
                  ),
                )
                .toList(),
          );
        }
      },
    );
  }
}
