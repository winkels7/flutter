import 'package:flutter/material.dart';
import 'package:desafio_todo/screens/feito.dart';

class FloatBtn extends StatelessWidget {
  VoidCallback createNewTask;

  FloatBtn({
    required this.createNewTask,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: createNewTask,
      backgroundColor: Color(0xFFCC2936),
      child: const Icon(Icons.add),
    );
  }
}
