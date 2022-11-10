import 'package:flutter/material.dart';

class FloatBtn extends StatelessWidget {
  VoidCallback onEnviar;

  final _controller = TextEditingController();

  
  FloatBtn({
    super.key,
    required this.onEnviar
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
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
                  onPressed: () => Navigator.pop(context, 'Cancelar'),
                  child: const Text('Cancelar'),
                ),
                TextButton(
                  onPressed: onEnviar,
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
