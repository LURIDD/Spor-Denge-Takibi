import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GoalLogsRecord extends FirestoreRecord {
  GoalLogsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "completed_at" field.
  DateTime? _completedAt;
  DateTime? get completedAt => _completedAt;
  bool hasCompletedAt() => _completedAt != null;

  // "status" field.
  bool? _status;
  bool get status => _status ?? false;
  bool hasStatus() => _status != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _completedAt = snapshotData['completed_at'] as DateTime?;
    _status = snapshotData['status'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('GoalLogs')
          : FirebaseFirestore.instance.collectionGroup('GoalLogs');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('GoalLogs').doc(id);

  static Stream<GoalLogsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GoalLogsRecord.fromSnapshot(s));

  static Future<GoalLogsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GoalLogsRecord.fromSnapshot(s));

  static GoalLogsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      GoalLogsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GoalLogsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GoalLogsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GoalLogsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GoalLogsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGoalLogsRecordData({
  DateTime? completedAt,
  bool? status,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'completed_at': completedAt,
      'status': status,
    }.withoutNulls,
  );

  return firestoreData;
}

class GoalLogsRecordDocumentEquality implements Equality<GoalLogsRecord> {
  const GoalLogsRecordDocumentEquality();

  @override
  bool equals(GoalLogsRecord? e1, GoalLogsRecord? e2) {
    return e1?.completedAt == e2?.completedAt && e1?.status == e2?.status;
  }

  @override
  int hash(GoalLogsRecord? e) =>
      const ListEquality().hash([e?.completedAt, e?.status]);

  @override
  bool isValidKey(Object? o) => o is GoalLogsRecord;
}
