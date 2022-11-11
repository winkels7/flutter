import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  List listaTodo = [
      ["Make Tutorial", false],
      ["Do Exercise", false],
    ];

  // reference our boxz
  final _myBox = Hive.box('mybox');

  // // run this method if this is the 1st time ever opening this app
  // void createInitialData() {
  //   listaTodo = 
  // }

  // load the data from database
  void loadData() {
    listaTodo = _myBox.get("LISTATODO");
  }

  // update the database
  void updateDataBase() {
    _myBox.put("LISTATODO", listaTodo);
  }
}