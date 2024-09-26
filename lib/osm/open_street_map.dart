import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart'; // Note: Import latlong2 package
import 'package:perspektiva/flutter_flow/flutter_flow_util.dart';
import 'package:perspektiva/pages/perspektivas/submit_guess_2/submit_guess2_model.dart';
import '/flutter_flow/custom_functions.dart' as functions;

class OSMMap extends StatefulWidget {
  const OSMMap({
    required this.initialLocation,
    required this.perspektivaLocation,
    required this.difficulty,
    required this.onLocationChanged,
  });

  final LatLng initialLocation;
  final LatLng? perspektivaLocation;
  final int? difficulty;
  final void Function(LatLng newLocation) onLocationChanged;
  @override
  _OSMMapState createState() => _OSMMapState();
}

class _OSMMapState extends State<OSMMap> {
  LatLng? get initialLocation => widget.initialLocation;
  LatLng? get perspektivaLocation => widget.perspektivaLocation;
  int? get difficulty => widget.difficulty;

  late LatLng? markerLocation;
  late LatLng circleLocation;
  late double radius;

  late MapController _mapController;
  LatLng? _currentLocation;

  @override
  void initState() {
    super.initState();
    //_model = createModel(context, () => SubmitGuess2Model());

    markerLocation = initialLocation;
    circleLocation = initialLocation!;
    radius = functions.getRadiusBasedOnDifficulty(difficulty ?? 0);
  }

  void setCurrentLocation(LatLng latLng) {
    /*This passes data from map to parent widget*/
    setState(() {
      _currentLocation = latLng;
    });
    widget.onLocationChanged(latLng);
  }

  @override
  void didUpdateWidget(OSMMap oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialLocation != widget.initialLocation) {
      setState(() {
        markerLocation = widget.initialLocation;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('OpenStreetMap Example')),
      body: FlutterMap(
        options: MapOptions(
          center: markerLocation,
          zoom: 16.0,
          onPositionChanged: (MapPosition position, bool hasGesture) {
            if (hasGesture) {
              _restrictMovement(position.center!);
            }
          },
        ),
        children: [
          TileLayer(
            urlTemplate:
                'https://api.maptiler.com/maps/outdoor-v2/{z}/{x}/{y}.png?key=fU8jur6oLqkKP5oV2caY',
            subdomains: ['a', 'b', 'c'],
          ),
          CircleLayer(
            circles: [
              CircleMarker(
                point: circleLocation,
                color: const Color.fromARGB(255, 243, 33, 68).withOpacity(0.3),
                borderColor: Colors.black,
                borderStrokeWidth: 1,
                useRadiusInMeter: true,
                radius: radius,
              ),
              CircleMarker(
                /*TODO: REMOVE! DEV HELP ONLY!*/
                point: perspektivaLocation!,
                color: const Color.fromARGB(255, 33, 243, 75).withOpacity(0.3),
                borderColor: Colors.black,
                borderStrokeWidth: 1,
                useRadiusInMeter: true,
                radius: radius,
              ),
            ],
          ),
          MarkerLayer(
            markers: [
              Marker(
                width: 80.0,
                height: 80.0,
                point: markerLocation!,
                builder: (ctx) => GestureDetector(
                  onPanUpdate: (details) {
                    // Convert the drag details to a new LatLng position
                    final newPosition = _calculateNewPosition(details);
                    _restrictMovement(newPosition);
                  },
                  child: Icon(
                    Icons.location_pin,
                    color: Colors.red,
                    size: 40,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _restrictMovement(LatLng newPosition) {
    if (circleLocation != null && radius != null) {
      final bool isInsideCircle = functions.isPointInsideCircel(
        circleLocation,
        newPosition,
        difficulty ?? 0,
      );

      if (isInsideCircle) {
        setState(() {
          markerLocation = newPosition;
          setCurrentLocation(newPosition);
        });
      } else {
        // Calculate the closest point within the circle to the new position
        final Distance distance = Distance();
        final double bearing = distance.bearing(circleLocation, newPosition);

        // Calculate the point on the circle's edge that is closest to the newPosition
        final LatLng closestPoint =
            distance.offset(circleLocation, radius, bearing);

        // Set the map center to the closest point within the circle
        setState(() {
          markerLocation = closestPoint;
        });
      }
    }
  }

  LatLng _calculateNewPosition(DragUpdateDetails details) {
    // Implement the logic to convert drag details to a new LatLng position
    // This is a placeholder implementation and should be replaced with actual logic
    return LatLng(
      markerLocation!.latitude + details.delta.dy * 0.0001,
      markerLocation!.longitude + details.delta.dx * 0.0001,
    );
  }

  double calculateDistance(LatLng point1, LatLng point2) {
    final Distance distance = Distance();
    return distance.as(LengthUnit.Meter, point1, point2);
  }
}
