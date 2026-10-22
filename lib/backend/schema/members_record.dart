import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MembersRecord extends FirestoreRecord {
  MembersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "UserID" field.
  String? _userID;
  String get userID => _userID ?? '';
  bool hasUserID() => _userID != null;

  // "Users" field.
  List<DocumentReference>? _users;
  List<DocumentReference> get users => _users ?? const [];
  bool hasUsers() => _users != null;

  // "neme_members" field.
  String? _nemeMembers;
  String get nemeMembers => _nemeMembers ?? '';
  bool hasNemeMembers() => _nemeMembers != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _userID = snapshotData['UserID'] as String?;
    _users = getDataList(snapshotData['Users']);
    _nemeMembers = snapshotData['neme_members'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Members')
          : FirebaseFirestore.instance.collectionGroup('Members');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('Members').doc(id);

  static Stream<MembersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MembersRecord.fromSnapshot(s));

  static Future<MembersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MembersRecord.fromSnapshot(s));

  static MembersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MembersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MembersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MembersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MembersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MembersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMembersRecordData({
  String? userID,
  String? nemeMembers,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'UserID': userID,
      'neme_members': nemeMembers,
    }.withoutNulls,
  );

  return firestoreData;
}

class MembersRecordDocumentEquality implements Equality<MembersRecord> {
  const MembersRecordDocumentEquality();

  @override
  bool equals(MembersRecord? e1, MembersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.userID == e2?.userID &&
        listEquality.equals(e1?.users, e2?.users) &&
        e1?.nemeMembers == e2?.nemeMembers;
  }

  @override
  int hash(MembersRecord? e) =>
      const ListEquality().hash([e?.userID, e?.users, e?.nemeMembers]);

  @override
  bool isValidKey(Object? o) => o is MembersRecord;
}
