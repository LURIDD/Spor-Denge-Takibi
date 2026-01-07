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
  // 1. Mevcut kullanıcı referansını al
  final userRef = currentUserReference;
  if (userRef == null) return;

  // 2. Tanımlı tüm rozetleri getir
  final badgesQuery =
      await FirebaseFirestore.instance.collection('badges').get();
  final badges =
      badgesQuery.docs.map((d) => BadgesRecord.fromSnapshot(d)).toList();

  if (badges.isEmpty) return;

  // 3. Kullanıcının zaten kazandığı rozetleri getir (Çift kazanımı önlemek için)
  final userBadgesQuery = await userRef.collection('UserBadges').get();
  final existingBadgeRefs = userBadgesQuery.docs
      .map((d) => UserBadgesRecord.fromSnapshot(d).badgeRef)
      .toSet();

  // 4. Kriterleri kontrol etmek için kullanıcının hedeflerini getir
  // İlgili hedefleri bulmak için tüm hedefleri kontrol etmeliyiz (Su, Egzersiz vb.)
  // OPTİMİZASYON: Tüm hedefleri çekmek yerine spesifik sorgular da yapılabilir ancak şu anlık genel çekim daha güvenli.
  final userGoalsQuery = await userRef.collection('UserGoals').get();
  final userGoals =
      userGoalsQuery.docs.map((d) => UserGoalsRecord.fromSnapshot(d)).toList();

  // 5. Önbellekteki kullanıcı verisini kullan (Optimizasyon)
  // currentUserDocument küresel olarak verimli bir şekilde zaten elimizde mevcut
  UsersRecord? userDoc = currentUserDocument;

  if (userDoc == null) {
    // Sadece önbellek boşsa (nadir durum) veritabanından çek
    final userDocData = await userRef.get();
    userDoc = UsersRecord.fromSnapshot(userDocData);
  }

  for (final badge in badges) {
    if (existingBadgeRefs.contains(badge.reference)) {
      continue; // Zaten kazanılmış
    }

    bool requirementsMet = false;
    // Hedef gün sayısı belirleme
    int targetDays = 15; // Varsayılan geri dönüş değeri
    String name = badge.name.toLowerCase();
    String criteria = badge.criteria.toLowerCase();

    // Kriter metninden sayıyı çıkarmayı dene
    final RegExp numRegExp = RegExp(r'(\d+)');
    final match = numRegExp.firstMatch(criteria);
    if (match != null) {
      targetDays = int.tryParse(match.group(1)!) ?? 15;
    }
    // Eğer açıkça belirtilmiş bir hedef varsa ve pozitifse onu tercih et
    if (badge.target > 0) {
      targetDays = badge.target;
    }

    // --- MANTIK 1: KÜRESEL SERİ (STREAK) KONTROLÜ ---
    // Eğer rozet "Seri" veya "Streak" ile ilgiliyse
    if (name.contains('seri') ||
        name.contains('streak') ||
        criteria.contains('seri') ||
        criteria.contains('streak')) {
      // Küresel Kullanıcı Serisini Kontrol Et - KALICILIK DÜZELTMESİ
      // Varsa highestStreak (en yüksek seri) kullan, yoksa currentStreak veya streak alanlarının maksimumunu al
      int bestStreak = userDoc.highestStreak;
      // Geri Dönüş/Güvenlik: highestStreak daha önce doğru güncellenmemişse mevcut alanları da kontrol et
      if (userDoc.currentStreak > bestStreak)
        bestStreak = userDoc.currentStreak;
      if (userDoc.streak > bestStreak) bestStreak = userDoc.streak;

      if (bestStreak >= targetDays) {
        requirementsMet = true;
      }
    }
    // --- MANTIK 2: DİNAMİK HEDEF EŞLEŞTİRME ---
    // Rozet İsmini Kullanıcı Hedef İsmi ile Eşleştir
    else {
      // Eşleşen hedefi bul
      final matchingGoal = userGoals.firstWhereOrNull((goal) {
        final goalName = goal.goalName.toLowerCase();

        // Sağlamlık için Katı Anahtar Kelime Eşleştirmesi
        // ("Su" kelimesi kısa olduğu için yanlış eşleşmeleri önlemek adına özel kontrol)
        if (name.contains('su') && goalName.contains('su')) return true;
        if ((name.contains('egzersiz') || name.contains('spor')) &&
            (goalName.contains('egzersiz') || goalName.contains('spor')))
          return true;
        if (name.contains('kitap') && goalName.contains('kitap')) return true;
        if (name.contains('meditasyon') && goalName.contains('meditasyon'))
          return true;
        if (name.contains('uyku') && goalName.contains('uyku')) return true;

        // Genel içerik kontrolüne geri dönüş
        return goalName.contains(name) || name.contains(goalName);
      });

      if (matchingGoal != null) {
        // KALICILIK DÜZELTMESİ: longestStreak (en iyi kayıt) kontrol et
        int bestGoalStreak = matchingGoal.longestStreak;
        // Güvenlik kontrolü: mevcut seri daha yüksekse onu kullan
        if (matchingGoal.currentStreak > bestGoalStreak) {
          bestGoalStreak = matchingGoal.currentStreak;
        }

        if (bestGoalStreak >= targetDays) {
          requirementsMet = true;
        }
      }
    }

    // Eğer şartlar sağlandıysa Rozeti Ver
    if (requirementsMet) {
      final newBadgeData = createUserBadgesRecordData(
        badgeRef: badge.reference,
        status: 'unlocked', // Kilit açıldı
        earnedTime: getCurrentTimestamp,
        currentProgress: targetDays, // Tamamlandı
      );

      await userRef.collection('UserBadges').add(newBadgeData);
    }
  }
}
