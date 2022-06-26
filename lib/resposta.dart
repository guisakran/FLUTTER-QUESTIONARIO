import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String textoResposta;
  final void Function() funcaoResponder;
  Resposta(this.textoResposta, this.funcaoResponder);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: Colors.blue),
        onPressed: funcaoResponder,
        child: Text(
          textoResposta,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
