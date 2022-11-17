import 'dart:convert';
import 'dart:developer';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:desafio_maps/api/ipclass.dart';

Future<Album> fetchAlbum(value) async {
  final response = await http.get(Uri.parse('http://ip-api.com/json/$value'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class IP extends StatefulWidget {
  const IP({super.key});

  @override
  State<IP> createState() => _IPState();
}

class _IPState extends State<IP> {
  late Future<Album> futureAlbum;

  TextEditingController ipController = TextEditingController();
  String ipValue = '';

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum(ipValue);
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
                        // If the form is valid, display a snackbar. In the real world,
                        // you'd often call a server or save the information in a database.
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processando Dados')),
                        );
                        setState(() {
                          futureAlbum = fetchAlbum(ipValue);
                        });
                      }
                    },
                    child: const Text('Enviar'),
                  ),
                ),
                FutureBuilder<Album>(
                  future: futureAlbum,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text(
                          '${snapshot.data!.status} ${snapshot.data!.city} ${snapshot.data!.isp}');
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }

                    return const CircularProgressIndicator();
                  },
                ),
              ],
            ),
          )),
      Container(
        margin: const EdgeInsets.all(20),
        child: Text(ipValue),
      ),
    ]));
  }
}
