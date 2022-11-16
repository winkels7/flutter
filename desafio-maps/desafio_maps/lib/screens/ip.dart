import 'package:flutter/material.dart';

class IP extends StatefulWidget {
  IP({super.key});

  @override
  State<IP> createState() => _IPState();
}

class _IPState extends State<IP> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.fromLTRB(5, 5, 5, 10),
        child: Text("IP"),
      ),
    );
  }
}
