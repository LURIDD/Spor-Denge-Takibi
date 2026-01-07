// Otomatik FlutterFlow içe aktarmaları
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Diğer özel bileşenleri içe aktarır
import '/custom_code/actions/index.dart'; // Özel eylemleri içe aktarır
import 'package:flutter/material.dart';
// Özel bileşen kodunu başlat
// YUKARIDAKİ KODU KALDIRMAYIN VEYA DEĞİŞTİRMEYİN!

import 'dart:async';
import 'package:pedometer/pedometer.dart';
import 'package:permission_handler/permission_handler.dart';

class LiveStepCounter extends StatefulWidget {
  const LiveStepCounter({
    Key? key,
    this.width,
    this.height,
    this.textColor,
    this.textSize,
  }) : super(key: key);

  final double? width;
  final double? height;
  final Color? textColor;
  final double? textSize;

  @override
  _LiveStepCounterState createState() => _LiveStepCounterState();
}

class _LiveStepCounterState extends State<LiveStepCounter> {
  late Stream<StepCount> _stepCountStream;
  String _steps = '0';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  void onStepCount(StepCount event) {
    int rawSteps = event.steps;
    int offset = FFAppState().stepOffset;
    int last = FFAppState().lastSensorSteps;

    // Cihaz yeniden başlatıldıysa veya sayaç sıfırlandıysa
    if (rawSteps < last) {
      offset = rawSteps;
      FFAppState().stepOffset = offset;
    }

    FFAppState().lastSensorSteps = rawSteps;

    int displayedSteps = rawSteps - offset;
    if (displayedSteps < 0) {
      offset = rawSteps;
      FFAppState().stepOffset = offset;
      displayedSteps = 0;
    }

    setState(() {
      _steps = displayedSteps.toString();
    });
    FFAppState().liveSteps = displayedSteps;
  }

  void onStepCountError(error) {
    setState(() {
      _steps = 'Hata'; // Sensör bulunamazsa
    });
  }

  Future<void> initPlatformState() async {
    // İzin isteği (Android 10+ için kritik)
    if (await Permission.activityRecognition.request().isGranted) {
      _stepCountStream = Pedometer.stepCountStream;
      _stepCountStream.listen(onStepCount).onError(onStepCountError);
    } else {
      setState(() {
        _steps = 'İzin Yok';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      alignment: Alignment.center,
      child: Text(
        _steps,
        style: FlutterFlowTheme.of(context).bodyMedium.override(
              fontFamily: 'Inter',
              color: widget.textColor ?? Colors.black,
              fontSize: widget.textSize ?? 24,
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}
