// import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:desafio_todo/widget/floatBtn.dart';
import 'package:desafio_todo/widget/menu.dart';
import 'package:desafio_todo/screens/feito.dart';
import 'package:desafio_todo/screens/naofeito.dart';
import 'package:desafio_todo/screens/tudo.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('settings');
  runApp(ToDoApp());
}

class ToDoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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

  static const List<Widget> _views = [
    const Center(child: Tudo()),
    const Center(child: Feito()),
    const Center(child: NaoFeito()),
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
          body: const TabBarView(
            children: _views,
          ),
        ),
      ),
    );
  }
}
