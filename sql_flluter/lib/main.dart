import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

void main() => runApp(MaterialApp(
      home: Home(),
    ));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  _recuperarBancoDados() async {
    final caminhoBancoDados = await getDatabasesPath();
    final localBancoDados = join(caminhoBancoDados, "banco.db");

    var bd = await openDatabase(localBancoDados, version: 1,
        onCreate: (db, dbVersaoRecente) {
      String sql =
          "CREATE TABLE usuarios (id INTEGER PRIMARY KEY AUTOINCREMENT, nome VARCHAR, idade INTEGER) ";
      db.execute(sql);
    });

    return bd;
    //print("aberto: " + bd.isOpen.toString() );
  }

  _salvar() async {
    Database bd = await _recuperarBancoDados();

    Map<String, dynamic> dadosUsuario = {"nome": "zurich mol", "idade": 42};
    int id = await bd.insert("usuarios", dadosUsuario);
    print("Salvo: $id ");
  }

  _listarUsuarios() async {
    Database bd = await _recuperarBancoDados();

    //String sql = "SELECT * FROM usuarios WHERE id = 5 ";
    //String sql = "SELECT * FROM usuarios WHERE idade >= 30 AND idade <= 58";
    //String sql = "SELECT * FROM usuarios WHERE idade BETWEEN 18 AND 46 ";
    //String sql = "SELECT * FROM usuarios WHERE idade IN (18,30) ";
    //String filtro = "an";
    //String sql = "SELECT * FROM usuarios WHERE nome LIKE '%" + filtro + "%' ";
    //String sql = "SELECT *, UPPER(nome) as nomeMaiu FROM usuarios WHERE 1=1 ORDER BY UPPER(nome) DESC ";//ASC, DESC
    //String sql = "SELECT *, UPPER(nome) as nomeMaiu FROM usuarios WHERE 1=1 ORDER BY idade DESC LIMIT 3";//ASC, DESC
    String sql = "SELECT * FROM usuarios "; //ASC, DESC
    List usuarios = await bd.rawQuery(sql);

    for (var usuario in usuarios) {
      print("item id: " +
          usuario['id'].toString() +
          " nome: " +
          usuario['nome'] +
          " idade: " +
          usuario['idade'].toString());
    }

    //print("usuarios: " + usuarios.toString() );
  }

  _listarUsuarioPeloId(int id) async {
    Database bd = await _recuperarBancoDados();

    //CRUD -> Create, Read, Update and Delete
    List usuarios = await bd.query("usuarios",
        columns: ["id", "nome", "idade"], where: "id = ?", whereArgs: [id]);

    for (var usuario in usuarios) {
      print("item id: " +
          usuario['id'].toString() +
          " nome: " +
          usuario['nome'] +
          " idade: " +
          usuario['idade'].toString());
    }
  }

  _excluirUsuario(int id) async {
    Database bd = await _recuperarBancoDados();

    int retorno = await bd.delete("usuarios", where: "id = ?", whereArgs: [id]);
    /* where: " nome = ? AND idade = ?",
        whereArgs: ["Jamilton Damasceno", 40]);
      */
    print("item qtde removida: $retorno");
  }

  _atualizarUsuario(int id) async {
    Database bd = await _recuperarBancoDados();

    Map<String, dynamic> dadosUsuario = {
      "nome": "Mariana Almeida",
      "idade": 18
    };
    int retorno = await bd
        .update("usuarios", dadosUsuario, where: "id = ?", whereArgs: [id]);

    print("item qtde atualizada: $retorno");
  }

  @override
  Widget build(BuildContext context) {
    //_salvar();
    //_excluirUsuario(2);
    _atualizarUsuario(1);
    //_listarUsuarios();
    _listarUsuarioPeloId(1);

    return Container();
  }
}
