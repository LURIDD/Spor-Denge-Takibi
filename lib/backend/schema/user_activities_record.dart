import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// Kullanıcı Aktiviteleri
class UserActivitiesRecord extends FirestoreRecord {
  UserActivitiesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userId" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "dailyValues" field.
  List<double>? _dailyValues;
  List<double> get dailyValues => _dailyValues ?? const [];
  bool hasDailyValues() => _dailyValues != null;

  // "consistency" field.
  int? _consistency;
  int get consistency => _consistency ?? 0;
  bool hasConsistency() => _consistency != null;

  // "lastSeriesDate" field.
  DateTime? _lastSeriesDate;
  DateTime? get lastSeriesDate => _lastSeriesDate;
  bool hasLastSeriesDate() => _lastSeriesDate != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _userId = snapshotData['userId'] as String?;
    _dailyValues = getDataList(snapshotData['dailyValues']);
    _consistency = castToType<int>(snapshotData['consistency']);
    _lastSeriesDate = snapshotData['lastSeriesDate'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('user_activities')
          : FirebaseFirestore.instance.collectionGroup('user_activities');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('user_activities').doc(id);

  static Stream<UserActivitiesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserActivitiesRecord.fromSnapshot(s));

  static Future<UserActivitiesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserActivitiesRecord.fromSnapshot(s));

  static UserActivitiesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserActivitiesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserActivitiesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserActivitiesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserActivitiesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserActivitiesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserActivitiesRecordData({
  String? userId,
  int? consistency,
  DateTime? lastSeriesDate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userId': userId,
      'consistency': consistency,
      'lastSeriesDate': lastSeriesDate,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserActivitiesRecordDocumentEquality
    implements Equality<UserActivitiesRecord> {
  const UserActivitiesRecordDocumentEquality();

  @override
  bool equals(UserActivitiesRecord? e1, UserActivitiesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.userId == e2?.userId &&
        listEquality.equals(e1?.dailyValues, e2?.dailyValues) &&
        e1?.consistency == e2?.consistency &&
        e1?.lastSeriesDate == e2?.lastSeriesDate;
  }

  @override
  int hash(UserActivitiesRecord? e) => const ListEquality()
      .hash([e?.userId, e?.dailyValues, e?.consistency, e?.lastSeriesDate]);

  @override
  bool isValidKey(Object? o) => o is UserActivitiesRecord;
}
