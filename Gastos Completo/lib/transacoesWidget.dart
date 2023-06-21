import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'Transacao.dart';

class TransacoesWidget extends StatelessWidget {
  final List<Transacao> transacoesAux;
  final Function deleteTx;
  TransacoesWidget(this.transacoesAux, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        child: SingleChildScrollView(
            child: Column(
          children: transacoesAux.map((trans) {
            return Card(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.purple, width: 2)),
                  padding: EdgeInsets.all(10),
                  child: Text('R\$ ${trans.amount.toStringAsFixed(2)}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.purple)),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      trans.title,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      DateFormat("yyyy-MM-dd HH:mm").format(trans.date),
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                IconButton(
                    alignment: Alignment.centerRight,
                    onPressed: () => deleteTx(trans.id),
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red,
                    ))
              ],
            ));
          }).toList(),
        )));
  }
}
