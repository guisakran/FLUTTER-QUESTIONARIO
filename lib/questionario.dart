import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questao.dart';
import 'package:projeto_perguntas/resposta.dart';

class Questionario extends StatelessWidget {
  final int perguntaSelecionada;
  final List<Map<String, Object>> lstPerguntas;
  final void Function(int) funcaoResponder;

  Questionario({
    required this.perguntaSelecionada,
    required this.lstPerguntas,
    required this.funcaoResponder,
  });

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> lstRespostas =
        lstPerguntas[perguntaSelecionada].cast()['lstResposta'];

    return Column(
      children: [
        Questao(lstPerguntas[perguntaSelecionada]['txtPergunta'].toString()),
        //...widgetResposta,
        ...lstRespostas
            .map(
              (resp) => Resposta(resp['texto'].toString(),
                  () => funcaoResponder(int.parse(resp['nota'].toString()))),
            )
            .toList(),
      ],
    );
  }
}
