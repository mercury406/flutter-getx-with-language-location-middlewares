import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class QiblaActivity extends StatelessWidget {
  static const String route = "/qibla";

  final LatLng _startLocation = LatLng(41.301031, 69.270734);
  final LatLng _finalLocation = LatLng(21.42246980612687, 39.82614755630493);

  QiblaActivity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterMap(
        options: MapOptions(
          zoom: 12,
          center: _startLocation,
        ),
        layers: [
          TileLayerOptions(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c'],
          ),
          MarkerLayerOptions(
            rotate: false,
            markers: [
              Marker(
                  width: 80.0,
                  height: 80.0,
                  point: LatLng(41.301031, 69.270734),
                  builder: (ctx) => const Icon(Icons.man, size: 50),
                  rotate: true),
              Marker(
                  width: 80.0,
                  height: 80.0,
                  point: _finalLocation,
                  builder: (ctx) => const Icon(Icons.location_on_rounded, size: 50),
                  rotate: true),
            ],
          ),
          PolylineLayerOptions(polylines: [
            Polyline(
                points: [_startLocation, _finalLocation], color: Colors.green, strokeWidth: 4)
          ]),
        ],
      ),
    );
  }
}