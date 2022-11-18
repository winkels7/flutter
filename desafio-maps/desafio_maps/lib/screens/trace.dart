import 'package:flutter/material.dart';

import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Trace extends StatefulWidget {
  Trace({super.key, required this.lat});

  var lat = 37.42796133580664;
  var lon = -122.085749655962;

  @override
  State<Trace> createState() => _TraceState();
}

class _TraceState extends State<Trace> {
  Completer<GoogleMapController> _controller = Completer();
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    widget.lat;
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
        child: const Icon(Icons.gps_fixed_sharp),
        backgroundColor: Color.fromARGB(255, 44, 207, 79),
        onPressed: () {
          _goToTheLake();
        },
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
