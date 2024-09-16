import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart'; // Note: Import latlong2 package
import 'package:perspektiva/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;

class OSMMap extends StatefulWidget {
  const OSMMap(
      {required this.initialLocation,
      required this.perspektivaLocation,
      required this.dificulty});
  final LatLng initialLocation;
  final LatLng? perspektivaLocation;
  final int? dificulty;

  _OSMMapState createState() => _OSMMapState();
}

class _OSMMapState extends State<OSMMap> {
  LatLng? get initialLocation => widget.initialLocation;
  LatLng? get perspektivaLocation => widget.perspektivaLocation;
  int? get dificulty => widget.dificulty;

  late LatLng? currentMapCenter;
  late LatLng circleLocation;
  late double radius;

  @override
  void initState() {
    super.initState();
    currentMapCenter = initialLocation;
    circleLocation = perspektivaLocation!;
    radius = functions.getRadiusBasedOnDifficulty(dificulty!);
  }

  @override
  void didUpdateWidget(OSMMap oldWidget) {
    super.didUpdateWidget(oldWidget);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('OpenStreetMap Example')),
      body: FlutterMap(
        options: MapOptions(
          center: currentMapCenter,
          zoom: 16.0,
          onPositionChanged: (MapPosition position, bool hasGesture) {
            if (hasGesture) {
              _restrictMovement(position.center!);
            }
          },
        ),
        children: [
          TileLayer(
            /*"https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"*/
            urlTemplate:
                'https://api.maptiler.com/maps/outdoor-v2/{z}/{x}/{y}.png?key=fU8jur6oLqkKP5oV2caY',
            subdomains: ['a', 'b', 'c'],
            // Replace 'attributionBuilder' with 'attribution' or handle attribution manually
            //attribution: Text("© OpenStreetMap contributors"), TODO: FIX ATTRIBUTIONS ACCORDING TO THE GUIDELINES
          ),
          CircleLayer(
            circles: [
              CircleMarker(
                point: circleLocation,
                color: Colors.blue.withOpacity(0.3),
                borderStrokeWidth: 1,
                useRadiusInMeter: true,
                radius: radius,
              ),
            ],
          ),
          /*
          MarkerLayer(
            markers: [
              Marker(
                width: 80.0,
                height: 80.0,
                point: currentMapCenter!,
                builder: (ctx) => Icon(
                  Icons.location_pin,
                  color: Colors.red,
                  size: 40,
                ),
              ),
            ],
          ),
*/
        ],
      ),
    );
  }

  void _restrictMovement(LatLng newPosition) {
    if (circleLocation != null && radius != null) {
      final bool isInsideCircle = functions.isPointInsideCircel(
        circleLocation!,
        newPosition,
        dificulty!,
      );

      if (!isInsideCircle) {
        // Calculate the closest point within the circle to the new position
        final Distance distance = Distance();
        final double distanceToCenter =
            distance.as(LengthUnit.Meter, circleLocation!, newPosition);

        final double bearing = distance.bearing(circleLocation!, newPosition);

        // Calculate the point on the circle's edge that is closest to the newPosition
        final LatLng closestPoint =
            distance.offset(circleLocation!, radius!, bearing);

        // Set the map center to the closest point within the circle
        setState(() {
          currentMapCenter = closestPoint;
        });
      } else {
        setState(() {
          currentMapCenter = newPosition;
        });
      }
    }
  }

  double calculateDistance(LatLng point1, LatLng point2) {
    final Distance distance = Distance();
    return distance.as(LengthUnit.Meter, point1, point2);
  }
}
