import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChallengesRecord extends FirestoreRecord {
  ChallengesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "focus_area" field.
  String? _focusArea;
  String get focusArea => _focusArea ?? '';
  bool hasFocusArea() => _focusArea != null;

  // "estimated_minutes" field.
  int? _estimatedMinutes;
  int get estimatedMinutes => _estimatedMinutes ?? 0;
  bool hasEstimatedMinutes() => _estimatedMinutes != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "time_slot" field.
  String? _timeSlot;
  String get timeSlot => _timeSlot ?? '';
  bool hasTimeSlot() => _timeSlot != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "for_date" field.
  String? _forDate;
  String get forDate => _forDate ?? '';
  bool hasForDate() => _forDate != null;

  // "time_slot_num" field.
  int? _timeSlotNum;
  int get timeSlotNum => _timeSlotNum ?? 0;
  bool hasTimeSlotNum() => _timeSlotNum != null;

  // "for_date_num" field.
  int? _forDateNum;
  int get forDateNum => _forDateNum ?? 0;
  bool hasForDateNum() => _forDateNum != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _description = snapshotData['description'] as String?;
    _focusArea = snapshotData['focus_area'] as String?;
    _estimatedMinutes = castToType<int>(snapshotData['estimated_minutes']);
    _status = snapshotData['status'] as String?;
    _timeSlot = snapshotData['time_slot'] as String?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _forDate = snapshotData['for_date'] as String?;
    _timeSlotNum = castToType<int>(snapshotData['time_slot_num']);
    _forDateNum = castToType<int>(snapshotData['for_date_num']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('challenges')
          : FirebaseFirestore.instance.collectionGroup('challenges');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('challenges').doc(id);

  static Stream<ChallengesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChallengesRecord.fromSnapshot(s));

  static Future<ChallengesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChallengesRecord.fromSnapshot(s));

  static ChallengesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ChallengesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChallengesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChallengesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChallengesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChallengesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChallengesRecordData({
  String? title,
  String? description,
  String? focusArea,
  int? estimatedMinutes,
  String? status,
  String? timeSlot,
  DateTime? createdAt,
  String? forDate,
  int? timeSlotNum,
  int? forDateNum,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'description': description,
      'focus_area': focusArea,
      'estimated_minutes': estimatedMinutes,
      'status': status,
      'time_slot': timeSlot,
      'created_at': createdAt,
      'for_date': forDate,
      'time_slot_num': timeSlotNum,
      'for_date_num': forDateNum,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChallengesRecordDocumentEquality implements Equality<ChallengesRecord> {
  const ChallengesRecordDocumentEquality();

  @override
  bool equals(ChallengesRecord? e1, ChallengesRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.description == e2?.description &&
        e1?.focusArea == e2?.focusArea &&
        e1?.estimatedMinutes == e2?.estimatedMinutes &&
        e1?.status == e2?.status &&
        e1?.timeSlot == e2?.timeSlot &&
        e1?.createdAt == e2?.createdAt &&
        e1?.forDate == e2?.forDate &&
        e1?.timeSlotNum == e2?.timeSlotNum &&
        e1?.forDateNum == e2?.forDateNum;
  }

  @override
  int hash(ChallengesRecord? e) => const ListEquality().hash([
        e?.title,
        e?.description,
        e?.focusArea,
        e?.estimatedMinutes,
        e?.status,
        e?.timeSlot,
        e?.createdAt,
        e?.forDate,
        e?.timeSlotNum,
        e?.forDateNum
      ]);

  @override
  bool isValidKey(Object? o) => o is ChallengesRecord;
}
