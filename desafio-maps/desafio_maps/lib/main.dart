// import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';

import 'package:desafio_maps/widget/floatBtn.dart';
import 'package:desafio_maps/widget/menu.dart';
import 'package:desafio_maps/screens/ip.dart';
import 'package:desafio_maps/screens/trace.dart';
import 'package:desafio_maps/screens/help.dart';

void main() async {
  runApp(ToDoApp());
}

class ToDoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App Maps',
      home: TabLayoutExample(),
    );
  }
}

class TabLayoutExample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TabLayoutExampleState();
  }
}

class _TabLayoutExampleState extends State<TabLayoutExample>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.animateTo(2);
  }

  static List<Widget> _views = [
    Center(child: IP()),
    Center(child: Trace()),
    Center(child: Help()),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('App Maps'),
            backgroundColor: Color(0xFF698F3F),
          ),
          bottomNavigationBar: Menu(),
          floatingActionButton: FloatBtn(),
          body: TabBarView(
            children: _views,
          ),
        ),
      ),
    );
  }
}
