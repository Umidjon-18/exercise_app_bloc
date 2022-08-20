import 'package:exercise_app/utils/contants.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapPage extends StatefulWidget {
  const GoogleMapPage({required this.lat, required this.lng, Key? key}) : super(key: key);
  final double lat;
  final double lng;
  @override
  State<GoogleMapPage> createState() => _GoogleMapPageState();
}

class _GoogleMapPageState extends State<GoogleMapPage> {
  late LatLng sourceLocation;
  static const LatLng destination = LatLng(40.366586, 71.778596);
  late CameraPosition initialCameraPosition;

  @override
  void initState() {
    super.initState();
    sourceLocation = LatLng(widget.lat, widget.lng);
    initialCameraPosition = CameraPosition(
      target: sourceLocation,
      zoom: 16,
    );
  }

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
          initialCameraPosition: initialCameraPosition,
          markers: {const Marker(markerId: MarkerId('SimplSolution'), position: destination)},
        ),
      ),
    );
  }
}
