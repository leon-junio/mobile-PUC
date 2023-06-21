import 'package:flutter/material.dart';

class CrudTransacao extends StatelessWidget {
  CrudTransacao({super.key});
  TextEditingController descricaoController = TextEditingController();
  TextEditingController valorController = TextEditingController();

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
              "Insira o gasto:",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            )),
          ),
          TextField(
            decoration: InputDecoration(labelText: "Descrição"),
            controller: descricaoController,
          ),
          TextField(
            decoration: InputDecoration(labelText: "Valor"),
            keyboardType: TextInputType.number,
            controller: valorController,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Center(
                child: ElevatedButton(
              onPressed: () => {},
              child: Container(
                  child: Column(children: [Text("Incluir"), Icon(Icons.add)])),
            )),
          )
        ],
      ),
    );
  }
}
