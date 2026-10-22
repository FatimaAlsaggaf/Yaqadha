import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class JoinRequestsRecord extends FirestoreRecord {
  JoinRequestsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "UserID" field.
  String? _userID;
  String get userID => _userID ?? '';
  bool hasUserID() => _userID != null;

  // "community_ref" field.
  DocumentReference? _communityRef;
  DocumentReference? get communityRef => _communityRef;
  bool hasCommunityRef() => _communityRef != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "disply_name" field.
  String? _displyName;
  String get displyName => _displyName ?? '';
  bool hasDisplyName() => _displyName != null;

  // "photp_url" field.
  String? _photpUrl;
  String get photpUrl => _photpUrl ?? '';
  bool hasPhotpUrl() => _photpUrl != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _userID = snapshotData['UserID'] as String?;
    _communityRef = snapshotData['community_ref'] as DocumentReference?;
    _status = snapshotData['status'] as String?;
    _displyName = snapshotData['disply_name'] as String?;
    _photpUrl = snapshotData['photp_url'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('joinRequests')
          : FirebaseFirestore.instance.collectionGroup('joinRequests');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('joinRequests').doc(id);

  static Stream<JoinRequestsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => JoinRequestsRecord.fromSnapshot(s));

  static Future<JoinRequestsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => JoinRequestsRecord.fromSnapshot(s));

  static JoinRequestsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      JoinRequestsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static JoinRequestsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      JoinRequestsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'JoinRequestsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is JoinRequestsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createJoinRequestsRecordData({
  String? userID,
  DocumentReference? communityRef,
  String? status,
  String? displyName,
  String? photpUrl,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'UserID': userID,
      'community_ref': communityRef,
      'status': status,
      'disply_name': displyName,
      'photp_url': photpUrl,
    }.withoutNulls,
  );

  return firestoreData;
}

class JoinRequestsRecordDocumentEquality
    implements Equality<JoinRequestsRecord> {
  const JoinRequestsRecordDocumentEquality();

  @override
  bool equals(JoinRequestsRecord? e1, JoinRequestsRecord? e2) {
    return e1?.userID == e2?.userID &&
        e1?.communityRef == e2?.communityRef &&
        e1?.status == e2?.status &&
        e1?.displyName == e2?.displyName &&
        e1?.photpUrl == e2?.photpUrl;
  }

  @override
  int hash(JoinRequestsRecord? e) => const ListEquality().hash(
      [e?.userID, e?.communityRef, e?.status, e?.displyName, e?.photpUrl]);

  @override
  bool isValidKey(Object? o) => o is JoinRequestsRecord;
}
