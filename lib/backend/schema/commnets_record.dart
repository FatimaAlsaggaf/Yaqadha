import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CommnetsRecord extends FirestoreRecord {
  CommnetsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "PostRef" field.
  DocumentReference? _postRef;
  DocumentReference? get postRef => _postRef;
  bool hasPostRef() => _postRef != null;

  // "Time" field.
  DateTime? _time;
  DateTime? get time => _time;
  bool hasTime() => _time != null;

  // "comentText" field.
  String? _comentText;
  String get comentText => _comentText ?? '';
  bool hasComentText() => _comentText != null;

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "CommentNum" field.
  int? _commentNum;
  int get commentNum => _commentNum ?? 0;
  bool hasCommentNum() => _commentNum != null;

  // "ComRef" field.
  DocumentReference? _comRef;
  DocumentReference? get comRef => _comRef;
  bool hasComRef() => _comRef != null;

  // "CommuntiyOwner" field.
  String? _communtiyOwner;
  String get communtiyOwner => _communtiyOwner ?? '';
  bool hasCommuntiyOwner() => _communtiyOwner != null;

  // "reportcount22" field.
  int? _reportcount22;
  int get reportcount22 => _reportcount22 ?? 0;
  bool hasReportcount22() => _reportcount22 != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _postRef = snapshotData['PostRef'] as DocumentReference?;
    _time = snapshotData['Time'] as DateTime?;
    _comentText = snapshotData['comentText'] as String?;
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _commentNum = castToType<int>(snapshotData['CommentNum']);
    _comRef = snapshotData['ComRef'] as DocumentReference?;
    _communtiyOwner = snapshotData['CommuntiyOwner'] as String?;
    _reportcount22 = castToType<int>(snapshotData['reportcount22']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Commnets')
          : FirebaseFirestore.instance.collectionGroup('Commnets');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('Commnets').doc(id);

  static Stream<CommnetsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CommnetsRecord.fromSnapshot(s));

  static Future<CommnetsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CommnetsRecord.fromSnapshot(s));

  static CommnetsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CommnetsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CommnetsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CommnetsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CommnetsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CommnetsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCommnetsRecordData({
  DocumentReference? postRef,
  DateTime? time,
  String? comentText,
  DocumentReference? userRef,
  int? commentNum,
  DocumentReference? comRef,
  String? communtiyOwner,
  int? reportcount22,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'PostRef': postRef,
      'Time': time,
      'comentText': comentText,
      'userRef': userRef,
      'CommentNum': commentNum,
      'ComRef': comRef,
      'CommuntiyOwner': communtiyOwner,
      'reportcount22': reportcount22,
    }.withoutNulls,
  );

  return firestoreData;
}

class CommnetsRecordDocumentEquality implements Equality<CommnetsRecord> {
  const CommnetsRecordDocumentEquality();

  @override
  bool equals(CommnetsRecord? e1, CommnetsRecord? e2) {
    return e1?.postRef == e2?.postRef &&
        e1?.time == e2?.time &&
        e1?.comentText == e2?.comentText &&
        e1?.userRef == e2?.userRef &&
        e1?.commentNum == e2?.commentNum &&
        e1?.comRef == e2?.comRef &&
        e1?.communtiyOwner == e2?.communtiyOwner &&
        e1?.reportcount22 == e2?.reportcount22;
  }

  @override
  int hash(CommnetsRecord? e) => const ListEquality().hash([
        e?.postRef,
        e?.time,
        e?.comentText,
        e?.userRef,
        e?.commentNum,
        e?.comRef,
        e?.communtiyOwner,
        e?.reportcount22
      ]);

  @override
  bool isValidKey(Object? o) => o is CommnetsRecord;
}
