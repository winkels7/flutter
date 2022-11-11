import 'package:flutter/material.dart';

// import 'package:desafio_todo/list/listaTodo.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:desafio_todo/data/database.dart';

class FloatBtn extends StatefulWidget {
  FloatBtn({super.key});

  @override
  State<FloatBtn> createState() => _FloatBtnState();
}

class _FloatBtnState extends State<FloatBtn> {
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

  void onEnviar() {
    setState(() {
      db.listaTodo.add([_controller.text, false]);
      _controller.clear();
    });
    db.updateDataBase();
  }

  void deleteTask(int index) {
    setState(() {
      db.listaTodo.removeAt(index);
    });
    db.updateDataBase();
  }

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext contexto) => AlertDialog(
          title: const Text('Inserir tarefa'),
          // content: const Text('AlertDialog description'),
          actions: <Widget>[
            TextFormField(
              controller: _controller,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Descreva a tarefa'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(contexto, 'Cancelar'),
                  child: const Text('Cancelar'),
                ),
                TextButton(
                  onPressed: () {
                    onEnviar();
                    Navigator.of(contexto).maybePop();
                    db.updateDataBase();
                  },
                  child: const Text('Enviar'),
                ),
              ],
            )
          ],
        ),
      ),
      backgroundColor: Color(0xFFCC2936),
      child: const Icon(Icons.add),
    );
  }
}
