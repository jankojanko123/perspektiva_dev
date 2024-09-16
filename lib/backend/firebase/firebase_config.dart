import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDb6eDvyBSa6far-ojFIzN7bLX8Xcn_8uo",
            authDomain: "perspektiva-app.firebaseapp.com",
            projectId: "perspektiva-app",
            storageBucket: "perspektiva-app.appspot.com",
            messagingSenderId: "336363186539",
            appId: "1:336363186539:web:3038ef39ce7ec679aec42e",
            measurementId: "G-8V549L3L5D"));
  } else {
    await Firebase.initializeApp();
  }
}
