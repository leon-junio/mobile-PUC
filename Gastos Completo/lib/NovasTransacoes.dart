import 'package:flutter/material.dart';

class NovasTransacoes extends StatelessWidget {
  final descritivoController = TextEditingController();
  final gastoController = TextEditingController();
  final Function addTx;
  NovasTransacoes(this.addTx);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                TextField(
                  controller: descritivoController,
                  decoration: InputDecoration(labelText: 'Title: '),
                ),
                TextField(
                  controller: gastoController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Amount: '),
                ),
                ElevatedButton(
                    onPressed: () {
                      addTx(descritivoController.text,
                          double.parse(gastoController.text));
                    },
                    child: Text("Incluir"))
              ])),
    );
  }
}
