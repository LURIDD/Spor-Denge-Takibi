// Otomatik FlutterFlow içe aktarmaları
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Diğer özel eylemleri içe aktarır
import 'package:flutter/material.dart';
// Özel eylem kodunu başlat
// YUKARIDAKİ KODU KALDIRMAYIN VEYA DEĞİŞTİRMEYİN!

import '/auth/firebase_auth/auth_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
import 'package:cloud_firestore/cloud_firestore.dart';

Future checkDailyStreak() async {
  // 1. Kullanıcı referansını al
  final userRef = currentUserReference;
  if (userRef == null) return;

  // OPTİMİZASYON: Veritabanından tekrar çekmek yerine yerel önbellekteki veriyi kullan
  if (currentUserDocument == null) return;

  // 2. Verileri al
  int currentStreak = currentUserDocument?.currentStreak ?? 0;
  int highestStreak = currentUserDocument?.highestStreak ?? 0;

  DateTime now = DateTime.now();
  DateTime today = DateTime(now.year, now.month, now.day);

  // lastStreakUpdate zaten DateTime? olarak geliyor (UsersRecord getter'ı sayesinde)
  DateTime? lastUpdateDate = currentUserDocument?.lastStreakUpdate;

  // 3. SIFIRLAMA KONTROLÜ (Reset Mantığı)
  if (lastUpdateDate != null) {
    // Sadece yıl/ay/gün karşılaştırması için temizle
    DateTime d = lastUpdateDate;
    lastUpdateDate = DateTime(d.year, d.month, d.day);

    int diffDays = today.difference(lastUpdateDate).inDays;
    if (diffDays > 1) {
      currentStreak = 0;
      await userRef.update({
        'currentStreak': 0,
        'streak': 0,
        'current_streak': 0,
      });
    }
  }

  // 4. ARTIRMA KONTROLÜ (Increment Mantığı)
  // Kullanıcının tamamlanmamış hedeflerini sorgula
  final uncompletedGoalsQuery = await userRef
      .collection('UserGoals')
      .where('isCompleted', isEqualTo: false)
      .get();

  // OPTİMİZASYON: Kullanıcının hedefi olup olmadığını SADECE tamamlanmamış hedef bulamazsak kontrol et.
  bool hasGoals = true;
  if (uncompletedGoalsQuery.docs.isNotEmpty) {
    // Tamamlanmamış hedefler var, bu yüzden seriyi artıramayız. hasGoals kontrolü burada önemsiz.
  } else {
    // Eğer tamamlanmamış hedef yoksa, HİÇ hedefi var mı diye kontrol et.
    final allGoalsQuery = await userRef.collection('UserGoals').limit(1).get();
    hasGoals = allGoalsQuery.docs.isNotEmpty;
  }

  // Sadece hedefleri varsa ve tamamlanmamış hedefi yoksa artır
  if (hasGoals && uncompletedGoalsQuery.docs.isEmpty) {
    // Tüm hedefler tamamlanmış!

    // Bugün zaten artırıldı mı?
    bool alreadyUpdatedToday = false;
    if (lastUpdateDate != null) {
      if (today.difference(lastUpdateDate).inDays == 0) {
        alreadyUpdatedToday = true;
      }
    }

    if (!alreadyUpdatedToday) {
      // Seriyi artır
      currentStreak += 1;

      // Rekor kontrolü
      if (currentStreak > highestStreak) {
        highestStreak = currentStreak;
      }

      await userRef.update({
        'currentStreak': currentStreak,
        'streak': currentStreak,
        'current_streak': currentStreak,
        'highestStreak': highestStreak,
        'lastStreakUpdate': now, // Serinin arttığı zaman
      });
    }
  }

  // 5. Giriş zamanını güncelle (Her durumda)
  await userRef.update({
    'last_active_time': now,
  });

  // 6. Rozetleri Kontrol Et
  await checkAndAwardBadges();

  // 7. Günlük Aktivite İlerlemesini Güncelle (Haftalık Özet için)
  await updateDailyActivityProgress();
}
