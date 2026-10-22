import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChallengeProofsRecord extends FirestoreRecord {
  ChallengeProofsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "challengeRef" field.
  DocumentReference? _challengeRef;
  DocumentReference? get challengeRef => _challengeRef;
  bool hasChallengeRef() => _challengeRef != null;

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "Photo" field.
  String? _photo;
  String get photo => _photo ?? '';
  bool hasPhoto() => _photo != null;

  // "isPointAwarded" field.
  bool? _isPointAwarded;
  bool get isPointAwarded => _isPointAwarded ?? false;
  bool hasIsPointAwarded() => _isPointAwarded != null;

  // "ttiimee" field.
  DateTime? _ttiimee;
  DateTime? get ttiimee => _ttiimee;
  bool hasTtiimee() => _ttiimee != null;

  void _initializeFields() {
    _challengeRef = snapshotData['challengeRef'] as DocumentReference?;
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _photo = snapshotData['Photo'] as String?;
    _isPointAwarded = snapshotData['isPointAwarded'] as bool?;
    _ttiimee = snapshotData['ttiimee'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ChallengeProofs');

  static Stream<ChallengeProofsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChallengeProofsRecord.fromSnapshot(s));

  static Future<ChallengeProofsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChallengeProofsRecord.fromSnapshot(s));

  static ChallengeProofsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ChallengeProofsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChallengeProofsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChallengeProofsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChallengeProofsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChallengeProofsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChallengeProofsRecordData({
  DocumentReference? challengeRef,
  DocumentReference? userRef,
  String? photo,
  bool? isPointAwarded,
  DateTime? ttiimee,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'challengeRef': challengeRef,
      'userRef': userRef,
      'Photo': photo,
      'isPointAwarded': isPointAwarded,
      'ttiimee': ttiimee,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChallengeProofsRecordDocumentEquality
    implements Equality<ChallengeProofsRecord> {
  const ChallengeProofsRecordDocumentEquality();

  @override
  bool equals(ChallengeProofsRecord? e1, ChallengeProofsRecord? e2) {
    return e1?.challengeRef == e2?.challengeRef &&
        e1?.userRef == e2?.userRef &&
        e1?.photo == e2?.photo &&
        e1?.isPointAwarded == e2?.isPointAwarded &&
        e1?.ttiimee == e2?.ttiimee;
  }

  @override
  int hash(ChallengeProofsRecord? e) => const ListEquality().hash(
      [e?.challengeRef, e?.userRef, e?.photo, e?.isPointAwarded, e?.ttiimee]);

  @override
  bool isValidKey(Object? o) => o is ChallengeProofsRecord;
}
