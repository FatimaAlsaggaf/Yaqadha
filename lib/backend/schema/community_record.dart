import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CommunityRecord extends FirestoreRecord {
  CommunityRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "OwnerID" field.
  String? _ownerID;
  String get ownerID => _ownerID ?? '';
  bool hasOwnerID() => _ownerID != null;

  // "Description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "Photo" field.
  String? _photo;
  String get photo => _photo ?? '';
  bool hasPhoto() => _photo != null;

  // "Status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "CommunityName" field.
  String? _communityName;
  String get communityName => _communityName ?? '';
  bool hasCommunityName() => _communityName != null;

  // "Members" field.
  List<String>? _members;
  List<String> get members => _members ?? const [];
  bool hasMembers() => _members != null;

  // "PendingRequests" field.
  List<String>? _pendingRequests;
  List<String> get pendingRequests => _pendingRequests ?? const [];
  bool hasPendingRequests() => _pendingRequests != null;

  // "challenge" field.
  int? _challenge;
  int get challenge => _challenge ?? 0;
  bool hasChallenge() => _challenge != null;

  // "winners_day" field.
  String? _winnersDay;
  String get winnersDay => _winnersDay ?? '';
  bool hasWinnersDay() => _winnersDay != null;

  // "winners" field.
  List<DocumentReference>? _winners;
  List<DocumentReference> get winners => _winners ?? const [];
  bool hasWinners() => _winners != null;

  // "membersname" field.
  String? _membersname;
  String get membersname => _membersname ?? '';
  bool hasMembersname() => _membersname != null;

  // "ComGoal" field.
  String? _comGoal;
  String get comGoal => _comGoal ?? '';
  bool hasComGoal() => _comGoal != null;

  // "memberCount" field.
  int? _memberCount;
  int get memberCount => _memberCount ?? 0;
  bool hasMemberCount() => _memberCount != null;

  // "challActiveCom" field.
  bool? _challActiveCom;
  bool get challActiveCom => _challActiveCom ?? false;
  bool hasChallActiveCom() => _challActiveCom != null;

  // "challStepCom" field.
  bool? _challStepCom;
  bool get challStepCom => _challStepCom ?? false;
  bool hasChallStepCom() => _challStepCom != null;

  // "challengeDateStart" field.
  DateTime? _challengeDateStart;
  DateTime? get challengeDateStart => _challengeDateStart;
  bool hasChallengeDateStart() => _challengeDateStart != null;

  // "isRiyadh" field.
  bool? _isRiyadh;
  bool get isRiyadh => _isRiyadh ?? false;
  bool hasIsRiyadh() => _isRiyadh != null;

  // "isJeddah" field.
  bool? _isJeddah;
  bool get isJeddah => _isJeddah ?? false;
  bool hasIsJeddah() => _isJeddah != null;

  // "isAbha" field.
  bool? _isAbha;
  bool get isAbha => _isAbha ?? false;
  bool hasIsAbha() => _isAbha != null;

  void _initializeFields() {
    _ownerID = snapshotData['OwnerID'] as String?;
    _description = snapshotData['Description'] as String?;
    _photo = snapshotData['Photo'] as String?;
    _status = snapshotData['Status'] as String?;
    _communityName = snapshotData['CommunityName'] as String?;
    _members = getDataList(snapshotData['Members']);
    _pendingRequests = getDataList(snapshotData['PendingRequests']);
    _challenge = castToType<int>(snapshotData['challenge']);
    _winnersDay = snapshotData['winners_day'] as String?;
    _winners = getDataList(snapshotData['winners']);
    _membersname = snapshotData['membersname'] as String?;
    _comGoal = snapshotData['ComGoal'] as String?;
    _memberCount = castToType<int>(snapshotData['memberCount']);
    _challActiveCom = snapshotData['challActiveCom'] as bool?;
    _challStepCom = snapshotData['challStepCom'] as bool?;
    _challengeDateStart = snapshotData['challengeDateStart'] as DateTime?;
    _isRiyadh = snapshotData['isRiyadh'] as bool?;
    _isJeddah = snapshotData['isJeddah'] as bool?;
    _isAbha = snapshotData['isAbha'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Community');

  static Stream<CommunityRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CommunityRecord.fromSnapshot(s));

  static Future<CommunityRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CommunityRecord.fromSnapshot(s));

  static CommunityRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CommunityRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CommunityRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CommunityRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CommunityRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CommunityRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCommunityRecordData({
  String? ownerID,
  String? description,
  String? photo,
  String? status,
  String? communityName,
  int? challenge,
  String? winnersDay,
  String? membersname,
  String? comGoal,
  int? memberCount,
  bool? challActiveCom,
  bool? challStepCom,
  DateTime? challengeDateStart,
  bool? isRiyadh,
  bool? isJeddah,
  bool? isAbha,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'OwnerID': ownerID,
      'Description': description,
      'Photo': photo,
      'Status': status,
      'CommunityName': communityName,
      'challenge': challenge,
      'winners_day': winnersDay,
      'membersname': membersname,
      'ComGoal': comGoal,
      'memberCount': memberCount,
      'challActiveCom': challActiveCom,
      'challStepCom': challStepCom,
      'challengeDateStart': challengeDateStart,
      'isRiyadh': isRiyadh,
      'isJeddah': isJeddah,
      'isAbha': isAbha,
    }.withoutNulls,
  );

  return firestoreData;
}

class CommunityRecordDocumentEquality implements Equality<CommunityRecord> {
  const CommunityRecordDocumentEquality();

  @override
  bool equals(CommunityRecord? e1, CommunityRecord? e2) {
    const listEquality = ListEquality();
    return e1?.ownerID == e2?.ownerID &&
        e1?.description == e2?.description &&
        e1?.photo == e2?.photo &&
        e1?.status == e2?.status &&
        e1?.communityName == e2?.communityName &&
        listEquality.equals(e1?.members, e2?.members) &&
        listEquality.equals(e1?.pendingRequests, e2?.pendingRequests) &&
        e1?.challenge == e2?.challenge &&
        e1?.winnersDay == e2?.winnersDay &&
        listEquality.equals(e1?.winners, e2?.winners) &&
        e1?.membersname == e2?.membersname &&
        e1?.comGoal == e2?.comGoal &&
        e1?.memberCount == e2?.memberCount &&
        e1?.challActiveCom == e2?.challActiveCom &&
        e1?.challStepCom == e2?.challStepCom &&
        e1?.challengeDateStart == e2?.challengeDateStart &&
        e1?.isRiyadh == e2?.isRiyadh &&
        e1?.isJeddah == e2?.isJeddah &&
        e1?.isAbha == e2?.isAbha;
  }

  @override
  int hash(CommunityRecord? e) => const ListEquality().hash([
        e?.ownerID,
        e?.description,
        e?.photo,
        e?.status,
        e?.communityName,
        e?.members,
        e?.pendingRequests,
        e?.challenge,
        e?.winnersDay,
        e?.winners,
        e?.membersname,
        e?.comGoal,
        e?.memberCount,
        e?.challActiveCom,
        e?.challStepCom,
        e?.challengeDateStart,
        e?.isRiyadh,
        e?.isJeddah,
        e?.isAbha
      ]);

  @override
  bool isValidKey(Object? o) => o is CommunityRecord;
}
