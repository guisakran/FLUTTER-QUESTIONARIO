import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questionario.dart';
import 'package:projeto_perguntas/resultado.dart';

main() {
  runApp(PerguntaApp());
}

class PerguntaApp extends StatefulWidget {
  @override
  State<PerguntaApp> createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  int _perguntaSelecionada = 0;
  int _notaResultado = 0;

  void _responder(int nota) {
    if (aindaTemPerguntas) {
      setState(() {
        _perguntaSelecionada++;
        _notaResultado += nota;
      });
    }
  }

  void _reiniciarTeste() {
    setState(() {
      _perguntaSelecionada = 0;
      _notaResultado = 0;
    });
  }

  final List<Map<String, Object>> _lstPerguntas = [
    {
      'txtPergunta': 'Qual a sua cor favorita?',
      'lstResposta': [
        {'texto': 'Branco', 'nota': 10},
        {'texto': 'Preto', 'nota': 5},
        {'texto': 'Vermelho', 'nota': 3},
        {'texto': 'Roxo', 'nota': 1},
      ]
    },
    {
      'txtPergunta': 'Qual o seu animal favorito?',
      'lstResposta': [
        {'texto': 'Girafa', 'nota': 10},
        {'texto': 'Hipopótamo', 'nota': 5},
        {'texto': 'Leão', 'nota': 3},
        {'texto': 'Rato', 'nota': 1},
      ]
    },
    {
      'txtPergunta': 'Qual o seu instrutor favorito?',
      'lstResposta': [
        {'texto': 'Renata', 'nota': 10},
        {'texto': 'Paulo', 'nota': 5},
        {'texto': 'José', 'nota': 3},
        {'texto': 'Maria', 'nota': 1},
      ]
    }
  ];

  bool get aindaTemPerguntas {
    return _perguntaSelecionada < _lstPerguntas.length;
  }

  // List<Widget> widgetResposta =
  //     lstRespostas.map((e) => Resposta(e, _responder)).toList();
  // ou-------------------------------------------------------------------
  // for (String resposta
  //     in lstPerguntas[_perguntaSelecionada].cast()['lstResposta']) {
  //   widgetResposta.add(Resposta(resposta, _responder));
  // }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
        ),
        body: aindaTemPerguntas
            ? Questionario(
                perguntaSelecionada: _perguntaSelecionada,
                lstPerguntas: _lstPerguntas,
                funcaoResponder: _responder,
              )
            : Resultado(_notaResultado, _reiniciarTeste),
      ),
    );
  }
}
