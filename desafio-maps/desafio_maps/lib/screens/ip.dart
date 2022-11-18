// import 'dart:convert';
import 'dart:async';

// import 'package:desafio_maps/screens/trace.dart';
import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
import 'package:desafio_maps/api/ipclass.dart';

import '../main.dart';

class IP extends StatefulWidget {
  const IP({super.key});

  @override
  State<IP> createState() => _IPState();
}

class _IPState extends State<IP> {
  late Future<IPData> ipData;

  final myController = TextEditingController();
  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

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
          margin: const EdgeInsets.fromLTRB(20, 20, 20, 10),
          child: const Text(
            "Pesquisa por IP",
            style: TextStyle(fontSize: 24),
          )),
      Container(
          margin: const EdgeInsets.all(15),
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
                  padding: const EdgeInsets.symmetric(vertical: 14.0),
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
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => Trace(lat: snapshot.data!.lat),
            //   ),
            // );
            return Column(children: <Widget>[
              SizedBox(
                  width: 250,
                  height: 30,
                  child: Text('IP: ${snapshot.data!.query}',
                      style: const TextStyle(fontSize: 16))),
              SizedBox(
                  width: 250,
                  height: 30,
                  child: Text('País: ${snapshot.data!.country}',
                      style: const TextStyle(fontSize: 16))),
              SizedBox(
                  width: 250,
                  height: 30,
                  child: Text('Região: ${snapshot.data!.region}',
                      style: const TextStyle(fontSize: 16))),
              SizedBox(
                  width: 250,
                  height: 30,
                  child: Text('Cidade: ${snapshot.data!.city}',
                      style: const TextStyle(fontSize: 16))),
              SizedBox(
                  width: 250,
                  height: 30,
                  child: Text('Provedor: ${snapshot.data!.isp}',
                      style: const TextStyle(fontSize: 16))),
              SizedBox(
                  width: 250,
                  height: 30,
                  child: Text('Latitude: ${snapshot.data!.lat}',
                      style: const TextStyle(fontSize: 16))),
              SizedBox(
                  width: 250,
                  height: 30,
                  child: Text('Longitude: ${snapshot.data!.lon}',
                      style: const TextStyle(fontSize: 16))),
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
