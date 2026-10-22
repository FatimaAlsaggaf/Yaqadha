import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChallengeHistoryRecord extends FirestoreRecord {
  ChallengeHistoryRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "for_date" field.
  String? _forDate;
  String get forDate => _forDate ?? '';
  bool hasForDate() => _forDate != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "area" field.
  String? _area;
  String get area => _area ?? '';
  bool hasArea() => _area != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "time_slot_num" field.
  int? _timeSlotNum;
  int get timeSlotNum => _timeSlotNum ?? 0;
  bool hasTimeSlotNum() => _timeSlotNum != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "focus_area" field.
  String? _focusArea;
  String get focusArea => _focusArea ?? '';
  bool hasFocusArea() => _focusArea != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _forDate = snapshotData['for_date'] as String?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _area = snapshotData['area'] as String?;
    _description = snapshotData['description'] as String?;
    _timeSlotNum = castToType<int>(snapshotData['time_slot_num']);
    _status = snapshotData['status'] as String?;
    _focusArea = snapshotData['focus_area'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('challenge_history')
          : FirebaseFirestore.instance.collectionGroup('challenge_history');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('challenge_history').doc(id);

  static Stream<ChallengeHistoryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChallengeHistoryRecord.fromSnapshot(s));

  static Future<ChallengeHistoryRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => ChallengeHistoryRecord.fromSnapshot(s));

  static ChallengeHistoryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ChallengeHistoryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChallengeHistoryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChallengeHistoryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChallengeHistoryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChallengeHistoryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChallengeHistoryRecordData({
  String? title,
  String? forDate,
  DateTime? createdAt,
  String? area,
  String? description,
  int? timeSlotNum,
  String? status,
  String? focusArea,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'for_date': forDate,
      'created_at': createdAt,
      'area': area,
      'description': description,
      'time_slot_num': timeSlotNum,
      'status': status,
      'focus_area': focusArea,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChallengeHistoryRecordDocumentEquality
    implements Equality<ChallengeHistoryRecord> {
  const ChallengeHistoryRecordDocumentEquality();

  @override
  bool equals(ChallengeHistoryRecord? e1, ChallengeHistoryRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.forDate == e2?.forDate &&
        e1?.createdAt == e2?.createdAt &&
        e1?.area == e2?.area &&
        e1?.description == e2?.description &&
        e1?.timeSlotNum == e2?.timeSlotNum &&
        e1?.status == e2?.status &&
        e1?.focusArea == e2?.focusArea;
  }

  @override
  int hash(ChallengeHistoryRecord? e) => const ListEquality().hash([
        e?.title,
        e?.forDate,
        e?.createdAt,
        e?.area,
        e?.description,
        e?.timeSlotNum,
        e?.status,
        e?.focusArea
      ]);

  @override
  bool isValidKey(Object? o) => o is ChallengeHistoryRecord;
}
