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

  final userDoc = await userRef.get();
  if (!userDoc.exists) return;

  final data = userDoc.data() as Map<String, dynamic>;

  // 2. Verileri al
  // lastStreakUpdate: Serinin en son arttığı veya resetlendiği zaman
  Timestamp? lastStreakUpdateTs = data['lastStreakUpdate']
      as Timestamp?; // Using correct field name from UsersRecord
  int currentStreak = data['currentStreak'] is int ? data['currentStreak'] : 0;
  int highestStreak = data['highestStreak'] is int ? data['highestStreak'] : 0;

  DateTime now = DateTime.now();
  DateTime today = DateTime(now.year, now.month, now.day);
  DateTime? lastUpdateDate;
  if (lastStreakUpdateTs != null) {
    DateTime d = lastStreakUpdateTs.toDate();
    lastUpdateDate = DateTime(d.year, d.month, d.day);
  }

  // 3. SIFIRLAMA KONTROLÜ (Reset Logic)
  // Eğer son güncelleme bugünden önceki günden daha eskiyse (dün değil, evvelsi gün veya daha önce),
  // seri bozulmuş demektir.
  if (lastUpdateDate != null) {
    int diffDays = today.difference(lastUpdateDate).inDays;
    if (diffDays > 1) {
      currentStreak = 0;
      // Resetlendiği için tarihi güncellememiz gerekir mi?
      // Evet, bugünkü durumu yansıtması için güncelleyebiliriz veya 0 olarak kalır.
      // Kullanıcı bugün hedefleriamlarsa tekrar 1 olacak.
      // Şimdilik DB'yi güncelleyelim.
      await userRef.update({
        'currentStreak': 0,
        // lastStreakUpdate'i güncellemiyoruz, çünkü bugün henüz "başarılı" bir işlem olmadı.
        // Ama "seri bozuldu" bilgisini işlemek için belki gerekebilir.
        // Ancak artış mantığı "fark == 0 ise artırma" dediği için, eğer 0'a çekip tarihi güncellemezsek,
        // ve bugün tamamlarsa, fark > 0 olacağı için artırır (1 olur). Bu doğru.
      });
    }
  }

  // 4. ARTIRMA KONTROLÜ (Increment Logic)
  // Kullanıcının tamamlanmamış hedeflerini sorgula
  final uncompletedGoalsQuery = await userRef
      .collection('UserGoals') // Subcollection name from UserGoalsRecord
      .where('isCompleted', isEqualTo: false)
      .get();

  // Hiç hedef yoksa (kullanıcı hedef eklememişse) ne olacak?
  // Kullanıcı hedef eklemiş mi kontrolü:
  final allGoalsQuery = await userRef.collection('UserGoals').limit(1).get();
  bool hasGoals = allGoalsQuery.docs.isNotEmpty;

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
