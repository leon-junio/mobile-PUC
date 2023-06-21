import 'package:flutter/material.dart';
import 'package:app_gastos/model/transacao.dart';

class ListaTransacoes extends StatefulWidget {
  const ListaTransacoes({super.key});

  @override
  State<ListaTransacoes> createState() => _ListaTransacoesState();
}

class _ListaTransacoesState extends State<ListaTransacoes> {
  List<Transacao> listTransacao = [
    Transacao(1, "Café", 2.00, DateTime.now()),
    Transacao(2, "Pão de Queijo", 1.75, DateTime.now()),
    Transacao(3, "Coxinha", 5.00, DateTime.now()),
    Transacao(4, "Pão de Sal", 1.75, DateTime.now()),
    Transacao(5, "Pão de Doce", 1.75, DateTime.now()),
    Transacao(6, "Pão de Mel", 1.75, DateTime.now()),
    Transacao(7, "Pão de Agua", 1.75, DateTime.now()),
    Transacao(8, "Pão de Leite", 1.75, DateTime.now()),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: listTransacao
          .map((transacao) => Card(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(width: 2, color: Colors.blueGrey)),
                    child: Text(
                      "R\$ " + transacao.valor.toString(),
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey),
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        transacao.descricao,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Text(
                        transacao.data.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      )
                    ],
                  ),
                  IconButton(
                      onPressed: null,
                      icon: Icon(Icons.delete, color: Colors.red))
                ],
              )))
          .toList(),
    );
  }
}
