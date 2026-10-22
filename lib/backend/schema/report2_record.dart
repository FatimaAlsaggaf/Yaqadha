import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class Report2Record extends FirestoreRecord {
  Report2Record._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "reportedby" field.
  DocumentReference? _reportedby;
  DocumentReference? get reportedby => _reportedby;
  bool hasReportedby() => _reportedby != null;

  // "reason" field.
  String? _reason;
  String get reason => _reason ?? '';
  bool hasReason() => _reason != null;

  // "timestamp" field.
  CalendarDayStruct? _timestamp;
  CalendarDayStruct get timestamp => _timestamp ?? CalendarDayStruct();
  bool hasTimestamp() => _timestamp != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _reportedby = snapshotData['reportedby'] as DocumentReference?;
    _reason = snapshotData['reason'] as String?;
    _timestamp = snapshotData['timestamp'] is CalendarDayStruct
        ? snapshotData['timestamp']
        : CalendarDayStruct.maybeFromMap(snapshotData['timestamp']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('report2')
          : FirebaseFirestore.instance.collectionGroup('report2');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('report2').doc(id);

  static Stream<Report2Record> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => Report2Record.fromSnapshot(s));

  static Future<Report2Record> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => Report2Record.fromSnapshot(s));

  static Report2Record fromSnapshot(DocumentSnapshot snapshot) =>
      Report2Record._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static Report2Record getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      Report2Record._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'Report2Record(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is Report2Record &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createReport2RecordData({
  DocumentReference? reportedby,
  String? reason,
  CalendarDayStruct? timestamp,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'reportedby': reportedby,
      'reason': reason,
      'timestamp': CalendarDayStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "timestamp" field.
  addCalendarDayStructData(firestoreData, timestamp, 'timestamp');

  return firestoreData;
}

class Report2RecordDocumentEquality implements Equality<Report2Record> {
  const Report2RecordDocumentEquality();

  @override
  bool equals(Report2Record? e1, Report2Record? e2) {
    return e1?.reportedby == e2?.reportedby &&
        e1?.reason == e2?.reason &&
        e1?.timestamp == e2?.timestamp;
  }

  @override
  int hash(Report2Record? e) =>
      const ListEquality().hash([e?.reportedby, e?.reason, e?.timestamp]);

  @override
  bool isValidKey(Object? o) => o is Report2Record;
}
