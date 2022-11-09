import 'package:flutter/material.dart';

class ItemToDo extends StatelessWidget {
  const ItemToDo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
      child: ListTile(
        onTap: () {},
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20), ),
        tileColor: Colors.white,
        leading: Icon(Icons.check_box,color: Colors.cyan,),
        title: Text('Item teste', 
        style: TextStyle(
          fontSize: 18,
          color: Colors.black,
          decoration: TextDecoration.lineThrough),
        )
      )
    );
  }
}
