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

Future<bool?> perspektivaIsGuessedByThisUser(
  String? userUUID,
  String? perspektivaUUID,
) async {
  final firestore = FirebaseFirestore.instance;

  if (firestore != null) {
    print(userUUID);
    print(perspektivaUUID);

    // Query the collection to find a document with matching user and perspektiva
    final querySnapshot = await firestore
        .collection('perspektiva_user_guess')
        .where('user_uid', isEqualTo: userUUID)
        .where('perspektiva_uuid', isEqualTo: perspektivaUUID)
        .where('is_correct', isEqualTo: true)
        .get();

    print("Querring");
    print(querySnapshot.docs);
    // Check if any documents were found
    if (querySnapshot.docs.isNotEmpty) {
      print("Returned true");
      return true; // User has guessed this perspektiva
    } else {
      print("Returned false");
      return false; // User hasn't guessed this perspektiva
    }
  } else {
    print("Initialization is not working");
    return false; // Handle the case where firestore is null
  }

  return true;
}
