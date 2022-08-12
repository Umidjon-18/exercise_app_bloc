import 'package:exercise_app/utils/contants.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapPage extends StatefulWidget {
  const GoogleMapPage({Key? key}) : super(key: key);

  @override
  State<GoogleMapPage> createState() => _GoogleMapPageState();
}

class _GoogleMapPageState extends State<GoogleMapPage> {
  static const LatLng sourceLocation = LatLng(40.366586, 71.778596);
  static const LatLng destination = LatLng(40.366586, 71.778596);
  static const _initialCameraPosition = CameraPosition(
    target: sourceLocation,
    zoom: 16,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Umidjon's Map"),
        backgroundColor: Constants.bottomNavBarColor,
      ),
      body: SafeArea(
        child: GoogleMap(
          mapType: MapType.satellite,
          initialCameraPosition: _initialCameraPosition,
          markers: {
            const Marker(markerId: MarkerId('SimplSolution'), position: destination)
          },
        ),
      ),
    );
  }
}
