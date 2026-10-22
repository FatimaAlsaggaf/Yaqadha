import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReportsRecord extends FirestoreRecord {
  ReportsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "reportedBy" field.
  DocumentReference? _reportedBy;
  DocumentReference? get reportedBy => _reportedBy;
  bool hasReportedBy() => _reportedBy != null;

  // "reason" field.
  String? _reason;
  String get reason => _reason ?? '';
  bool hasReason() => _reason != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _reportedBy = snapshotData['reportedBy'] as DocumentReference?;
    _reason = snapshotData['reason'] as String?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('reports')
          : FirebaseFirestore.instance.collectionGroup('reports');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('reports').doc(id);

  static Stream<ReportsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ReportsRecord.fromSnapshot(s));

  static Future<ReportsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ReportsRecord.fromSnapshot(s));

  static ReportsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ReportsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ReportsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ReportsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ReportsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ReportsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createReportsRecordData({
  DocumentReference? reportedBy,
  String? reason,
  DateTime? timestamp,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'reportedBy': reportedBy,
      'reason': reason,
      'timestamp': timestamp,
    }.withoutNulls,
  );

  return firestoreData;
}

class ReportsRecordDocumentEquality implements Equality<ReportsRecord> {
  const ReportsRecordDocumentEquality();

  @override
  bool equals(ReportsRecord? e1, ReportsRecord? e2) {
    return e1?.reportedBy == e2?.reportedBy &&
        e1?.reason == e2?.reason &&
        e1?.timestamp == e2?.timestamp;
  }

  @override
  int hash(ReportsRecord? e) =>
      const ListEquality().hash([e?.reportedBy, e?.reason, e?.timestamp]);

  @override
  bool isValidKey(Object? o) => o is ReportsRecord;
}
