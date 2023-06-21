import 'package:flutter/material.dart';
import 'package:gastos/NovasTransacoes.dart';
import 'package:gastos/transacoesWidget.dart';
import 'Transacao.dart';

class TransacaoUsuario extends StatefulWidget {
  @override
  _TransacaoUsuarioState createState() => _TransacaoUsuarioState();
}

class _TransacaoUsuarioState extends State<TransacaoUsuario> {
  final List<Transacao> transacoes = [
    Transacao(id: 'A1', title: "Café", amount: 3.00, date: DateTime.now()),
    Transacao(
        id: 'A2', title: "Hamburguer", amount: 18.00, date: DateTime.now())
  ];
  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transacao(
        title: txTitle,
        amount: txAmount,
        date: DateTime.now(),
        id: DateTime.now().toString());
    setState(() {
      transacoes.add(newTx);
    });
  }

  void _deleteTransaction(String id) {
    setState(() {
      transacoes.removeWhere((tx) {
        return tx.id == id;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NovasTransacoes(_addNewTransaction),
        TransacoesWidget(transacoes, _deleteTransaction)
      ],
    );
  }
}
