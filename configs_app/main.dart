import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: MainApp()));
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});
  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  TextEditingController idadeControl = TextEditingController();
  bool valorCheck = false, valorSwitch = false;
  int sexo = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Configurações do aplicativo"),
      ),
      body: Padding(
        padding: EdgeInsetsDirectional.all(0),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(5),
              child: TextField(
                controller: idadeControl,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "Idade do usuário"),
                style: TextStyle(fontSize: 18, color: Colors.black),
                obscureText: false,
              ),
            ),
            CheckboxListTile(
                title:
                    Text("Termos de uso aceite os termos de uso do aplicativo"),
                subtitle: Text("Receber emails de confirmação e propaganda"),
                value: valorCheck,
                activeColor: Colors.black,
                hoverColor: Colors.blueGrey,
                onChanged: (valor) {
                  setState(() {
                    valorCheck = valor!; //ignorar null safety
                  });
                  print(valorCheck);
                }),
            SizedBox(height: 15),
            Text("Escolha o sexo:"),
            RadioListTile(
                title: Text("Masculino"),
                value: 1,
                groupValue: sexo,
                onChanged: (valor) {
                  setState(() {
                    sexo = valor!;
                  });
                }),
            RadioListTile(
                title: Text("Feminino"),
                value: 2,
                groupValue: sexo,
                onChanged: (valor) {
                  setState(() {
                    sexo = valor!;
                  });
                }),
            SwitchListTile(
                title: Text("Ligar backup de sistema"),
                subtitle: Text("Todo dia às meia noite"),
                value: valorSwitch,
                onChanged: (valor) {
                  setState(() {
                    valorSwitch = valor;
                  });
                }),
            ElevatedButton(
                onPressed: () {
                  print(idadeControl.text);
                },
                child: Text("Salvar idade")),
          ],
        ),
      ),
      bottomNavigationBar:
          BottomAppBar(child: Text("Configurações de um app - Leon Junio")),
    );
  }
}
