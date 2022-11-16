import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF698F3F),
      child: const TabBar(
        labelColor: Colors.white,
        unselectedLabelColor: Colors.white70,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorPadding: EdgeInsets.all(5.0),
        indicatorColor: Color.fromARGB(255, 184, 192, 176),
        tabs: [
          Tab(
            text: "IP",
            icon: Icon(Icons.wifi),
          ),
          Tab(
            text: "Trace",
            icon: Icon(Icons.gps_fixed),
          ),
          Tab(
            text: "Help",
            icon: Icon(Icons.help_center),
          ),
        ],
      ),
    );
  }
}
