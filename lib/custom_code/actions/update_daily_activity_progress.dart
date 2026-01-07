// Otomatik FlutterFlow içe aktarmaları
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Diğer özel eylemleri içe aktarır
import 'package:flutter/material.dart';
// Özel eylem kodunu başlat
// YUKARIDAKİ KODU KALDIRMAYIN VEYA DEĞİŞTİRMEYİN!

import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

Future updateDailyActivityProgress() async {
  // 1. Mevcut Kullanıcıyı Al
  final userRef = currentUserReference;
  if (userRef == null) return;

  // 2. Günlük İlerleme (Oran) Hesaplanması
  // OPTİMİZASYON: Mümkünse bu veriyi yeniden sorgulamak yerine parametre olarak geçmeliyiz.
  // Şimdilik sorguluyoruz ancak kullanım izin verirse sadece ihtiyacımız olanı aldığımızdan emin oluyoruz.
  final userGoalsQuery = await userRef.collection('UserGoals').get();
  final userGoals =
      userGoalsQuery.docs.map((d) => UserGoalsRecord.fromSnapshot(d)).toList();

  double progressRatio = 0.0;
  if (userGoals.isNotEmpty) {
    int completedCount = userGoals.where((g) => g.isCompleted).length;
    progressRatio = completedCount / userGoals.length;
  }

  // 3. UserActivities Kaydını Getir veya Oluştur
  // OPTİMİZASYON: Birden fazla kayıt varsa (olmamalı) verimli sorgu için limit(1) ekle.
  final userActivitiesQuery =
      await userRef.collection('user_activities').limit(1).get();
  UserActivitiesRecord? activityRecord;
  DocumentReference? activityRef;

  List<double> dailyValues = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0];
  DateTime? lastSeriesDate;
  bool dataSanitized = false;

  if (userActivitiesQuery.docs.isNotEmpty) {
    activityRecord =
        UserActivitiesRecord.fromSnapshot(userActivitiesQuery.docs.first);
    activityRef = activityRecord.reference;

    // Mevcut değerleri yükle, uzunluğun 7 olduğundan emin ol
    if (activityRecord.dailyValues.isNotEmpty) {
      // Son 7'yi al veya doldur
      List<double> loaded = List.from(activityRecord.dailyValues);

      // TEMİZLEME: Mevcut hatalı verileri düzelt (değer > 1.0 ise)
      for (int i = 0; i < loaded.length; i++) {
        if (loaded[i] > 1.0) {
          dataSanitized = true; // Veriyi değiştirdiğimizi işaretle
          // Yüzde olarak saklanmışsa (ör. 50.0), 0.5'e çevir. Aksi takdirde 1.0'a eşitle.
          if (loaded[i] <= 100.0) {
            loaded[i] /= 100.0;
          } else {
            loaded[i] = 1.0;
          }
        }
      }

      if (loaded.length < 7) {
        // Başına sıfır ekleyerek doldur
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
    // Yoksa yeni oluştur
    final newDoc = userRef.collection('user_activities').doc();
    activityRef = newDoc;
    // Veriyi en sonda set edeceğiz
  }

  // 4. Tarihe Göre Güncelleme Mantığı
  DateTime now = DateTime.now();
  DateTime today = DateTime(now.year, now.month, now.day);
  DateTime? lastDate = lastSeriesDate != null
      ? DateTime(lastSeriesDate.year, lastSeriesDate.month, lastSeriesDate.day)
      : null;

  bool shouldUpdate = true;

  if (lastDate == null) {
    // İlk kez: bugünün değerini sona ekle
    dailyValues[6] = progressRatio;
  } else {
    int diff = today.difference(lastDate).inDays;

    if (diff == 0) {
      // Aynı gün
      // OPTİMİZASYON: Değerin gerçekten değişip değişmediğini kontrol et
      // AMA eski veriyi temizlediysek (sanitized), MUTLAKA güncellemeliyiz
      if (!dataSanitized && (dailyValues[6] - progressRatio).abs() < 0.01) {
        shouldUpdate = false;
      }
      dailyValues[6] = progressRatio;
    } else if (diff > 0) {
      // Yeni gün(ler) geçmiş
      if (diff >= 7) {
        // Boşluk çok büyük, bugün hariç her şeyi 0'a sıfırla
        dailyValues = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, progressRatio];
      } else {
        // Her geçen gün için sola kaydır
        for (int i = 0; i < diff - 1; i++) {
          dailyValues.removeAt(0);
          dailyValues.add(0.0);
        }
        // Bugünü ekle
        dailyValues.removeAt(0);
        dailyValues.add(progressRatio);
      }
    }
  }

  // 5. Tutarlılığı Hesapla (Consistency)
  // Listenin ortalaması * 100. Toplamı tekrar kontrol et.
  double sum = dailyValues.reduce((a, b) => a + b);
  int consistency = ((sum / 7) * 100).round();
  if (consistency > 100) consistency = 100;

  // 6. Firestore'a Kaydet
  if (shouldUpdate) {
    final firestoreData = createUserActivitiesRecordData(
      userId: userRef.id,
      consistency: consistency,
      lastSeriesDate: today,
    );
    // dailyValues'u manuel ekle
    firestoreData['dailyValues'] = dailyValues;

    if (activityRef != null) {
      await activityRef.set(firestoreData, SetOptions(merge: true));
    }
  }
}
