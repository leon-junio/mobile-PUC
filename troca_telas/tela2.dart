import 'package:flutter/material.dart';

class Tela2 extends StatelessWidget {
  Tela2(this.parametro, {super.key});
  String parametro = "";
  @override
  Widget build(BuildContext build) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela 2"),
      ),
      body: Center(
        child: Text(parametro),
      ),
    );
  }
}
