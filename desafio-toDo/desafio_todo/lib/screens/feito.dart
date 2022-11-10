import 'package:flutter/material.dart';
import 'package:desafio_todo/widget/item_todo.dart';

import 'package:desafio_todo/model/item.dart';

class Feito extends StatelessWidget {
  Feito({Key? key}) : super(key: key);

  final listaTodo = ToDo.todoLista();

  //filtro
  // List filtroFeitos = listaTodo.where((feito) => true).toList();
  // listaTodo.removeWhere()

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          margin: EdgeInsets.fromLTRB(5, 5, 5, 10),
          child: ListView(
            children: [for (ToDo todoo in listaTodo) ItemToDo(todo: todoo)],
          )),
    );
  }
}
