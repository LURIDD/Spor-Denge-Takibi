import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DailyStatsRecord extends FirestoreRecord {
  DailyStatsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "score" field.
  double? _score;
  double get score => _score ?? 0.0;
  bool hasScore() => _score != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _score = castToType<double>(snapshotData['score']);
    _date = snapshotData['date'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('daily_stats')
          : FirebaseFirestore.instance.collectionGroup('daily_stats');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('daily_stats').doc(id);

  static Stream<DailyStatsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DailyStatsRecord.fromSnapshot(s));

  static Future<DailyStatsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DailyStatsRecord.fromSnapshot(s));

  static DailyStatsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DailyStatsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DailyStatsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DailyStatsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DailyStatsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DailyStatsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDailyStatsRecordData({
  double? score,
  DateTime? date,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'score': score,
      'date': date,
    }.withoutNulls,
  );

  return firestoreData;
}

class DailyStatsRecordDocumentEquality implements Equality<DailyStatsRecord> {
  const DailyStatsRecordDocumentEquality();

  @override
  bool equals(DailyStatsRecord? e1, DailyStatsRecord? e2) {
    return e1?.score == e2?.score && e1?.date == e2?.date;
  }

  @override
  int hash(DailyStatsRecord? e) =>
      const ListEquality().hash([e?.score, e?.date]);

  @override
  bool isValidKey(Object? o) => o is DailyStatsRecord;
}
