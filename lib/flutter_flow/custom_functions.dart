import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:latlong2/latlong.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

import 'package:latlong2/latlong.dart'; // Note: Import latlong2 package

String returnProfileGreeting(DateTime timestamp) {
  // return "morning" if it is morning, "afternoon" if afternoon and "night" if it is night
  var hour = timestamp.hour;
  if (hour >= 0 && hour < 12) {
    return "Good morning";
  } else if (hour >= 12 && hour < 17) {
    return "Good afternoon";
  } else {
    return "Goodnight";
  }
}

double getRadiusBasedOnDifficulty(int difficulty) {
  double radius = 100;

  switch (difficulty) {
    case 1:
      radius = 50;
      break;
    case 2:
      radius = 30;
      break;
    case 3:
      radius = 25;
      break;
    case 2:
      radius = 15;
      break;
    case 1:
      radius = 10;
  }

  return radius;
}

bool isPointInsideCircel(
  LatLng? perspektivaLocation,
  LatLng? guessLocation,
  int? difficulty,
) {
  double radius = getRadiusBasedOnDifficulty(difficulty!);

  final distance = distanceInMeters(guessLocation!, perspektivaLocation!);
  return distance < radius;
}

double distanceInMeters(
  LatLng perspektivaLocation,
  LatLng guessLocation,
) {
// Haversine formula to calculate distance between two LatLng points

  // Calculate difference in latitude and longitude (in radians)
  final double latitudeDifference =
      degreesToRadians(guessLocation.latitude - perspektivaLocation.latitude);
  final double longitudeDifference =
      degreesToRadians(guessLocation.longitude - perspektivaLocation.longitude);

  // Intermediate calculation
  final double a =
      math.sin(latitudeDifference / 2) * math.sin(latitudeDifference / 2) +
          math.cos(degreesToRadians(perspektivaLocation.latitude)) *
              math.cos(degreesToRadians(guessLocation.latitude)) *
              math.sin(longitudeDifference / 2) *
              math.sin(longitudeDifference / 2);

  // Calculate angular distance
  final double c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));

  // Earth radius in meters (replace with your desired earth radius if needed)
  final double earthRadius = 6371e3;

  return c * earthRadius;
}

double degreesToRadians(double deg) {
  return deg * (math.pi / 180);
}

LatLng? getLatLngFromString(String? input) {
  if (input == null) {
    return LatLng(0.0, 0.0);
  }
  final parts = input.split(',');
  return LatLng(double.parse(parts[0]), double.parse(parts[1]));
}

/*
// Conversion function: flutter_flow.LatLng to google_maps_flutter.LatLng
googleMapsLatLng.LatLng convertToGoogleLatLng(flutterFlowLatLng.LatLng latLng) {
  return googleMapsLatLng.LatLng(latLng.latitude, latLng.longitude);
}

// Similarly, if you need to convert in the opposite direction:
flutterFlowLatLng.LatLng convertToFlutterFlowLatLng(
    googleMapsLatLng.LatLng latLng) {
  return flutterFlowLatLng.LatLng(latLng.latitude, latLng.longitude);
}
*/
/*
LatLng restrictMovement(LatLng newPosition) {
  double distance = calculateDistance(circleCenter!, newPosition);
  if (distance <= circleRadius) {
    return newPosition;
  } else {
    final bearing = atan2(
      newPosition.longitude - circleCenter!.longitude,
      newPosition.latitude - circleCenter!.latitude,
    );
    final restrictedLat = circleCenter!.latitude +
        (circleRadius / 6371000) * cos(bearing) * (180 / pi);
    final restrictedLng = circleCenter!.longitude +
        (circleRadius / 6371000) *
            sin(bearing) *
            (180 / pi) /
            cos(circleCenter!.latitude * (pi / 180));
    return LatLng(restrictedLat, restrictedLng);
  }
}

double calculateDistance(LatLng point1, LatLng point2) {
  const earthRadius = 6371000; // meters
  final dLat = (point2.latitude - point1.latitude) * (pi / 180);
  final dLng = (point2.longitude - point1.longitude) * (pi / 180);
  final a = sin(dLat / 2) * sin(dLat / 2) +
      cos(point1.latitude * (pi / 180)) *
          cos(point2.latitude * (pi / 180)) *
          sin(dLng / 2) *
          sin(dLng / 2);
  final c = 2 * atan2(sqrt(a), sqrt(1 - a));
  return earthRadius * c;
}
*/