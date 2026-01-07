import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "uid" alanı.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "user_name" alanı.
  String? _userName;
  String get userName => _userName ?? '';
  bool hasUserName() => _userName != null;

  // "user_age" alanı.
  int? _userAge;
  int get userAge => _userAge ?? 0;
  bool hasUserAge() => _userAge != null;

  // "phone_number" alanı.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "email" alanı.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "photo_url" alanı.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "user_token" alanı.
  String? _userToken;
  String get userToken => _userToken ?? '';
  bool hasUserToken() => _userToken != null;

  // "created_time" alanı.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "user_password" alanı.
  String? _userPassword;
  String get userPassword => _userPassword ?? '';
  bool hasUserPassword() => _userPassword != null;

  // "display_name" alanı.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "is_Admin" alanı.
  bool? _isAdmin;
  bool get isAdmin => _isAdmin ?? false;
  bool hasIsAdmin() => _isAdmin != null;

  // "user_height" alanı.
  double? _userHeight;
  double get userHeight => _userHeight ?? 0.0;
  bool hasUserHeight() => _userHeight != null;

  // "user_weight" alanı.
  double? _userWeight;
  double get userWeight => _userWeight ?? 0.0;
  bool hasUserWeight() => _userWeight != null;

  // "Gender" alanı.
  String? _gender;
  String get gender => _gender ?? '';
  bool hasGender() => _gender != null;

  // "currentStreak" alanı.
  // Kullanıcının mevcut devam eden seri günü sayısı.
  int? _currentStreak;
  int get currentStreak => _currentStreak ?? 0;
  bool hasCurrentStreak() => _currentStreak != null;

  // "lastCompletedDate" alanı.
  DateTime? _lastCompletedDate;
  DateTime? get lastCompletedDate => _lastCompletedDate;
  bool hasLastCompletedDate() => _lastCompletedDate != null;

  // "highestStreak" alanı.
  int? _highestStreak;
  int get highestStreak => _highestStreak ?? 0;
  bool hasHighestStreak() => _highestStreak != null;

  // "streakCount" alanı.
  // Tamamlanan toplam seri sayısı.
  int? _streakCount;
  int get streakCount => _streakCount ?? 0;
  bool hasStreakCount() => _streakCount != null;

  // "lastStreakUpdate" alanı.
  DateTime? _lastStreakUpdate;
  DateTime? get lastStreakUpdate => _lastStreakUpdate;
  bool hasLastStreakUpdate() => _lastStreakUpdate != null;

  // "dailyStepGoal" alanı.
  // Kullanıcının günlük hedeflediği adım sayısı.
  int? _dailyStepGoal;
  int get dailyStepGoal => _dailyStepGoal ?? 0;
  bool hasDailyStepGoal() => _dailyStepGoal != null;

  // "userRole" alanı.
  String? _userRole;
  String get userRole => _userRole ?? '';
  bool hasUserRole() => _userRole != null;

  // "last_reset_date" alanı.
  DateTime? _lastResetDate;
  DateTime? get lastResetDate => _lastResetDate;
  bool hasLastResetDate() => _lastResetDate != null;

  // "streak" alanı.
  int? _streak;
  int get streak => _streak ?? 0;
  bool hasStreak() => _streak != null;

  // "last_login_date" alanı.
  DateTime? _lastLoginDate;
  DateTime? get lastLoginDate => _lastLoginDate;
  bool hasLastLoginDate() => _lastLoginDate != null;

  // "last_active_time" alanı.
  DateTime? _lastActiveTime;
  DateTime? get lastActiveTime => _lastActiveTime;
  bool hasLastActiveTime() => _lastActiveTime != null;

  // "is_notifications_enabled" alanı.
  // Kullanıcının bildirim izin durumu.
  bool? _isNotificationsEnabled;
  bool get isNotificationsEnabled => _isNotificationsEnabled ?? true;
  bool hasIsNotificationsEnabled() => _isNotificationsEnabled != null;

  void _initializeFields() {
    _uid = snapshotData['uid'] as String?;
    _userName = snapshotData['user_name'] as String?;
    _userAge = castToType<int>(snapshotData['user_age']);
    _phoneNumber = snapshotData['phone_number'] as String?;
    _email = snapshotData['email'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _userToken = snapshotData['user_token'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _userPassword = snapshotData['user_password'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _isAdmin = snapshotData['is_Admin'] as bool?;
    _userHeight = castToType<double>(snapshotData['user_height']);
    _userWeight = castToType<double>(snapshotData['user_weight']);
    _gender = snapshotData['Gender'] as String?;
    _currentStreak = castToType<int>(snapshotData['currentStreak']);
    _lastCompletedDate = snapshotData['lastCompletedDate'] as DateTime?;
    _highestStreak = castToType<int>(snapshotData['highestStreak']);
    _streakCount = castToType<int>(snapshotData['streakCount']);
    _lastStreakUpdate = snapshotData['lastStreakUpdate'] as DateTime?;
    _dailyStepGoal = castToType<int>(snapshotData['dailyStepGoal']);
    _userRole = snapshotData['userRole'] as String?;
    _lastResetDate = snapshotData['last_reset_date'] as DateTime?;
    _streak = castToType<int>(snapshotData['streak']);
    _lastLoginDate = snapshotData['last_login_date'] as DateTime?;
    _lastActiveTime = snapshotData['last_active_time'] as DateTime?;
    _isNotificationsEnabled = snapshotData['is_notifications_enabled'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? uid,
  String? userName,
  int? userAge,
  String? phoneNumber,
  String? email,
  String? photoUrl,
  String? userToken,
  DateTime? createdTime,
  String? userPassword,
  String? displayName,
  bool? isAdmin,
  double? userHeight,
  double? userWeight,
  String? gender,
  int? currentStreak,
  DateTime? lastCompletedDate,
  int? highestStreak,
  int? streakCount,
  DateTime? lastStreakUpdate,
  int? dailyStepGoal,
  String? userRole,
  DateTime? lastResetDate,
  int? streak,
  DateTime? lastLoginDate,
  DateTime? lastActiveTime,
  bool? isNotificationsEnabled,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'user_name': userName,
      'user_age': userAge,
      'phone_number': phoneNumber,
      'email': email,
      'photo_url': photoUrl,
      'user_token': userToken,
      'created_time': createdTime,
      'user_password': userPassword,
      'display_name': displayName,
      'is_Admin': isAdmin,
      'user_height': userHeight,
      'user_weight': userWeight,
      'Gender': gender,
      'currentStreak': currentStreak,
      'lastCompletedDate': lastCompletedDate,
      'highestStreak': highestStreak,
      'streakCount': streakCount,
      'lastStreakUpdate': lastStreakUpdate,
      'dailyStepGoal': dailyStepGoal,
      'userRole': userRole,
      'last_reset_date': lastResetDate,
      'streak': streak,
      'last_login_date': lastLoginDate,
      'last_active_time': lastActiveTime,
      'is_notifications_enabled': isNotificationsEnabled,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    return e1?.uid == e2?.uid &&
        e1?.userName == e2?.userName &&
        e1?.userAge == e2?.userAge &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.email == e2?.email &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.userToken == e2?.userToken &&
        e1?.createdTime == e2?.createdTime &&
        e1?.userPassword == e2?.userPassword &&
        e1?.displayName == e2?.displayName &&
        e1?.isAdmin == e2?.isAdmin &&
        e1?.userHeight == e2?.userHeight &&
        e1?.userWeight == e2?.userWeight &&
        e1?.gender == e2?.gender &&
        e1?.currentStreak == e2?.currentStreak &&
        e1?.lastCompletedDate == e2?.lastCompletedDate &&
        e1?.highestStreak == e2?.highestStreak &&
        e1?.streakCount == e2?.streakCount &&
        e1?.lastStreakUpdate == e2?.lastStreakUpdate &&
        e1?.dailyStepGoal == e2?.dailyStepGoal &&
        e1?.userRole == e2?.userRole &&
        e1?.lastResetDate == e2?.lastResetDate &&
        e1?.streak == e2?.streak &&
        e1?.lastLoginDate == e2?.lastLoginDate &&
        e1?.lastActiveTime == e2?.lastActiveTime &&
        e1?.isNotificationsEnabled == e2?.isNotificationsEnabled;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.uid,
        e?.userName,
        e?.userAge,
        e?.phoneNumber,
        e?.email,
        e?.photoUrl,
        e?.userToken,
        e?.createdTime,
        e?.userPassword,
        e?.displayName,
        e?.isAdmin,
        e?.userHeight,
        e?.userWeight,
        e?.gender,
        e?.currentStreak,
        e?.lastCompletedDate,
        e?.highestStreak,
        e?.streakCount,
        e?.lastStreakUpdate,
        e?.dailyStepGoal,
        e?.userRole,
        e?.lastResetDate,
        e?.streak,
        e?.lastLoginDate,
        e?.lastActiveTime,
        e?.isNotificationsEnabled
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
