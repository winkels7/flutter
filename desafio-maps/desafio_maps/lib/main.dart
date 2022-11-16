// import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';

import 'package:desafio_maps/widget/menu.dart';
import 'package:desafio_maps/screens/ip.dart';
import 'package:desafio_maps/screens/trace.dart';
import 'package:desafio_maps/screens/help.dart';

void main() async {
  runApp(const AppMaps());
}

class AppMaps extends StatelessWidget {
  const AppMaps({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App Maps',
      home: TabLayoutExample(),
    );
  }
}

class TabLayoutExample extends StatefulWidget {
  const TabLayoutExample({super.key});

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

  static final List<Widget> _views = [
    const Center(child: IP()),
    const Center(child: Trace()),
    const Center(child: Help()),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('App Maps'),
            backgroundColor: const Color(0xFF698F3F),
          ),
          bottomNavigationBar: const Menu(),
          body: TabBarView(
            children: _views,
          ),
        ),
      ),
    );
  }
}
