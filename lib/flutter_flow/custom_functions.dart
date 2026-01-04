import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/enums/enums.dart';
import '/auth/firebase_auth/auth_util.dart';

DateTime getSevenDaysAgo() {
  // Bugünden 7 gün öncesini hesaplayıp döndürür
  return DateTime.now().subtract(const Duration(days: 7));
}

List<DailyStatsRecord> sortStatsByDate(List<DailyStatsRecord> unsortedList) {
  //
// Listeyi kopyalayalım ki orijinal veri bozulmasın
  var sortedList = List<DailyStatsRecord>.from(unsortedList);

  // Tarihe göre eskiden yeniye sırala (a, b karşılaştırması)
  sortedList.sort((a, b) {
    // Eğer tarih boşsa en sona at (Güvenlik önlemi)
    if (a.date == null) return 1;
    if (b.date == null) return -1;
    return a.date!.compareTo(b.date!);
  });

  return sortedList;
}
