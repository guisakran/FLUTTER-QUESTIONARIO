import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int notaResultado;
  final void Function() funcaoReiniciarTeste;

  Resultado(this.notaResultado, this.funcaoReiniciarTeste);

  String get fraseResultado {
    if (notaResultado < 8) {
      return 'Parabéns!';
    } else if (notaResultado < 12) {
      return 'Vocé é bom!';
    } else if (notaResultado < 19) {
      return 'Impressionante!';
    } else {
      return 'Parabéns você é um Jedi! \nSua nota é $notaResultado.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            fraseResultado,
            style: const TextStyle(fontSize: 28),
            textAlign: TextAlign.center,
          ),
        ),
        TextButton(
          onPressed: funcaoReiniciarTeste,
          child: const Text(
            'Reiniciar?',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }
}
