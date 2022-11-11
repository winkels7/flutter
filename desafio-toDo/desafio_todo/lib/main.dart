// import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';

import 'package:hive_flutter/hive_flutter.dart';

import 'package:desafio_todo/widget/floatBtn.dart';
import 'package:desafio_todo/widget/menu.dart';
import 'package:desafio_todo/screens/feito.dart';
import 'package:desafio_todo/screens/naofeito.dart';
import 'package:desafio_todo/screens/tudo.dart';

import 'package:desafio_todo/data/database.dart';

void main() async {
  await Hive.initFlutter();
  var box = await Hive.openBox('mybox');
  runApp(ToDoApp());
}

class ToDoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App To Do',
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
    Center(child: Tudo()),
    Center(child: Feito()),
    Center(child: NaoFeito()),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('App To Do'),
            backgroundColor: Color(0xFF08415C),
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
