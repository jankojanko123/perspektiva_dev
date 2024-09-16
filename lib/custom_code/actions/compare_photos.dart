// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:image_compare/image_compare.dart';
import 'package:http/http.dart' as http;

Future<double> comparePhotos(
  String photoUrlOg,
  String photoUrlGuess,
) async {
  photoUrlOg =
      'https://firebasestorage.googleapis.com/v0/b/perspektiva-app.appspot.com/o/users%2FuunYOzTFQlURhXD4GasbsbHRM9P2%2Fuploads%2F1717759618055000.jpg?alt=media&token=2f194042-3061-452e-bebd-491ab842464d';
  photoUrlGuess =
      'https://firebasestorage.googleapis.com/v0/b/perspektiva-app.appspot.com/o/users%2FuunYOzTFQlURhXD4GasbsbHRM9P2%2Fuploads%2F1717759618055000.jpg?alt=media&token=2f194042-3061-452e-bebd-491ab842464d';

  double result = await comparePhotosInnerFunction(photoUrlOg, photoUrlGuess);
  print('Comparison result: $result');

  return result;
}

Future<double> comparePhotosInnerFunction(
  String photoUrlOg,
  String photoUrlGuess,
) async {
  print('Original Photo URL: $photoUrlOg');
  print('Guess Photo URL: $photoUrlGuess');

  // Check if URLs are reachable
  try {
    final responseOg = await http.get(Uri.parse(photoUrlOg));
    final responseGuess = await http.get(Uri.parse(photoUrlGuess));

    if (responseOg.statusCode != 200 || responseGuess.statusCode != 200) {
      print('One of the images could not be fetched.');
      return 0;
    }
  } catch (e) {
    print('Error fetching images: $e');
    return 0;
  }

  var networkResult = null;
  try {
    networkResult = await compareImages(
      src1: Uri.parse(photoUrlOg),
      src2: Uri.parse(photoUrlGuess),
      algorithm: ChiSquareDistanceHistogram(),
    );
  } catch (e) {
    print('Error comparing images: $e');
    return 0;
  }

  print('Difference: ${networkResult * 100}%');
  return networkResult;
}
// End custom action code
