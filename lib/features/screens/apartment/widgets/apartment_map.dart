import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../../../../utils/constants/custom_sizes.dart';

class ApartmentMap extends StatelessWidget {
  const ApartmentMap({
    super.key,
    required this.currentLatLng,
  });

  final LatLng currentLatLng;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(Sizes.cardRadiusLg),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(Sizes.cardRadiusLg),
        child: FlutterMap(
          options: MapOptions(
            initialCenter: currentLatLng,
            initialZoom: 15,
          ),
          children: [
            TileLayer(
              urlTemplate:
                  "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
              userAgentPackageName:
                  "com.letto.letto",
            ),
            MarkerLayer(
              markers: [
                Marker(
                  point: currentLatLng,
                  width: 40,
                  height: 40,
                  child: const Icon(
                    Icons.location_pin,
                    size: 40,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
