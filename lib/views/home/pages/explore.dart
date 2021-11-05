import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as latlng;
import '../../../services/geolocation.dart';
import 'package:geolocator/geolocator.dart';

class Explore extends StatelessWidget {
  const Explore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Future<Position> p = determinePosition();

    return FlutterMap(
      options: MapOptions(
        center: latlng.LatLng(35.6987, 0.6349),
        zoom: 13.0,
      ),
      layers: [
        TileLayerOptions(
          urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
          subdomains: ['a', 'b', 'c'],
        ),
      ],
    );
  }
}
