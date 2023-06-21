import 'package:flutter/material.dart';
import 'package:whatsapp_app/model/contato.dart';

class ChatContact extends StatefulWidget {
  ChatContact(this.contato, {super.key});
  final Contato contato;
  @override
  State<ChatContact> createState() => _ChatContactState(contato);
}

class _ChatContactState extends State<ChatContact> {
  _ChatContactState(this.contato);
  Contato contato;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: contato.icon,
              radius: 20,
              backgroundColor: Color.fromARGB(255, 7, 94, 84),
            ),
            Padding(
              padding: EdgeInsets.all(2),
              child: Column(children: [
                Text(
                  contato.nome,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  contato.descricao,
                  textAlign: TextAlign.right,
                  style: TextStyle(fontSize: 10),
                )
              ]),
            )
          ],
        ),
        backgroundColor: Color.fromARGB(255, 7, 94, 84),
      ),
      body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("resources/background.jpg"),
                fit: BoxFit.cover),
          )),
      bottomNavigationBar: BottomAppBar(
          child: Row(
        children: [
          Padding(
            padding: EdgeInsets.all(4),
            child: Icon(Icons.emoji_emotions),
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Mensagem",
                  fillColor: Color.fromARGB(255, 7, 94, 84)),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(4),
            child: Icon(Icons.send, color: Color.fromARGB(255, 7, 94, 84)),
          ),
        ],
      )),
    );
  }
}
