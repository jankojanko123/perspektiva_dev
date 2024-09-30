import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart'; // Note: Import latlong2 package
import 'package:perspektiva/flutter_flow/flutter_flow_util.dart';
import 'package:perspektiva/pages/perspektivas/submit_guess_2/submit_guess2_model.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:perspektiva/font/font_test_icons.dart';

class OSMMap extends StatefulWidget {
  const OSMMap({
    required this.initialLocation,
    required this.perspektivaLocation,
    required this.difficulty,
    required this.terrain_difficulty,
    required this.latlongMarkerList,
    required this.onLocationChanged,
  });

  final LatLng initialLocation;
  final LatLng? perspektivaLocation;
  final int? difficulty;
  final int? terrain_difficulty;
  final List<LatLng> latlongMarkerList; //List<LatLng> _LatLngList = [];
  final void Function(LatLng newLocation) onLocationChanged;
  @override
  _OSMMapState createState() => _OSMMapState();
}

class _OSMMapState extends State<OSMMap> {
  LatLng? get initialLocation => widget.initialLocation;
  LatLng? get perspektivaLocation => widget.perspektivaLocation;

  int? get difficulty => widget.difficulty;
  int? get terrain_difficulty => widget.terrain_difficulty;

  List<LatLng>? get latlongMarkerList => widget.latlongMarkerList;

  late LatLng? markerLocation;
  late LatLng circleLocation;
  late double radius_selectorBoundryField;
  late double radius_perspektivaBoundryField;

  late Color circleBorderColor = const Color.fromARGB(255, 33, 43, 216);

  late MapController _mapController;
  LatLng? _currentLocation;

  @override
  void initState() {
    super.initState();
    //_model = createModel(context, () => SubmitGuess2Model());

    markerLocation = initialLocation;
    circleLocation = initialLocation!;

    radius_selectorBoundryField = functions.calculateRadius(
        difficulty ?? 1, terrain_difficulty ?? 1, true);
    radius_perspektivaBoundryField = functions.calculateRadius(
        difficulty ?? 1, terrain_difficulty ?? 1, false);

    _mapController = MapController();

    // Pan to the initial location on initial load
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _mapController.move(initialLocation!, 16.0);
    });
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
      body: FlutterMap(
        mapController: _mapController,
        options: MapOptions(
          center: markerLocation,
          zoom: 1.0,
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
                borderColor: circleBorderColor,
                borderStrokeWidth: 3,
                useRadiusInMeter: true,
                radius: radius_selectorBoundryField,
              ),
              CircleMarker(
                /*TODO: REMOVE! DEV HELP ONLY!*/
                point: perspektivaLocation!,
                color: const Color.fromARGB(255, 33, 243, 75).withOpacity(0.3),
                borderColor: Colors.black,
                borderStrokeWidth: 1,
                useRadiusInMeter: true,
                radius: radius_perspektivaBoundryField,
              ),
            ],
          ),
          MarkerLayer(
            markers: [
              if (latlongMarkerList != null)
                ...latlongMarkerList!.map((latLng) => Marker(
                      width: 80.0,
                      height: 80.0,
                      point: latLng,
                      builder: (ctx) => GestureDetector(
                          onPanUpdate: (details) {
                            // Convert the drag details to a new LatLng position
                            final newPosition = _calculateNewPosition(details);
                            _restrictMovement(newPosition);
                          },
                          child: Icon(
                            Icons.circle,
                            color: Color.fromARGB(255, 12, 40, 152),
                            size: 7,
                            weight: 0.1,
                          )),
                    )),
              Marker(
                width: 80.0,
                height: 80.0,
                point: markerLocation!,
                anchorPos: AnchorPos.exactly(Anchor(
                    62.0, 64.0)), // Adjust the anchor position by 5 pixels,
                builder: (ctx) => GestureDetector(
                  onPanUpdate: (details) {
                    // Convert the drag details to a new LatLng position
                    final newPosition = _calculateNewPosition(details);
                    _restrictMovement(newPosition);
                  },
                  child: Icon(
                    FontTest.pointer_svgrepo_com,
                    color: const Color.fromARGB(255, 104, 4, 192),
                    size: 55,
                    shadows: [
                      Shadow(
                        offset: Offset(-1.0, 3.0),
                        blurRadius: 2.0,
                        color: Color.fromARGB(128, 0, 0, 0),
                      ),
                    ],
                  ),
                ),
              ),
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
                      Icons.data_saver_on_sharp,
                      color: Color.fromARGB(255, 0, 0, 0),
                      size: 5,
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _restrictMovement(LatLng newPosition) {
    if (circleLocation != null && radius_selectorBoundryField != null) {
      final bool isInsideCircle = functions.isPointInsideCircel(
        circleLocation,
        newPosition,
        radius_selectorBoundryField,
      );

      if (isInsideCircle) {
        setState(() {
          markerLocation = newPosition;
          setCurrentLocation(newPosition);
          circleBorderColor = const Color.fromARGB(255, 33, 43, 216);
        });
      } else {
        // Calculate the closest point within the circle to the new position
        final Distance distance = Distance();
        final double bearing = distance.bearing(circleLocation, newPosition);

        // Calculate the point on the circle's edge that is closest to the newPosition
        final LatLng closestPoint = distance.offset(
            circleLocation, radius_selectorBoundryField, bearing);

        // Set the map center to the closest point within the circle
        setState(() {
          markerLocation = closestPoint;
          circleBorderColor = Colors.red;
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

  void _zoomIn() {
    final zoom = _mapController.zoom + 1;
    _mapController.move(_mapController.center, zoom);
  }
}
