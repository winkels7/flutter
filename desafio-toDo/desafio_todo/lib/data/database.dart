import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  List listaTodo = [];
  final _myBox = Hive.box('mybox');

  // dados iniciais
  void createInitialData() {
    listaTodo = [
      ["Make Tutorial", false],
      ["Aprender flutter", false],
    ];
  }

  // get
  void loadData() {
    listaTodo = _myBox.get("LISTATODO");
  }

  // atualizar
  void updateDataBase() {
    _myBox.put("LISTATODO", listaTodo);
  }
}