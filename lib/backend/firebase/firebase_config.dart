import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDTY9oFHA9G3DQcHbe1h90N87crT3Gghng",
            authDomain: "dengele-ov4aur.firebaseapp.com",
            projectId: "dengele-ov4aur",
            storageBucket: "dengele-ov4aur.firebasestorage.app",
            messagingSenderId: "588228047702",
            appId: "1:588228047702:web:73c9e4f5fd9f993be05cf7",
            measurementId: "G-X7Y7HQFVCB"));
  } else {
    await Firebase.initializeApp();
    FirebaseFirestore.instance.settings =
        const Settings(persistenceEnabled: true);
  }
}
