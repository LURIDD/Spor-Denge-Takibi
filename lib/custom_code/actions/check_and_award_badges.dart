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
import 'package:collection/collection.dart';

Future checkAndAwardBadges() async {
  // 1. Get current user reference
  final userRef = currentUserReference;
  if (userRef == null) return;

  // 2. Fetch all defined badges
  final badgesQuery =
      await FirebaseFirestore.instance.collection('badges').get();
  final badges =
      badgesQuery.docs.map((d) => BadgesRecord.fromSnapshot(d)).toList();

  if (badges.isEmpty) return;

  // 3. Fetch user's existing badges to prevent duplicate awarding
  final userBadgesQuery = await userRef.collection('UserBadges').get();
  final existingBadgeRefs = userBadgesQuery.docs
      .map((d) => UserBadgesRecord.fromSnapshot(d).badgeRef)
      .toSet();

  // 4. Fetch user's goals to check criteria
  // We need to check all goals to find relevant ones (Su, Egzersiz, etc.)
  final userGoalsQuery = await userRef.collection('UserGoals').get();
  final userGoals =
      userGoalsQuery.docs.map((d) => UserGoalsRecord.fromSnapshot(d)).toList();

  // 5. Fetch current user document to get Global Streak
  final userDocData = await userRef.get();
  final userDoc = UsersRecord.fromSnapshot(userDocData);

  for (final badge in badges) {
    if (existingBadgeRefs.contains(badge.reference)) {
      continue; // Already earned
    }

    bool requirementsMet = false;
    // targetDays determination
    int targetDays = 15; // Default fallback
    String name = badge.name.toLowerCase();
    String criteria = badge.criteria.toLowerCase();

    // Try to extract number from criteria
    final RegExp numRegExp = RegExp(r'(\d+)');
    final match = numRegExp.firstMatch(criteria);
    if (match != null) {
      targetDays = int.tryParse(match.group(1)!) ?? 15;
    }
    // Prefer explicitly set target if available and positive
    if (badge.target > 0) {
      targetDays = badge.target;
    }

    // --- LOGIC 1: GLOBAL STREAK CHECK ---
    // If badge is about "Seri" or "Streak"
    if (name.contains('seri') ||
        name.contains('streak') ||
        criteria.contains('seri') ||
        criteria.contains('streak')) {
      // Check Global User Streak
      // Use currentStreak, fallback to streak just in case
      final currentStreak =
          userDoc.currentStreak > 0 ? userDoc.currentStreak : userDoc.streak;

      if (currentStreak >= targetDays) {
        requirementsMet = true;
      }
    }
    // --- LOGIC 2: DYNAMIC GOAL MATCHING ---
    // Match Badge Name with User Goal Name
    else {
      // Find matching goal
      final matchingGoal = userGoals.firstWhereOrNull((goal) {
        final goalName = goal.goalName.toLowerCase();
        // Check unidirectional containment (simplified matching)
        return goalName.contains(name) || name.contains(goalName);
      });

      if (matchingGoal != null) {
        // If we matched a goal, check its streak
        // (Assuming most badges are about consistency/streak)
        if (matchingGoal.longestStreak >= targetDays) {
          requirementsMet = true;
        }
      }
      // Keep legacy fallback for very specific naming if strictly needed,
      // but dynamic matching should cover "Su" and "Egzersiz" cases too.
      // (e.g. badge 'Su Ustası' matches goal 'Su İçme')
    }

    // Award Badge if met
    if (requirementsMet) {
      final newBadgeData = createUserBadgesRecordData(
        badgeRef: badge.reference,
        status: 'unlocked',
        earnedTime: getCurrentTimestamp,
        currentProgress: targetDays, // Completed
      );

      await userRef.collection('UserBadges').add(newBadgeData);
    }
  }
}
