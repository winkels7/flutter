import 'package:flutter/material.dart';
import 'package:desafio_todo/widget/item_todo.dart';

// import 'package:desafio_todo/model/item.dart';

import 'package:desafio_todo/list/todolist.dart';
import 'package:desafio_todo/widget/dialogo.dart';

class NaoFeito extends StatefulWidget {
  NaoFeito({super.key});

  @override
  State<NaoFeito> createState() => _NaoFeitoState();
}


class _NaoFeitoState extends State<NaoFeito> {
  
  final _controller = TextEditingController();

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      listaTodo[index][1] = !listaTodo[index][1];
    });
  }

  void saveNewTask() {
    setState(() {
      listaTodo.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

    void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return Dialogo(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  void deletar(int index) {
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
                  deletar: (context) => deletar(index),
                );
              }))),
    );
  }
}
