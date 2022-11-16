import 'package:flutter/material.dart';

class IP extends StatefulWidget {
  IP({super.key});

  @override
  State<IP> createState() => _IPState();
}

class _IPState extends State<IP> {
  TextEditingController ipController = TextEditingController();
  String ipValue = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Center(
              child: Column(children: <Widget>[
        Container(
            margin: EdgeInsets.all(20),
            child: Text(
              "Pesquisa por IP",
              style: TextStyle(fontSize: 24),
            )),
        Container(
            margin: EdgeInsets.all(20),
            child: TextField(
              controller: ipController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'IP',
              ),
              onChanged: (text) {
                setState(() {
                  ipValue = text;
                  //you can access ipController in its scope to get
                  // the value of text entered as shown below
                  //ipValue = ipController.text;
                });
              },
            )),
        Container(
          margin: EdgeInsets.all(20),
          child: Text(ipValue),
        )
      ]))),
    );
  }
}
