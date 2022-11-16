import 'package:flutter/material.dart';

class Trace extends StatefulWidget {
  Trace({super.key});

  @override
  State<Trace> createState() => _TraceState();
}

class _TraceState extends State<Trace> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.fromLTRB(5, 5, 5, 10),
        child: Text("Trace"),
      ),
    );
  }
}
