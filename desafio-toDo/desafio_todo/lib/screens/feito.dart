import 'package:flutter/material.dart';
import 'package:desafio_todo/widget/item_todo.dart';

class Feito extends StatelessWidget {
  const Feito({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ItemToDo(),
      ),
    );
  }
}
