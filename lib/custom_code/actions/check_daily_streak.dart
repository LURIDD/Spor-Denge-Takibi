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

import '/auth/firebase_auth/auth_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future checkDailyStreak() async {
  // 1. Kullanıcı kontrolü
  final userRef = currentUserReference;
  if (userRef == null) return;

  final userDoc = await userRef.get();
  if (!userDoc.exists) return;

  // Veriyi Map olarak tanıtıyoruz (Hata çözümü)
  final data = userDoc.data() as Map<String, dynamic>;

  // 2. Verileri Veritabanı İsimlerine Göre Çekiyoruz (DÜZELTİLEN KISIM)
  // Ekran görüntüne göre 'last_active_time' doğru ama diğerleri bitişik yazılmış.
  Timestamp? lastActiveTs = data['last_active_time'] as Timestamp?;

  // Buradaki isimleri senin attığın resimdeki 'currentStreak' ve 'highestStreak' ile eşleştirdim
  int currentStreak = data['currentStreak'] is int ? data['currentStreak'] : 0;
  int highestStreak = data['highestStreak'] is int ? data['highestStreak'] : 0;

  DateTime now = DateTime.now();
  DateTime today = DateTime(now.year, now.month, now.day);

  // EĞER İLK KEZ GİRİYORSA (Veri Null ise)
  if (lastActiveTs == null) {
    await userRef.update({
      'last_active_time': now,
      'currentStreak': 1, // Veritabanındaki isme göre güncellendi
      'highestStreak': 1, // Veritabanındaki isme göre güncellendi
    });
    return;
  }

  DateTime lastDate = lastActiveTs.toDate();
  DateTime lastActiveDay =
      DateTime(lastDate.year, lastDate.month, lastDate.day);

  // Gün farkını hesapla
  int difference = today.difference(lastActiveDay).inDays;

  // --- SERİ MANTIĞI ---
  if (difference == 0) {
    // Bugün zaten girilmiş, işlem yapma
    return;
  } else if (difference == 1) {
    // Dün girilmiş, seriyi artır
    currentStreak += 1;
  } else {
    // Gün kaçmış, seri sıfırlanır
    currentStreak = 1;
  }

  // Rekor kontrolü
  if (currentStreak > highestStreak) {
    highestStreak = currentStreak;
  }

  // Veritabanını güncelle (Alan isimleri senin veritabanınla birebir aynı)
  await userRef.update({
    'last_active_time': now,
    'currentStreak': currentStreak,
    'highestStreak': highestStreak,
  });
}
