import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF08415C),
      child: TabBar(
        labelColor: Colors.white,
        unselectedLabelColor: Colors.white70,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorPadding: EdgeInsets.all(5.0),
        indicatorColor: Color.fromARGB(255, 125, 238, 213),
        tabs: [
          Tab(
            text: "Todas",
            icon: Icon(Icons.list_alt),
          ),
          Tab(
            text: "Concluídas",
            icon: Icon(Icons.done),
          ),
          Tab(
            text: "Pendentes",
            icon: Icon(Icons.pending_actions),
          ),
        ],
      ),
    );
  }
}
