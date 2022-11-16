import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:http/http.dart';

class IP extends StatefulWidget {
  IP({super.key});

  @override
  State<IP> createState() => _IPState();
}

class _IPState extends State<IP> {
  TextEditingController ipController = TextEditingController();
  String ipValue = '';

  final _formKey = GlobalKey<FormState>();

  chamadaAPI(value) {
    log('valor: $value');
  }

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
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        value.contains(new RegExp(r'[A-Z]'))) {
                      return 'Por gentileza, insira um IP';
                    }
                    return null;
                  }, onChanged: (text) {
                    setState(() {
                      ipValue = text;
                    });
                  }),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        // Validate returns true if the form is valid, or false otherwise.
                        if (_formKey.currentState!.validate()) {
                          // If the form is valid, display a snackbar. In the real world,
                          // you'd often call a server or save the information in a database.
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Processando Dados')),
                          );
                          chamadaAPI(ipValue);
                        }
                      },
                      child: const Text('Enviar'),
                    ),
                  ),
                ],
              ),
            )),
        Container(
          margin: EdgeInsets.all(20),
          child: Text(ipValue),
        )
      ]))),
    );
  }
}
