// import 'package:desafio_maps/screens/ip.dart';
import 'dart:developer';

import 'package:flutter/material.dart';

import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../api/ipclass.dart';
import '../main.dart';

class Trace extends StatefulWidget {
  const Trace({super.key});

  @override
  State<Trace> createState() => _TraceState();
}

class _TraceState extends State<Trace> {
  late Future<IPData> ipData;

  final myController = TextEditingController();
  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  String ipValue = '';
  @override
  void initState() {
    super.initState();
    ipData = chamadaAPI(ipValue);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<IPData>(
        future: ipData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Completer<GoogleMapController> _controller = Completer();

            CameraPosition _kGooglePlex = CameraPosition(
              target: LatLng(snapshot.data!.lat, snapshot.data!.lon),
              zoom: 14.4746,
            );

            CameraPosition _ipCam = CameraPosition(
                bearing: 192.8334901395799,
                target: LatLng(snapshot.data!.lat, snapshot.data!.lon),
                tilt: 59.440717697143555,
                zoom: 19.151926040649414);

            Future<void> goToTheLake() async {
              final GoogleMapController controller = await _controller.future;
              controller.animateCamera(CameraUpdate.newCameraPosition(_ipCam));
            }

            return Scaffold(
              body: GoogleMap(
                padding: const EdgeInsets.all(20),
                mapType: MapType.hybrid,
                initialCameraPosition: _kGooglePlex,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              ),
              floatingActionButton: FloatingActionButton(
                backgroundColor: const Color.fromARGB(255, 44, 207, 79),
                onPressed: () {
                  goToTheLake();
                },
                child: const Icon(Icons.gps_fixed_sharp),
              ),
            );
          } else {
            log('Falha ao carregar informações');
            throw Exception('Falha ao carregar informações');
          }
        });
  }
}
