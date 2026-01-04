// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future resetDailyGoals(DocumentReference userRef) async {
  final firestore = FirebaseFirestore.instance;

  // 1. Kullanıcının hedeflerini bul ve sıfırla
  final goalsQuery = await firestore
      .collection('UserGoals') // Koleksiyon adının 'goals' olduğundan emin ol
      .where('user_ref', isEqualTo: userRef)
      .get();

  final batch = firestore.batch();
  for (var doc in goalsQuery.docs) {
    batch.update(doc.reference, {'is_completed': false});
  }

  // 2. Kullanıcının adım verisini sıfırla ve tarihi güncelle
  batch.update(userRef, {
    'liveSteps': 0,
    'last_reset_date': FieldValue.serverTimestamp(),
  });

  await batch.commit();
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
