import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CommentRecord extends FirestoreRecord {
  CommentRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "comment" field.
  String? _comment;
  String get comment => _comment ?? '';
  bool hasComment() => _comment != null;

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  bool hasTime() => _time != null;

  // "postref" field.
  DocumentReference? _postref;
  DocumentReference? get postref => _postref;
  bool hasPostref() => _postref != null;

  // "userref" field.
  DocumentReference? _userref;
  DocumentReference? get userref => _userref;
  bool hasUserref() => _userref != null;

  // "CommentNum" field.
  int? _commentNum;
  int get commentNum => _commentNum ?? 0;
  bool hasCommentNum() => _commentNum != null;

  // "Comref" field.
  DocumentReference? _comref;
  DocumentReference? get comref => _comref;
  bool hasComref() => _comref != null;

  // "community_owner_uid" field.
  String? _communityOwnerUid;
  String get communityOwnerUid => _communityOwnerUid ?? '';
  bool hasCommunityOwnerUid() => _communityOwnerUid != null;

  // "reportcount2" field.
  int? _reportcount2;
  int get reportcount2 => _reportcount2 ?? 0;
  bool hasReportcount2() => _reportcount2 != null;

  void _initializeFields() {
    _comment = snapshotData['comment'] as String?;
    _time = snapshotData['time'] as DateTime?;
    _postref = snapshotData['postref'] as DocumentReference?;
    _userref = snapshotData['userref'] as DocumentReference?;
    _commentNum = castToType<int>(snapshotData['CommentNum']);
    _comref = snapshotData['Comref'] as DocumentReference?;
    _communityOwnerUid = snapshotData['community_owner_uid'] as String?;
    _reportcount2 = castToType<int>(snapshotData['reportcount2']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('comment');

  static Stream<CommentRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CommentRecord.fromSnapshot(s));

  static Future<CommentRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CommentRecord.fromSnapshot(s));

  static CommentRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CommentRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CommentRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CommentRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CommentRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CommentRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCommentRecordData({
  String? comment,
  DateTime? time,
  DocumentReference? postref,
  DocumentReference? userref,
  int? commentNum,
  DocumentReference? comref,
  String? communityOwnerUid,
  int? reportcount2,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'comment': comment,
      'time': time,
      'postref': postref,
      'userref': userref,
      'CommentNum': commentNum,
      'Comref': comref,
      'community_owner_uid': communityOwnerUid,
      'reportcount2': reportcount2,
    }.withoutNulls,
  );

  return firestoreData;
}

class CommentRecordDocumentEquality implements Equality<CommentRecord> {
  const CommentRecordDocumentEquality();

  @override
  bool equals(CommentRecord? e1, CommentRecord? e2) {
    return e1?.comment == e2?.comment &&
        e1?.time == e2?.time &&
        e1?.postref == e2?.postref &&
        e1?.userref == e2?.userref &&
        e1?.commentNum == e2?.commentNum &&
        e1?.comref == e2?.comref &&
        e1?.communityOwnerUid == e2?.communityOwnerUid &&
        e1?.reportcount2 == e2?.reportcount2;
  }

  @override
  int hash(CommentRecord? e) => const ListEquality().hash([
        e?.comment,
        e?.time,
        e?.postref,
        e?.userref,
        e?.commentNum,
        e?.comref,
        e?.communityOwnerUid,
        e?.reportcount2
      ]);

  @override
  bool isValidKey(Object? o) => o is CommentRecord;
}
