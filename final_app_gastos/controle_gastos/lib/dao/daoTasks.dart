import 'package:controle_tasks/dao/connection.dart';
import 'package:controle_tasks/model/task.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DAOTask {
  final Connection database = Connection.instance;
  final String table = "tasks";

  save(Task task) async {
    Database bd = await database.getDatabase();
    int id = await bd.insert(table, task.toInsertion());
    Fluttertoast.showToast(
      msg: "A tarefa de id: $id foi salva com sucesso!",
      toastLength: Toast.LENGTH_SHORT, // duration
      gravity: ToastGravity.BOTTOM, // toast position
      backgroundColor: Colors.black, // background color
      textColor: Colors.white, // text color
    );
    return id;
  }

  Future<List<Task>> query() async {
    Database bd = await database.getDatabase();
    List<Map<String, dynamic>> result = await bd.query(table);
    List<Task> tasks = result.map((row) {
      return Task(
        row['id'],
        row['name'],
        row['completed'] == 1,
        DateTime.parse(row['date']),
      );
    }).toList();
    return tasks;
  }

  Future<List<Task>> queryById(int id) async {
    Database bd = await database.getDatabase();
    List<Map<String, dynamic>> result =
        await bd.query(table, where: 'id = ?', whereArgs: [id]);
    List<Task> tasks = result.map((row) {
      return Task(
        row['id'],
        row['name'],
        row['completed'] == 1,
        DateTime.parse(row['date']),
      );
    }).toList();
    return tasks;
  }

  Future<List<Task>> queryByName(String name) async {
    Database bd = await database.getDatabase();
    List<Map<String, dynamic>> result =
        await bd.query(table, where: 'name = ?', whereArgs: [name]);
    List<Task> tasks = result.map((row) {
      return Task(
        row['id'],
        row['name'],
        row['completed'] == 1,
        DateTime.parse(row['date']),
      );
    }).toList();
    return tasks;
  }

  remove(int id) async {
    Database bd = await database.getDatabase();
    int result = await bd.delete(table, where: "id = ?", whereArgs: [id]);
    Fluttertoast.showToast(
      msg: "A tarefa de id: $id foi removida com sucesso!",
      toastLength: Toast.LENGTH_SHORT, // duration
      gravity: ToastGravity.BOTTOM, // toast position
      backgroundColor: Colors.black, // background color
      textColor: Colors.white, // text color
    );
    return result;
  }

  update(Task task) async {
    Database bd = await database.getDatabase();
    int result = await bd
        .update(table, task.toMap(), where: "id = ?", whereArgs: [task.id]);
    Fluttertoast.showToast(
      msg: "A tarefa de id: $result foi atualizada com sucesso!",
      toastLength: Toast.LENGTH_SHORT, // duration
      gravity: ToastGravity.BOTTOM, // toast position
      backgroundColor: Colors.black, // background color
      textColor: Colors.white, // text color
    );
  }
}
