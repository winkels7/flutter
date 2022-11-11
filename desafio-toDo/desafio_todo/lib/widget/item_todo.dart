import 'package:flutter/material.dart';

class ItemToDo extends StatelessWidget {
  final String nomeTarefa;
  final bool feito;
  Function(bool?)? onChanged;
  Function(BuildContext) onDelete;

  ItemToDo({
    Key? key,
    required this.nomeTarefa,
    required this.feito,
    required this.onChanged,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.fromLTRB(5, 0, 5, 15),
        child: ListTile(
          onTap: () {},
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          tileColor: Colors.white,
          leading: Checkbox(value: feito, onChanged: onChanged),
          // todo.feito ? Icons.check_box : Icons.check_box_outline_blank,
          // color: Color(0xFF388697)
          title: Text(
            nomeTarefa,
            style: TextStyle(
                fontSize: 18,
                color: Colors.black,
                decoration:
                    feito ? TextDecoration.lineThrough : TextDecoration.none),
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
              onPressed: () {
                onDelete(context);
              },
              // onPressed: onDelete(context),
            ),
          ),
        ));
  }
}
