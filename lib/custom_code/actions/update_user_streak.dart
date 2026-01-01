// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '/auth/firebase_auth/auth_util.dart';

Future updateUserStreak() async {
  final userRef = currentUserReference;
  if (userRef == null) return; // Kullanıcı giriş yapmamışsa durdur

  final userData = await userRef.get();
  if (!userData.exists) return;

  DateTime now = DateTime.now();
  // Karşılaştırma yaparken saatleri sıfırlayıp sadece güne odaklanıyoruz
  DateTime today = DateTime(now.year, now.month, now.day);

  // Veritabanından mevcut verileri alalım
  // Eğer alanlar yoksa varsayılan değerleri (0) atayalım
  DateTime? lastLogin = userData.get('last_login_date')?.toDate();
  int currentStreak = userData.get('current_streak') ?? 0;
  int highestStreak = userData.get('highest_streak') ?? 0;

  if (lastLogin != null) {
    DateTime lastLoginDateOnly =
        DateTime(lastLogin.year, lastLogin.month, lastLogin.day);

    // Bugün ile son giriş yapılan gün arasındaki tam gün farkı
    int difference = today.difference(lastLoginDateOnly).inDays;

    if (difference == 0) {
      // KULLANICI BUGÜN ZATEN GİRMİŞ: Seriyi artırma, işlemi bitir.
      return;
    } else if (difference == 1) {
      // KULLANICI DÜN GİRMİŞ: Seri devam ediyor.
      currentStreak += 1;
    } else {
      // KULLANICI BİR VEYA DAHA FAZLA GÜNÜ BOŞ GEÇMİŞ:
      // Seri siliniyor ve bugünden itibaren 1 olarak tekrar başlıyor.
      currentStreak = 1;
    }
  } else {
    // KULLANICININ İLK GİRİŞİ: Seriyi 1'den başlat.
    currentStreak = 1;
  }

  // EN UZUN SERİ KONTROLÜ:
  // Eğer mevcut seri, kayıtlı olan en yüksek seriyi geçerse onu güncelle.
  if (currentStreak > highestStreak) {
    highestStreak = currentStreak;
  }

  // Firestore'u tek seferde güncelle
  await userRef.update({
    'last_login_date': now,
    'current_streak': currentStreak,
    'highest_streak': highestStreak,
  });
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
