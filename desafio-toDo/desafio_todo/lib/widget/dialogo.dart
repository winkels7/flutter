import 'package:flutter/material.dart';

class Dialogo extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  Dialogo(
      {super.key,
      required this.controller,
      required this.onSave,
      required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Inserir tarefa'),
      // content: const Text('AlertDialog description'),
      actions: <Widget>[
        TextFormField(
          controller: controller,
          decoration: const InputDecoration(
              border: OutlineInputBorder(), labelText: 'Descreva a tarefa'),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: onCancel,
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: onSave,
              child: const Text('Enviar'),
            ),
          ],
        )
      ],
    );
  }
}
