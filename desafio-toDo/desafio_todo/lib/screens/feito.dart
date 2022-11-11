import 'package:flutter/material.dart';
import 'package:desafio_todo/widget/item_todo.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:desafio_todo/data/database.dart';

// import 'package:desafio_todo/model/item.dart';

class Feito extends StatefulWidget {
  Feito({super.key});

  @override
  State<Feito> createState() => _FeitoState();
}

// final listaTodo = ToDo.todoLista();

class _FeitoState extends State<Feito> {
  final _myBox = Hive.box('mybox');
  ToDoDataBase db = ToDoDataBase();

  @override
  void initState() {
    // if this is the 1st time ever openin the app, then create default data
    if (_myBox.get("TODOLIST") == null) {
      // db.createInitialData();
    } else {
      // there already exists data
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
                );
              }))),
    );
  }
}
