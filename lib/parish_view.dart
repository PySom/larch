import 'package:flutter/material.dart';
import 'parish_detail.dart';
import 'my_map.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ParishViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            child: MyMap(
              center: const LatLng(6.4499, 3.3966),
            ),
          ),
        ],
      ),
    );
  }
}
