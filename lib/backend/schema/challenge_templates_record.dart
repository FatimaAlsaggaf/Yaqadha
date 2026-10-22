import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChallengeTemplatesRecord extends FirestoreRecord {
  ChallengeTemplatesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "defaultDescription" field.
  String? _defaultDescription;
  String get defaultDescription => _defaultDescription ?? '';
  bool hasDefaultDescription() => _defaultDescription != null;

  // "needsTargetValue" field.
  bool? _needsTargetValue;
  bool get needsTargetValue => _needsTargetValue ?? false;
  bool hasNeedsTargetValue() => _needsTargetValue != null;

  // "templateType" field.
  String? _templateType;
  String get templateType => _templateType ?? '';
  bool hasTemplateType() => _templateType != null;

  // "titleChall" field.
  String? _titleChall;
  String get titleChall => _titleChall ?? '';
  bool hasTitleChall() => _titleChall != null;

  // "comRef" field.
  DocumentReference? _comRef;
  DocumentReference? get comRef => _comRef;
  bool hasComRef() => _comRef != null;

  // "startDate" field.
  DateTime? _startDate;
  DateTime? get startDate => _startDate;
  bool hasStartDate() => _startDate != null;

  // "isCompeletedComChall" field.
  bool? _isCompeletedComChall;
  bool get isCompeletedComChall => _isCompeletedComChall ?? false;
  bool hasIsCompeletedComChall() => _isCompeletedComChall != null;

  // "challActive" field.
  bool? _challActive;
  bool get challActive => _challActive ?? false;
  bool hasChallActive() => _challActive != null;

  // "StepNum" field.
  int? _stepNum;
  int get stepNum => _stepNum ?? 0;
  bool hasStepNum() => _stepNum != null;

  // "completed_by_users" field.
  List<DocumentReference>? _completedByUsers;
  List<DocumentReference> get completedByUsers => _completedByUsers ?? const [];
  bool hasCompletedByUsers() => _completedByUsers != null;

  // "isRewardDistributed" field.
  bool? _isRewardDistributed;
  bool get isRewardDistributed => _isRewardDistributed ?? false;
  bool hasIsRewardDistributed() => _isRewardDistributed != null;

  void _initializeFields() {
    _defaultDescription = snapshotData['defaultDescription'] as String?;
    _needsTargetValue = snapshotData['needsTargetValue'] as bool?;
    _templateType = snapshotData['templateType'] as String?;
    _titleChall = snapshotData['titleChall'] as String?;
    _comRef = snapshotData['comRef'] as DocumentReference?;
    _startDate = snapshotData['startDate'] as DateTime?;
    _isCompeletedComChall = snapshotData['isCompeletedComChall'] as bool?;
    _challActive = snapshotData['challActive'] as bool?;
    _stepNum = castToType<int>(snapshotData['StepNum']);
    _completedByUsers = getDataList(snapshotData['completed_by_users']);
    _isRewardDistributed = snapshotData['isRewardDistributed'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('challengeTemplates');

  static Stream<ChallengeTemplatesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChallengeTemplatesRecord.fromSnapshot(s));

  static Future<ChallengeTemplatesRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => ChallengeTemplatesRecord.fromSnapshot(s));

  static ChallengeTemplatesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ChallengeTemplatesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChallengeTemplatesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChallengeTemplatesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChallengeTemplatesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChallengeTemplatesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChallengeTemplatesRecordData({
  String? defaultDescription,
  bool? needsTargetValue,
  String? templateType,
  String? titleChall,
  DocumentReference? comRef,
  DateTime? startDate,
  bool? isCompeletedComChall,
  bool? challActive,
  int? stepNum,
  bool? isRewardDistributed,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'defaultDescription': defaultDescription,
      'needsTargetValue': needsTargetValue,
      'templateType': templateType,
      'titleChall': titleChall,
      'comRef': comRef,
      'startDate': startDate,
      'isCompeletedComChall': isCompeletedComChall,
      'challActive': challActive,
      'StepNum': stepNum,
      'isRewardDistributed': isRewardDistributed,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChallengeTemplatesRecordDocumentEquality
    implements Equality<ChallengeTemplatesRecord> {
  const ChallengeTemplatesRecordDocumentEquality();

  @override
  bool equals(ChallengeTemplatesRecord? e1, ChallengeTemplatesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.defaultDescription == e2?.defaultDescription &&
        e1?.needsTargetValue == e2?.needsTargetValue &&
        e1?.templateType == e2?.templateType &&
        e1?.titleChall == e2?.titleChall &&
        e1?.comRef == e2?.comRef &&
        e1?.startDate == e2?.startDate &&
        e1?.isCompeletedComChall == e2?.isCompeletedComChall &&
        e1?.challActive == e2?.challActive &&
        e1?.stepNum == e2?.stepNum &&
        listEquality.equals(e1?.completedByUsers, e2?.completedByUsers) &&
        e1?.isRewardDistributed == e2?.isRewardDistributed;
  }

  @override
  int hash(ChallengeTemplatesRecord? e) => const ListEquality().hash([
        e?.defaultDescription,
        e?.needsTargetValue,
        e?.templateType,
        e?.titleChall,
        e?.comRef,
        e?.startDate,
        e?.isCompeletedComChall,
        e?.challActive,
        e?.stepNum,
        e?.completedByUsers,
        e?.isRewardDistributed
      ]);

  @override
  bool isValidKey(Object? o) => o is ChallengeTemplatesRecord;
}
