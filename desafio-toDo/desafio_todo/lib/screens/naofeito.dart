import 'package:flutter/material.dart';
import 'package:desafio_todo/widget/item_todo.dart';

class NaoFeito extends StatelessWidget {
  const NaoFeito({Key? key}) : super(key: key);

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          margin: EdgeInsets.fromLTRB(5, 5, 5, 10),
          child: ListView(
            children: [
              ItemToDo(),
              ItemToDo(),
              ItemToDo(),
              ItemToDo(),
              ItemToDo(),
              ItemToDo(),
            ],
          )),
    );
  }
}