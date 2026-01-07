// Otomatik FlutterFlow içe aktarmaları
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Diğer özel eylemleri içe aktarır
import 'package:flutter/material.dart';
// Özel eylem kodunu başlat
// YUKARIDAKİ KODU KALDIRMAYIN VEYA DEĞİŞTİRMEYİN!

import 'package:permission_handler/permission_handler.dart';

Future requestActivityPermission() async {
  await Permission.activityRecognition.request();
}

// Eylem adınızı ayarlayın, argümanlarınızı ve dönüş parametrenizi tanımlayın,
// ve ardından sağdaki yeşil düğmeyi kullanarak boilerplate kodunu ekleyin!
