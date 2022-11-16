import 'package:flutter/material.dart';

class Help extends StatefulWidget {
  Help({super.key});

  @override
  State<Help> createState() => _HelpState();
}

class _HelpState extends State<Help> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.fromLTRB(5, 5, 5, 10),
        child: Text("Help"),
      ),
    );
  }
}
