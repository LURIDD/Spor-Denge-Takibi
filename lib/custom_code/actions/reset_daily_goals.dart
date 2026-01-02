import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

Future resetDailyGoals() async {
  // Add your function code here!
  final currentUser = currentUserReference;
  if (currentUser == null) return;

  final userDoc = await currentUser.get();
  final lastActiveTime = userDoc.data() is Map
      ? (userDoc.data() as Map)['last_active_time'] as Timestamp?
      : null;

  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);

  if (lastActiveTime != null) {
    final lastDate = lastActiveTime.toDate();
    final lastDay = DateTime(lastDate.year, lastDate.month, lastDate.day);

    if (lastDay.isAtSameMomentAs(today)) {
      // Already opened today, no reset needed
      // But we still update last_active_time to be current, just in case
      await currentUser.update({
        'last_active_time': FieldValue.serverTimestamp(),
      });
      return;
    }
  }

  // It's a new day (or first login), reset goals
  final goalsQuery = await FirebaseFirestore.instance
      .collection('users')
      .doc(currentUser.id)
      .collection('user_goals')
      .get();

  final batch = FirebaseFirestore.instance.batch();

  for (final doc in goalsQuery.docs) {
    batch.update(doc.reference, {'isCompleted': false});
  }

  // Also update last_active_time
  batch.update(currentUser, {
    'last_active_time': FieldValue.serverTimestamp(),
  });

  await batch.commit();
}
