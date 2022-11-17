import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:desafio_maps/api/ipclass.dart';

Future<IPData> chamadaAPI(value) async {
  final response = await http.get(Uri.parse('http://ip-api.com/json/$value'));

  if (response.statusCode == 200) {
    return IPData.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Falha ao carregar informações');
  }
}

class IP extends StatefulWidget {
  const IP({super.key});

  @override
  State<IP> createState() => _IPState();
}

class _IPState extends State<IP> {
  late Future<IPData> ipData;

  TextEditingController ipController = TextEditingController();
  String ipValue = '';

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    ipData = chamadaAPI(ipValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: <Widget>[
      Container(
          margin: const EdgeInsets.all(20),
          child: const Text(
            "Pesquisa por IP",
            style: TextStyle(fontSize: 24),
          )),
      Container(
          margin: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          value.contains(RegExp(r'[A-Z]'))) {
                        return 'Por gentileza, insira um IP';
                      }
                      return null;
                    },
                    onChanged: (text) {
                      setState(() {
                        ipValue = text;
                      });
                    }),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processando Dados')),
                        );
                        setState(() {
                          ipData = chamadaAPI(ipValue);
                        });
                      }
                    },
                    child: const Text('Enviar'),
                  ),
                ),
              ],
            ),
          )),
      FutureBuilder<IPData>(
        future: ipData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(children: <Widget>[
              Container(
                  width: 250,
                  height: 30,
                  child: Text('IP: ${snapshot.data!.query}',
                      style: TextStyle(fontSize: 16))),
              Container(
                  width: 250,
                  height: 30,
                  child: Text('País: ${snapshot.data!.country}',
                      style: TextStyle(fontSize: 16))),
              Container(
                  width: 250,
                  height: 30,
                  child: Text('Região: ${snapshot.data!.region}',
                      style: TextStyle(fontSize: 16))),
              Container(
                  width: 250,
                  height: 30,
                  child: Text('Cidade: ${snapshot.data!.city}',
                      style: TextStyle(fontSize: 16))),
              Container(
                  width: 250,
                  height: 30,
                  child: Text('Provedor: ${snapshot.data!.isp}',
                      style: TextStyle(fontSize: 16))),
            ]);
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const CircularProgressIndicator();
        },
      ),
    ]));
  }
}
