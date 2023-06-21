import 'package:flutter/material.dart';
import 'package:app_gastos/view/crudTransacao.dart';

class viewCadTransacao extends StatefulWidget {
  viewCadTransacao({super.key});
  @override
  State<viewCadTransacao> createState() => _viewCadTransacaoState();
}

class _viewCadTransacaoState extends State<viewCadTransacao> {
  _viewCadTransacaoState();
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
                  "Cadastro de gastos",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                )
              ]),
            )
          ],
        ),
        backgroundColor: Color.fromARGB(255, 135, 89, 214),
      ),
      body: Container(child: CrudTransacao()),
    );
  }
}
