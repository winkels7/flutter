import 'package:flutter/material.dart';
import 'package:desafio_todo/widget/item_todo.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:desafio_todo/data/database.dart';

class Tudo extends StatefulWidget {
  Tudo({super.key});

  @override
  State<Tudo> createState() => _TudoState();
}

class _TudoState extends State<Tudo> {
  final _myBox = Hive.box('mybox');
  ToDoDataBase db = ToDoDataBase();

  @override
  void initState() {
    if (_myBox.get("LISTATODO") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }

    super.initState();
  }

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.listaTodo[index][1] = !db.listaTodo[index][1];
    });
    db.updateDataBase();
  }

  void deletar(int index) {
    setState(() {
      db.listaTodo.removeAt(index);
    });
    db.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          margin: EdgeInsets.fromLTRB(5, 5, 5, 10),
          child: ListView.builder(
              itemCount: db.listaTodo.length,
              itemBuilder: ((context, index) {
                return ItemToDo(
                  nomeTarefa: db.listaTodo[index][0],
                  feito: db.listaTodo[index][1],
                  onChanged: (value) => checkBoxChanged(value, index),
                  onDelete: (context) => deletar(index),
                );
              }))),
    );
  }
}
