import 'dart:convert';
import 'dart:developer';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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

class Album {
  final String status;
  final String city;
  final String isp;

  const Album({
    required this.status,
    required this.city,
    required this.isp,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      status: json['status'],
      city: json['city'],
      isp: json['isp'],
    );
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
  //vars http

  chamadaAPI(value) async {
    log('valor recebido do form: $value');
    var url = Uri.http('ip-api.com', '/json/$value');
    var response = await http.post(url);
    // var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
    log('status: $response.statusCode');
    log(response.body);
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
                      // Validate returns true if the form is valid, or false otherwise.
                      if (_formKey.currentState!.validate()) {
                        // If the form is valid, display a snackbar. In the real world,
                        // you'd often call a server or save the information in a database.
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processando Dados')),
                        );
                        chamadaAPI(ipValue);
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
                      return Text(snapshot.data!.city);
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }

                    // By default, show a loading spinner.
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
