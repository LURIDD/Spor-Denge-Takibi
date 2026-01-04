import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BadgesRecord extends FirestoreRecord {
  BadgesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "criteria" field.
  String? _criteria;
  String get criteria => _criteria ?? '';
  bool hasCriteria() => _criteria != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "target" field.
  int? _target;
  int get target => _target ?? 0;
  bool hasTarget() => _target != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _image = snapshotData['image'] as String?;
    _criteria = snapshotData['criteria'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _target = snapshotData['target'] as int?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('badges');

  static Stream<BadgesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BadgesRecord.fromSnapshot(s));

  static Future<BadgesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BadgesRecord.fromSnapshot(s));

  static BadgesRecord fromSnapshot(DocumentSnapshot snapshot) => BadgesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BadgesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BadgesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BadgesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BadgesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBadgesRecordData({
  String? name,
  String? description,
  String? image,
  String? criteria,
  DateTime? createdTime,
  int? target,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'description': description,
      'image': image,
      'criteria': criteria,
      'created_time': createdTime,
      'target': target,
    }.withoutNulls,
  );

  return firestoreData;
}

class BadgesRecordDocumentEquality implements Equality<BadgesRecord> {
  const BadgesRecordDocumentEquality();

  @override
  bool equals(BadgesRecord? e1, BadgesRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.description == e2?.description &&
        e1?.image == e2?.image &&
        e1?.criteria == e2?.criteria &&
        e1?.createdTime == e2?.createdTime;
  }

  @override
  int hash(BadgesRecord? e) => const ListEquality()
      .hash([e?.name, e?.description, e?.image, e?.criteria, e?.createdTime]);

  @override
  bool isValidKey(Object? o) => o is BadgesRecord;
}
