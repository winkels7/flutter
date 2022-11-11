import 'package:flutter/material.dart';
import 'package:desafio_todo/widget/item_todo.dart';
import 'package:desafio_todo/list/listaTodo.dart';

// import 'package:desafio_todo/model/item.dart';

class Feito extends StatefulWidget {
  Feito({super.key});

  @override
  State<Feito> createState() => _FeitoState();
}

// final listaTodo = ToDo.todoLista();

class _FeitoState extends State<Feito> {

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      listaTodo[index][1] = !listaTodo[index][1];
    });
  }

  void deletar(int index){
    setState(() {
      listaTodo.removeAt(index);
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
                  onDelete: (context) => deletar(index),
                );
              }))),
    );
  }
}
