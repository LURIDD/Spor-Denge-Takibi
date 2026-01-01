import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _isDarkMode = prefs.getBool('ff_isDarkMode') ?? _isDarkMode;
    });
    _safeInit(() {
      _secilenAvatar = prefs.getString('ff_secilenAvatar') ?? _secilenAvatar;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _tempEmail = '';
  String get tempEmail => _tempEmail;
  set tempEmail(String value) {
    _tempEmail = value;
  }

  String _tempPassword = '';
  String get tempPassword => _tempPassword;
  set tempPassword(String value) {
    _tempPassword = value;
  }

  String _tempRealname = '';
  String get tempRealname => _tempRealname;
  set tempRealname(String value) {
    _tempRealname = value;
  }

  String _TempUsername = '';
  String get TempUsername => _TempUsername;
  set TempUsername(String value) {
    _TempUsername = value;
  }

  double _TempUserHeight = 0.0;
  double get TempUserHeight => _TempUserHeight;
  set TempUserHeight(double value) {
    _TempUserHeight = value;
  }

  double _TempUserWeight = 0.0;
  double get TempUserWeight => _TempUserWeight;
  set TempUserWeight(double value) {
    _TempUserWeight = value;
  }

  String _TempGender = '';
  String get TempGender => _TempGender;
  set TempGender(String value) {
    _TempGender = value;
  }

  int _OnBoardingIndex = 0;
  int get OnBoardingIndex => _OnBoardingIndex;
  set OnBoardingIndex(int value) {
    _OnBoardingIndex = value;
  }

  DateTime? _TempBirthDate = DateTime.fromMillisecondsSinceEpoch(1766331900000);
  DateTime? get TempBirthDate => _TempBirthDate;
  set TempBirthDate(DateTime? value) {
    _TempBirthDate = value;
  }

  /// Gece modu durumu
  bool _isDarkMode = false;
  bool get isDarkMode => _isDarkMode;
  set isDarkMode(bool value) {
    _isDarkMode = value;
    prefs.setBool('ff_isDarkMode', value);
  }

  bool _streakOpen = false;
  bool get streakOpen => _streakOpen;
  set streakOpen(bool value) {
    _streakOpen = value;
  }

  bool _waterFaqOpen = false;
  bool get waterFaqOpen => _waterFaqOpen;
  set waterFaqOpen(bool value) {
    _waterFaqOpen = value;
  }

  bool _DengeleFaqOpen = false;
  bool get DengeleFaqOpen => _DengeleFaqOpen;
  set DengeleFaqOpen(bool value) {
    _DengeleFaqOpen = value;
  }

  /// Seçilen profil resminin adını tutar.
  String _selectedAvatarName = '';
  String get selectedAvatarName => _selectedAvatarName;
  set selectedAvatarName(String value) {
    _selectedAvatarName = value;
  }

  int _liveSteps = 0;
  int get liveSteps => _liveSteps;
  set liveSteps(int value) {
    _liveSteps = value;
  }

  /// Seçilen avatarı tutar
  String _secilenAvatar = '';
  String get secilenAvatar => _secilenAvatar;
  set secilenAvatar(String value) {
    _secilenAvatar = value;
    prefs.setString('ff_secilenAvatar', value);
  }

  int _KalanAdet = 0;
  int get KalanAdet => _KalanAdet;
  set KalanAdet(int value) {
    _KalanAdet = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
