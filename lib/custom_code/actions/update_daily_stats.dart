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

import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

Future updateDailyStats(
  DocumentReference userRef,
  int scoreChange, // +20 veya -20 gibi değişim miktarı
  bool isReset, // True ise puanı direkt 0 yapar
) async {
  // 1. Bugünün tarihini al (saatleri sıfırla)
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);

  // 2. Referansı al
  final statsRef = userRef.collection('daily_stats');

  // 3. Bugünün kaydını sorgula
  final querySnapshot =
      await statsRef.where('date', isEqualTo: today).limit(1).get();

  if (querySnapshot.docs.isNotEmpty) {
    // --- DURUM A: Kayıt Var, Güncelleyelim ---
    final doc = querySnapshot.docs.first;
    final currentData = doc.data();

    int currentScore = 0;
    if (currentData != null && currentData.containsKey('score')) {
      currentScore = currentData['score'];
    }

    int newScore;

    if (isReset) {
      // Eğer "Hiç hedef seçmedi" durumuysa (Reset) -> 0 yap
      newScore = 0;
    } else {
      // Değilse gelen miktarı ekle (Negatif gelirse çıkarma yapmış olur)
      newScore = currentScore + scoreChange;
    }

    // Puanın eksiye düşmesini engelleyelim (İsteğe bağlı)
    if (newScore < 0) newScore = 0;

    await doc.reference.update({
      'score': newScore,
      'last_update': FieldValue.serverTimestamp(),
    });
  } else {
    // --- DURUM B: Kayıt Yok, Yeni Oluşturalım ---

    int initialScore = 0;

    if (!isReset) {
      // Reset değilse, gelen puanla başla (Örn: İlk hedef eklendiğinde 20 olur)
      initialScore = scoreChange;
    }

    // Eksi ile başlamasın
    if (initialScore < 0) initialScore = 0;

    await statsRef.add({
      'date': today,
      'score': initialScore,
      'created_at': FieldValue.serverTimestamp(),
    });
  }
}
