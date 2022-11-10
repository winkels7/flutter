import 'package:flutter/material.dart';
import 'package:desafio_todo/widget/item_todo.dart';

// import 'package:desafio_todo/model/item.dart';

class Tudo extends StatefulWidget {
  Tudo({super.key});

  @override
  State<Tudo> createState() => _TudoState();
}

// final listaTodo = ToDo.todoLista();

class _TudoState extends State<Tudo> {
  List listaTodo = [
    ["Teste", false],
    ["Teste 2", false]
  ];

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
