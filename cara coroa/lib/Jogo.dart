import 'package:flutter/material.dart';
import 'dart:math';

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _imagemApp = AssetImage("imagens/opcao.png");
  var _mensagem = "Escolha uma opção abaixo";

  void _opcaoSelecionada(String escolhaUsuario) {
    var opcoes = ["cara", "coroa"];
    var numero = Random().nextInt(2);
    var escolhaApp = opcoes[numero];

    //Exibição da imagem escolhida pelo App
    switch (escolhaApp) {
      case "cara":
        setState(() {
          this._imagemApp = AssetImage("imagens/cara260.png");
        });
        break;
      case "coroa":
        setState(() {
          this._imagemApp = AssetImage("imagens/coroa260.png");
        });
        break;
    }

    //Validação do ganhador
    //Usuario Ganhador
    if (escolhaUsuario == escolhaApp) {
      setState(() {
        this._mensagem = "Parabéns!!! Você ganhou :)";
      });
      //App Ganhador
    } else {
      this._mensagem = "Você perdeu :(";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cara ou Coroa"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolha do Computador",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Image(image: this._imagemApp, height: 100),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              this._mensagem,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () => _opcaoSelecionada("cara"),
                child: Image.asset(
                  "imagens/cara260.png",
                  height: 100,
                ),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("coroa"),
                child: Image.asset(
                  "imagens/coroa260.png",
                  height: 100,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
