import 'package:flutter/material.dart';
import 'package:desafio_todo/widget/item_todo.dart';

import 'package:desafio_todo/list/listaTodo.dart';

// import 'package:desafio_todo/model/item.dart';

class NaoFeito extends StatefulWidget {
  NaoFeito({super.key});

  @override
  State<NaoFeito> createState() => _NaoFeitoState();
}

// final listaTodo = ToDo.todoLista();

class _NaoFeitoState extends State<NaoFeito> {

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      listaTodo[index][1] = !listaTodo[index][1];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          margin: EdgeInsets.fromLTRB(5, 5, 5, 10),
          child: ListView.builder(
              itemCount: listaTodo.length,
              itemBuilder: ((context, index) {
                return ItemToDo(
                  nomeTarefa: listaTodo[index][0],
                  feito: listaTodo[index][1],
                  onChanged: (value) => checkBoxChanged(value, index),
                );
              }))),
    );
  }
}
