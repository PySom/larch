import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyMap extends StatefulWidget {
  final LatLng center;
  MyMap({this.center});
  @override
  _MyAppState createState() => _MyAppState(center);
}

class _MyAppState extends State<MyMap> {
  GoogleMapController mapController;
  //final LatLng _center = const LatLng(45.521563, -122.677433);
  final LatLng center;
  Set<Marker> markers = Set();
  _MyAppState(this.center);
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  void initState() {
    markers.add(Marker(
      markerId: MarkerId('churchSent'),
      position: center,
      draggable: false,
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: center,
          zoom: 12.0,
        ),
        markers: markers,
      ),
    );
  }
}
