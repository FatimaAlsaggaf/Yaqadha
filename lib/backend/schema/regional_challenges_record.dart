import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RegionalChallengesRecord extends FirestoreRecord {
  RegionalChallengesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "challenge_EndDate" field.
  DateTime? _challengeEndDate;
  DateTime? get challengeEndDate => _challengeEndDate;
  bool hasChallengeEndDate() => _challengeEndDate != null;

  // "challenge_StartDate" field.
  DateTime? _challengeStartDate;
  DateTime? get challengeStartDate => _challengeStartDate;
  bool hasChallengeStartDate() => _challengeStartDate != null;

  // "completed_by_usersR" field.
  List<DocumentReference>? _completedByUsersR;
  List<DocumentReference> get completedByUsersR =>
      _completedByUsersR ?? const [];
  bool hasCompletedByUsersR() => _completedByUsersR != null;

  // "participants_count" field.
  int? _participantsCount;
  int get participantsCount => _participantsCount ?? 0;
  bool hasParticipantsCount() => _participantsCount != null;

  // "target_city" field.
  String? _targetCity;
  String get targetCity => _targetCity ?? '';
  bool hasTargetCity() => _targetCity != null;

  // "titleOfChall" field.
  String? _titleOfChall;
  String get titleOfChall => _titleOfChall ?? '';
  bool hasTitleOfChall() => _titleOfChall != null;

  // "Description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "DescriptionOfChall" field.
  String? _descriptionOfChall;
  String get descriptionOfChall => _descriptionOfChall ?? '';
  bool hasDescriptionOfChall() => _descriptionOfChall != null;

  // "Location" field.
  String? _location;
  String get location => _location ?? '';
  bool hasLocation() => _location != null;

  // "imageUrl" field.
  String? _imageUrl;
  String get imageUrl => _imageUrl ?? '';
  bool hasImageUrl() => _imageUrl != null;

  // "is_active" field.
  bool? _isActive;
  bool get isActive => _isActive ?? false;
  bool hasIsActive() => _isActive != null;

  // "completedCounts" field.
  int? _completedCounts;
  int get completedCounts => _completedCounts ?? 0;
  bool hasCompletedCounts() => _completedCounts != null;

  void _initializeFields() {
    _challengeEndDate = snapshotData['challenge_EndDate'] as DateTime?;
    _challengeStartDate = snapshotData['challenge_StartDate'] as DateTime?;
    _completedByUsersR = getDataList(snapshotData['completed_by_usersR']);
    _participantsCount = castToType<int>(snapshotData['participants_count']);
    _targetCity = snapshotData['target_city'] as String?;
    _titleOfChall = snapshotData['titleOfChall'] as String?;
    _description = snapshotData['Description'] as String?;
    _descriptionOfChall = snapshotData['DescriptionOfChall'] as String?;
    _location = snapshotData['Location'] as String?;
    _imageUrl = snapshotData['imageUrl'] as String?;
    _isActive = snapshotData['is_active'] as bool?;
    _completedCounts = castToType<int>(snapshotData['completedCounts']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('RegionalChallenges');

  static Stream<RegionalChallengesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RegionalChallengesRecord.fromSnapshot(s));

  static Future<RegionalChallengesRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => RegionalChallengesRecord.fromSnapshot(s));

  static RegionalChallengesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RegionalChallengesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RegionalChallengesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RegionalChallengesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RegionalChallengesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RegionalChallengesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRegionalChallengesRecordData({
  DateTime? challengeEndDate,
  DateTime? challengeStartDate,
  int? participantsCount,
  String? targetCity,
  String? titleOfChall,
  String? description,
  String? descriptionOfChall,
  String? location,
  String? imageUrl,
  bool? isActive,
  int? completedCounts,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'challenge_EndDate': challengeEndDate,
      'challenge_StartDate': challengeStartDate,
      'participants_count': participantsCount,
      'target_city': targetCity,
      'titleOfChall': titleOfChall,
      'Description': description,
      'DescriptionOfChall': descriptionOfChall,
      'Location': location,
      'imageUrl': imageUrl,
      'is_active': isActive,
      'completedCounts': completedCounts,
    }.withoutNulls,
  );

  return firestoreData;
}

class RegionalChallengesRecordDocumentEquality
    implements Equality<RegionalChallengesRecord> {
  const RegionalChallengesRecordDocumentEquality();

  @override
  bool equals(RegionalChallengesRecord? e1, RegionalChallengesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.challengeEndDate == e2?.challengeEndDate &&
        e1?.challengeStartDate == e2?.challengeStartDate &&
        listEquality.equals(e1?.completedByUsersR, e2?.completedByUsersR) &&
        e1?.participantsCount == e2?.participantsCount &&
        e1?.targetCity == e2?.targetCity &&
        e1?.titleOfChall == e2?.titleOfChall &&
        e1?.description == e2?.description &&
        e1?.descriptionOfChall == e2?.descriptionOfChall &&
        e1?.location == e2?.location &&
        e1?.imageUrl == e2?.imageUrl &&
        e1?.isActive == e2?.isActive &&
        e1?.completedCounts == e2?.completedCounts;
  }

  @override
  int hash(RegionalChallengesRecord? e) => const ListEquality().hash([
        e?.challengeEndDate,
        e?.challengeStartDate,
        e?.completedByUsersR,
        e?.participantsCount,
        e?.targetCity,
        e?.titleOfChall,
        e?.description,
        e?.descriptionOfChall,
        e?.location,
        e?.imageUrl,
        e?.isActive,
        e?.completedCounts
      ]);

  @override
  bool isValidKey(Object? o) => o is RegionalChallengesRecord;
}
