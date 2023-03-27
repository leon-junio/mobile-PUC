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
  String _resposta = "A resposta é: ";
  final myControllerAltura = TextEditingController();
  final myControllerPeso = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          TextField(
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            controller: myControllerPeso,
            decoration: const InputDecoration(
                labelText: "Peso",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)))),
          ),
          const SizedBox(height: 10),
          TextField(
            textAlign: TextAlign.center,
            controller: myControllerAltura,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
                labelText: "Altura",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)))),
          ),
          ElevatedButton(onPressed: calcIMC, child: const Text("Calcular")),
          if (_resposta.isNotEmpty) Text(_resposta)
        ],
      ),
    );
  }

  calcIMC() {
    final double peso = double.parse(myControllerPeso.text);
    final double altura = double.parse(myControllerAltura.text) / 100;
    setState(() {
      _resposta = (peso / (altura * altura)).toString();
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
            title: const Text("IMC"),
            backgroundColor: const Color.fromARGB(228, 15, 15, 15)),
        body: body(),
      ),
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(226, 21, 144, 245))),
    );
  }

  body() {
    return const Padding(padding: EdgeInsets.all(15), child: MyWidget());
  }
}
