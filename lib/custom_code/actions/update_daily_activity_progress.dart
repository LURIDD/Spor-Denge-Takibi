// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

Future updateDailyActivityProgress() async {
  // 1. Get Current User
  final userRef = currentUserReference;
  if (userRef == null) return;

  // 2. Calculate Daily Progress (Ratio)
  final userGoalsQuery = await userRef.collection('UserGoals').get();
  final userGoals =
      userGoalsQuery.docs.map((d) => UserGoalsRecord.fromSnapshot(d)).toList();

  double progressRatio = 0.0;
  if (userGoals.isNotEmpty) {
    int completedCount = userGoals.where((g) => g.isCompleted).length;
    progressRatio = completedCount / userGoals.length;
  }

  // 3. Get or Create UserActivities Record
  final userActivitiesQuery = await userRef.collection('user_activities').get();
  UserActivitiesRecord? activityRecord;
  DocumentReference? activityRef;

  List<double> dailyValues = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0];
  DateTime? lastSeriesDate;
  bool dataSanitized = false;

  if (userActivitiesQuery.docs.isNotEmpty) {
    activityRecord =
        UserActivitiesRecord.fromSnapshot(userActivitiesQuery.docs.first);
    activityRef = activityRecord.reference;

    // Load existing values, ensure length is 7
    if (activityRecord.dailyValues.isNotEmpty) {
      // Take last 7 or pad
      List<double> loaded = List.from(activityRecord.dailyValues);

      // SANITIZATION: Fix existing bad data (vals > 1.0)
      for (int i = 0; i < loaded.length; i++) {
        if (loaded[i] > 1.0) {
          dataSanitized = true; // Mark that we modified data
          // If stored as percentage (e.g. 50.0), convert to 0.5. Else clamp.
          if (loaded[i] <= 100.0) {
            loaded[i] /= 100.0;
          } else {
            loaded[i] = 1.0;
          }
        }
      }

      if (loaded.length < 7) {
        // Pad with leading zeros
        final padding = List<double>.filled(7 - loaded.length, 0.0);
        dailyValues = [...padding, ...loaded];
      } else if (loaded.length > 7) {
        dailyValues = loaded.sublist(loaded.length - 7);
      } else {
        dailyValues = loaded;
      }
    }
    lastSeriesDate = activityRecord.lastSeriesDate;
  } else {
    // Create new if not exists
    final newDoc = userRef.collection('user_activities').doc();
    activityRef = newDoc;
    // We will set data at the end
  }

  // 4. Update Logic based on Date
  DateTime now = DateTime.now();
  DateTime today = DateTime(now.year, now.month, now.day);
  DateTime? lastDate = lastSeriesDate != null
      ? DateTime(lastSeriesDate.year, lastSeriesDate.month, lastSeriesDate.day)
      : null;

  bool shouldUpdate = true;

  if (lastDate == null) {
    // First time ever: set today's value at the end
    dailyValues[6] = progressRatio;
  } else {
    int diff = today.difference(lastDate).inDays;

    if (diff == 0) {
      // Same day
      // OPTIMIZATION: Check if value actually changed
      // BUT if we sanitized old data, we MUST update
      if (!dataSanitized && (dailyValues[6] - progressRatio).abs() < 0.01) {
        shouldUpdate = false;
      }
      dailyValues[6] = progressRatio;
    } else if (diff > 0) {
      // New day(s) have passed
      if (diff >= 7) {
        // Gap is too large, reset everything to 0 except today
        dailyValues = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, progressRatio];
      } else {
        // Shift left for each passing day
        for (int i = 0; i < diff - 1; i++) {
          dailyValues.removeAt(0);
          dailyValues.add(0.0);
        }
        // Add today
        dailyValues.removeAt(0);
        dailyValues.add(progressRatio);
      }
    }
  }

  // 5. Calculate Consistency
  // Average of the list * 100. Double check sum.
  double sum = dailyValues.reduce((a, b) => a + b);
  int consistency = ((sum / 7) * 100).round();
  if (consistency > 100) consistency = 100;

  // 6. Save to Firestore
  if (shouldUpdate) {
    final firestoreData = createUserActivitiesRecordData(
      userId: userRef.id,
      consistency: consistency,
      lastSeriesDate: today,
    );
    // Add dailyValues manually
    firestoreData['dailyValues'] = dailyValues;

    if (activityRef != null) {
      await activityRef.set(firestoreData, SetOptions(merge: true));
    }
  }
}
