import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const Myapp());
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  final String _txtPessoa = "O total para cada pessoa pagar: ";
  final String _txtGarcom = "O total para pagar a taxa do Garçom: ";
  final String _txtGeral = "O total geral a se pagar: ";
  String _totalPessoa = "";
  String _totalGarcom = "";
  String _totalGeral = "";
  final controllerPreco = TextEditingController();
  final controllerQuantidade = TextEditingController();
  final controllerGarcom = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          const Center(
            child: Text(
                "Calcule o total da sua conta do bar e divida com seus amigos:",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic)),
          ),
          const SizedBox(height: 10),
          TextField(
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            controller: controllerQuantidade,
            decoration: const InputDecoration(
                labelText: "Quantidade de pessoas",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)))),
          ),
          const SizedBox(height: 10),
          TextField(
            textAlign: TextAlign.center,
            controller: controllerPreco,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
                labelText: "Valor total da conta",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)))),
          ),
          const SizedBox(height: 10),
          TextField(
            textAlign: TextAlign.center,
            controller: controllerGarcom,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
                labelText: "Porcentagem para o garçom (em %)",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)))),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
              onPressed: calcIMC, child: const Text("Dividir a conta")),
          const SizedBox(height: 10),
          Text(
            _txtGarcom,
            style: const TextStyle(color: Colors.black, fontSize: 18),
          ),
          const SizedBox(height: 10),
          if (_totalGarcom.isNotEmpty)
            Text(
              _totalGarcom,
              style: const TextStyle(
                  color: Color.fromARGB(255, 199, 48, 48), fontSize: 21),
            ),
          Text(_txtGeral,
              style: const TextStyle(color: Colors.black, fontSize: 18)),
          const SizedBox(height: 10),
          if (_totalGeral.isNotEmpty)
            Text(_totalGeral,
                style: const TextStyle(
                    color: Color.fromARGB(255, 199, 48, 48), fontSize: 21)),
          Text(_txtPessoa,
              style: const TextStyle(color: Colors.black, fontSize: 18)),
          const SizedBox(height: 10),
          if (_totalPessoa.isNotEmpty)
            Text(_totalPessoa,
                style: const TextStyle(
                    color: Color.fromARGB(255, 199, 48, 48), fontSize: 21)),
        ],
      ),
    );
  }

  calcIMC() {
    final int quantidade = int.parse(controllerQuantidade.text);
    final double preco = double.parse(controllerPreco.text);
    final double porcentagem = double.parse(controllerGarcom.text);
    setState(() {
      _totalGarcom = "R\$ ${(preco * (porcentagem / 100)).toStringAsFixed(2)}";
      _totalGeral =
          "R\$ ${(preco + (preco * (porcentagem / 100))).toStringAsFixed(2)}";
      _totalPessoa =
          "R\$ ${(((preco * (porcentagem / 100)) + preco) / quantidade).toStringAsFixed(2)}";
    });
  }
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
              title: const Center(child: Text("Divide a conta do Bar")),
              backgroundColor: const Color.fromARGB(228, 15, 15, 15)),
          body: body(),
          bottomNavigationBar: BottomAppBar(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: const [
                Padding(padding: EdgeInsets.all(10)),
                Text("Feito por Leon Junio Martins - LDDM 2023",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    )),
              ],
            ),
          )),
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(225, 146, 46, 141))),
    );
  }

  body() {
    return const Padding(padding: EdgeInsets.all(15), child: MyWidget());
  }
}
