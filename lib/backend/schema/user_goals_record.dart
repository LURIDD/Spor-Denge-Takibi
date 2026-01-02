import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// Kullanıcı Hedefleri
class UserGoalsRecord extends FirestoreRecord {
  UserGoalsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "goalName" field.
  String? _goalName;
  String get goalName => _goalName ?? '';
  bool hasGoalName() => _goalName != null;

  // "goalAmount" field.
  double? _goalAmount;
  double get goalAmount => _goalAmount ?? 0.0;
  bool hasGoalAmount() => _goalAmount != null;

  // "ownerRef" field.
  DocumentReference? _ownerRef;
  DocumentReference? get ownerRef => _ownerRef;
  bool hasOwnerRef() => _ownerRef != null;

  // "isCompleted" field.
  bool? _isCompleted;
  bool get isCompleted => _isCompleted ?? false;
  bool hasIsCompleted() => _isCompleted != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "goalUnitMeasurement" field.
  String? _goalUnitMeasurement;
  String get goalUnitMeasurement => _goalUnitMeasurement ?? '';
  bool hasGoalUnitMeasurement() => _goalUnitMeasurement != null;

  // "current_streak" field.
  int? _currentStreak;
  int get currentStreak => _currentStreak ?? 0;
  bool hasCurrentStreak() => _currentStreak != null;

  // "longest_streak" field.
  int? _longestStreak;
  int get longestStreak => _longestStreak ?? 0;
  bool hasLongestStreak() => _longestStreak != null;

  // "last_completed_date" field.
  DateTime? _lastCompletedDate;
  DateTime? get lastCompletedDate => _lastCompletedDate;
  bool hasLastCompletedDate() => _lastCompletedDate != null;

  DocumentReference get parentReference => reference.parent.parent!;

  // "iconPath" field.
  String? _iconPath;
  String get iconPath => _iconPath ?? '';
  bool hasIconPath() => _iconPath != null;

  void _initializeFields() {
    _goalName = snapshotData['goalName'] as String?;
    _goalAmount = castToType<double>(snapshotData['goalAmount']);
    _ownerRef = snapshotData['ownerRef'] as DocumentReference?;
    _isCompleted = snapshotData['isCompleted'] as bool?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _goalUnitMeasurement = snapshotData['goalUnitMeasurement'] as String?;
    _currentStreak = castToType<int>(snapshotData['current_streak']);
    _longestStreak = castToType<int>(snapshotData['longest_streak']);
    _lastCompletedDate = snapshotData['last_completed_date'] as DateTime?;
    _iconPath = snapshotData['iconPath'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('UserGoals')
          : FirebaseFirestore.instance.collectionGroup('UserGoals');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('UserGoals').doc(id);

  static Stream<UserGoalsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserGoalsRecord.fromSnapshot(s));

  static Future<UserGoalsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserGoalsRecord.fromSnapshot(s));

  static UserGoalsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserGoalsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserGoalsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserGoalsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserGoalsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserGoalsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserGoalsRecordData({
  String? goalName,
  double? goalAmount,
  DocumentReference? ownerRef,
  bool? isCompleted,
  DateTime? createdAt,
  String? goalUnitMeasurement,
  int? currentStreak,
  int? longestStreak,
  DateTime? lastCompletedDate,
  String? iconPath,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'goalName': goalName,
      'goalAmount': goalAmount,
      'ownerRef': ownerRef,
      'isCompleted': isCompleted,
      'createdAt': createdAt,
      'goalUnitMeasurement': goalUnitMeasurement,
      'current_streak': currentStreak,
      'longest_streak': longestStreak,
      'last_completed_date': lastCompletedDate,
      'iconPath': iconPath,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserGoalsRecordDocumentEquality implements Equality<UserGoalsRecord> {
  const UserGoalsRecordDocumentEquality();

  @override
  bool equals(UserGoalsRecord? e1, UserGoalsRecord? e2) {
    return e1?.goalName == e2?.goalName &&
        e1?.goalAmount == e2?.goalAmount &&
        e1?.ownerRef == e2?.ownerRef &&
        e1?.isCompleted == e2?.isCompleted &&
        e1?.createdAt == e2?.createdAt &&
        e1?.goalUnitMeasurement == e2?.goalUnitMeasurement &&
        e1?.currentStreak == e2?.currentStreak &&
        e1?.longestStreak == e2?.longestStreak &&
        e1?.lastCompletedDate == e2?.lastCompletedDate &&
        e1?.iconPath == e2?.iconPath;
  }

  @override
  int hash(UserGoalsRecord? e) => const ListEquality().hash([
        e?.goalName,
        e?.goalAmount,
        e?.ownerRef,
        e?.isCompleted,
        e?.createdAt,
        e?.goalUnitMeasurement,
        e?.currentStreak,
        e?.longestStreak,
        e?.lastCompletedDate,
        e?.iconPath
      ]);

  @override
  bool isValidKey(Object? o) => o is UserGoalsRecord;
}
