import 'package:flutter/material.dart';
import 'package:whatsapp_app/model/contato.dart';
import 'package:intl/intl.dart';
import 'package:whatsapp_app/view/chatContato.dart';

class ListaContatos extends StatefulWidget {
  const ListaContatos({super.key});

  @override
  State<ListaContatos> createState() => _ListaContatosState();
}

class _ListaContatosState extends State<ListaContatos> {
  final formatter = new DateFormat('dd-MM-yyyy hh:mm');
  List<Contato> listContatos = [
    Contato(1, "Cristiano Ronaldo", AssetImage("resources/ct7.png"),
        "Descrição teste", DateTime.now(), "+55 (37)99071-1708"),
    Contato(2, "Neymar", AssetImage("resources/ct6.png"), "Mensagem de teste",
        DateTime.now(), "+55 (38)99877-9872"),
    Contato(3, "Chadwick", AssetImage("resources/ct4.png"), "Descrição teste",
        DateTime.now(), "+55 (31)59947-0012"),
    Contato(4, "Zoologico", AssetImage("resources/ct5.png"), "Ola bom dia!",
        DateTime.now(), "+55 (31)99575-9805"),
    Contato(5, "Geraldino", AssetImage("resources/ct1.png"),
        "Ola bom dia tudo bem?", DateTime.now(), "+55 (31)99977-"),
    Contato(6, "Arthur", AssetImage("resources/ct2.png"), "Descrição teste",
        DateTime.now(), "+55 (31)97927-7457"),
    Contato(7, "Mãe ❤", AssetImage("resources/ct3.png"), "Descrição teste",
        DateTime.now(), "+55 (33)13277-4144"),
    Contato(8, "Tio Pow Paul", AssetImage("resources/ct3.png"),
        "Descrição teste", DateTime.now(), "+55 (31)99977-5898"),
    Contato(9, "Reginalda", AssetImage("resources/ct2.png"), "Oi boa tarde?",
        DateTime.now(), "+55 (31)99111-3323"),
    Contato(10, "Marcelo Alves", AssetImage("resources/ct1.png"),
        "Oi boa tarde?", DateTime.now(), "+55 (31)99111-1231"),
    Contato(11, "João Paulo", AssetImage("resources/ct1.png"), "Oi boa tarde?",
        DateTime.now(), "+55 (31)89978-8887"),
    Contato(12, "Jacinto", AssetImage("resources/ct5.png"), "Oi boa tarde?",
        DateTime.now(), "+55 (31)92277-3244"),
    Contato(13, "Gabiroba", AssetImage("resources/ct2.png"), "Descrição teste",
        DateTime.now(), "+55 (31)99977-1234"),
    Contato(14, "Oficina Cimas", AssetImage("resources/ct3.png"),
        "Descrição teste", DateTime.now(), "+55 (31)99977-9842"),
    Contato(15, "Junior Pilares", AssetImage("resources/ct1.png"),
        "Ultimamente isso é um teste", DateTime.now(), "+55 (31)99911-1111")
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: listContatos
              .map((contato) => GestureDetector(
                  child: Card(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 15),
                            padding: EdgeInsets.all(4),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundImage: contato.icon,
                                  radius: 30,
                                  backgroundColor:
                                      Color.fromARGB(255, 7, 94, 84),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(4),
                                  child: Text(
                                    contato.nome.length > 10
                                        ? contato.nome.substring(0, 10) + '...'
                                        : contato.nome,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                )
                              ],
                            )),
                        Column(
                          children: [
                            Text(
                              contato.numeroTelefone,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                            Text(
                              formatter.format(contato.dataUltimaMensagem),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            IconButton(
                              onPressed: null,
                              focusColor: Color.fromARGB(255, 7, 94, 84),
                              icon: Icon(Icons.send,
                                  color: Color.fromARGB(255, 7, 94, 84)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChatContact(contato)));
                  }))
              .toList(),
        ),
      ),
    );
  }
}
