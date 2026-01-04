import 'dart:async';

import 'package:collection/collection.dart';
import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserBadgesRecord extends FirestoreRecord {
  UserBadgesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "badge_ref" field.
  DocumentReference? _badgeRef;
  DocumentReference? get badgeRef => _badgeRef;
  bool hasBadgeRef() => _badgeRef != null;

  // "earned_time" field.
  DateTime? _earnedTime;
  DateTime? get earnedTime => _earnedTime;
  bool hasEarnedTime() => _earnedTime != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "current_progress" field.
  int? _currentProgress;
  int get currentProgress => _currentProgress ?? 0;
  bool hasCurrentProgress() => _currentProgress != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _badgeRef = snapshotData['badge_ref'] as DocumentReference?;
    _earnedTime = snapshotData['earned_time'] as DateTime?;
    _status = snapshotData['status'] as String?;
    _currentProgress = snapshotData['current_progress'] as int?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('user_badges')
          : FirebaseFirestore.instance.collectionGroup('user_badges');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('user_badges').doc(id);

  static Stream<UserBadgesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserBadgesRecord.fromSnapshot(s));

  static Future<UserBadgesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserBadgesRecord.fromSnapshot(s));

  static UserBadgesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserBadgesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserBadgesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserBadgesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserBadgesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserBadgesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserBadgesRecordData({
  DocumentReference? badgeRef,
  DateTime? earnedTime,
  String? status,
  int? currentProgress,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'badge_ref': badgeRef,
      'earned_time': earnedTime,
      'status': status,
      'current_progress': currentProgress,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserBadgesRecordDocumentEquality implements Equality<UserBadgesRecord> {
  const UserBadgesRecordDocumentEquality();

  @override
  bool equals(UserBadgesRecord? e1, UserBadgesRecord? e2) {
    return e1?.badgeRef == e2?.badgeRef &&
        e1?.earnedTime == e2?.earnedTime &&
        e1?.status == e2?.status;
  }

  @override
  int hash(UserBadgesRecord? e) =>
      const ListEquality().hash([e?.badgeRef, e?.earnedTime, e?.status]);

  @override
  bool isValidKey(Object? o) => o is UserBadgesRecord;
}
