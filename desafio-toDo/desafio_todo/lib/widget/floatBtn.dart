import 'package:flutter/material.dart';

import 'package:desafio_todo/list/listaTodo.dart';

class FloatBtn extends StatefulWidget {
  FloatBtn({super.key});

  @override
  State<FloatBtn> createState() => _FloatBtnState();
}

class _FloatBtnState extends State<FloatBtn> {
  void onEnviar() {
    setState(() {
      listaTodo.add([_controller.text, false]);
    });
  }

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext contexto) => AlertDialog(
          title: const Text('Inserir tarefa'),
          // content: const Text('AlertDialog description'),
          actions: <Widget>[
            TextFormField(
              controller: _controller,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Descreva a tarefa'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(contexto, 'Cancelar'),
                  child: const Text('Cancelar'),
                ),
                TextButton(
                  onPressed: () {
                    onEnviar();
                    Navigator.of(contexto).maybePop();
                  },
                  child: const Text('Enviar'),
                ),
              ],
            )
          ],
        ),
      ),
      backgroundColor: Color(0xFFCC2936),
      child: const Icon(Icons.add),
    );
  }
}
