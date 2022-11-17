import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';

// import 'package:/desafio_maps/api/http_service.dart';
// import 'package:/desafio_maps/api/post_model.dart';
import 'package:http/http.dart' as http;
import 'package:desafio_maps/api/ipclass.dart';

class IP extends StatefulWidget {
  const IP({super.key});

  @override
  State<IP> createState() => _IPState();
}

class _IPState extends State<IP> {
  TextEditingController ipController = TextEditingController();
  String ipValue = '';

  final _formKey = GlobalKey<FormState>();

  // ignore: non_constant_identifier_names
  List<IpTimer> IpTimerFromJson(String str) =>
      List<IpTimer>.from(json.decode(str).map((x) => IpTimer.fromJson(x)));

  Future<List<IpTimer>> _chamadaAPI(value) async {
    var url = 'http://ip-api.com/json/$value';
    log(url);

    List<IpTimer> result;

    var response = await http.post(Uri.parse(url));

    if (response.statusCode == HttpStatus.ok) {
      result = IpTimerFromJson(response.body);
      log('ok!');
      log(response.body);
    } else {
      log('Algo deu errado');
      result = IpTimerFromJson(response.body);
      log(response.body);
    }
    return result;
  }

  // chamadaAPI(value) async {
  //   log('valor recebido do form: $value');
  //   var url = Uri.http('ip-api.com', '/json/$value');
  //   var response = await http.post(url);
  //   // var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
  //   log('status: $response.statusCode');
  //   log(response.body);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
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
              mainAxisSize: MainAxisSize.min,
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
                        _chamadaAPI(ipValue);
                      }
                    },
                    child: const Text('Enviar'),
                  ),
                ),
              ],
            ),
          )),
      Scaffold(
          body: FutureBuilder<List<IpTimer>>(
              future: _chamadaAPI(ipValue),
              builder: (BuildContext context,
                  AsyncSnapshot<List<IpTimer>> snapshot) {
                return snapshot.hasData
                    ? ListView.builder(
                        itemCount: 1,
                        itemBuilder: (context, index) {
                          return Card(
                            elevation: 5.0,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                            ),
                            color: Colors.white,
                            margin: const EdgeInsets.all(0),
                            child: Text(snapshot.data![index].city),
                          );
                        },
                      )
                    : const Text('Nao tem info ainda');
              })),
    ]));
  }
}
