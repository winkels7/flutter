import 'package:desafio_todo/model/item.dart';
import 'package:flutter/material.dart';

class ItemToDo extends StatelessWidget {
  final ToDo todo;
  const ItemToDo({Key? key, required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListTile(
      onTap: () {},
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      tileColor: Colors.white,
      leading: Icon(
        todo.feito ? Icons.check_box : Icons.check_box_outline_blank,
        color: Color(0xFF388697),
      ),
      title: Text(
        todo.todoText!,
        style: TextStyle(
            fontSize: 18,
            color: Colors.black,
            decoration:
                todo.feito ? TextDecoration.lineThrough : TextDecoration.none),
      ),
      trailing: Container(
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: Color(0xFFFFA987),
            borderRadius: BorderRadius.circular(5),
          ),
          child: IconButton(
            icon: Icon(Icons.delete),
            color: Colors.white,
            iconSize: 18,
            onPressed: () {},
          )),
    ));
  }
}
