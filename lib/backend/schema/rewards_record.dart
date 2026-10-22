import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RewardsRecord extends FirestoreRecord {
  RewardsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "pointsCost" field.
  int? _pointsCost;
  int get pointsCost => _pointsCost ?? 0;
  bool hasPointsCost() => _pointsCost != null;

  // "Code" field.
  String? _code;
  String get code => _code ?? '';
  bool hasCode() => _code != null;

  // "QR" field.
  String? _qr;
  String get qr => _qr ?? '';
  bool hasQr() => _qr != null;

  // "expiryDate" field.
  DateTime? _expiryDate;
  DateTime? get expiryDate => _expiryDate;
  bool hasExpiryDate() => _expiryDate != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "des" field.
  String? _des;
  String get des => _des ?? '';
  bool hasDes() => _des != null;

  // "getby" field.
  List<DocumentReference>? _getby;
  List<DocumentReference> get getby => _getby ?? const [];
  bool hasGetby() => _getby != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _pointsCost = castToType<int>(snapshotData['pointsCost']);
    _code = snapshotData['Code'] as String?;
    _qr = snapshotData['QR'] as String?;
    _expiryDate = snapshotData['expiryDate'] as DateTime?;
    _image = snapshotData['image'] as String?;
    _des = snapshotData['des'] as String?;
    _getby = getDataList(snapshotData['getby']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Rewards');

  static Stream<RewardsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RewardsRecord.fromSnapshot(s));

  static Future<RewardsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RewardsRecord.fromSnapshot(s));

  static RewardsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RewardsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RewardsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RewardsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RewardsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RewardsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRewardsRecordData({
  String? name,
  int? pointsCost,
  String? code,
  String? qr,
  DateTime? expiryDate,
  String? image,
  String? des,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'pointsCost': pointsCost,
      'Code': code,
      'QR': qr,
      'expiryDate': expiryDate,
      'image': image,
      'des': des,
    }.withoutNulls,
  );

  return firestoreData;
}

class RewardsRecordDocumentEquality implements Equality<RewardsRecord> {
  const RewardsRecordDocumentEquality();

  @override
  bool equals(RewardsRecord? e1, RewardsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.pointsCost == e2?.pointsCost &&
        e1?.code == e2?.code &&
        e1?.qr == e2?.qr &&
        e1?.expiryDate == e2?.expiryDate &&
        e1?.image == e2?.image &&
        e1?.des == e2?.des &&
        listEquality.equals(e1?.getby, e2?.getby);
  }

  @override
  int hash(RewardsRecord? e) => const ListEquality().hash([
        e?.name,
        e?.pointsCost,
        e?.code,
        e?.qr,
        e?.expiryDate,
        e?.image,
        e?.des,
        e?.getby
      ]);

  @override
  bool isValidKey(Object? o) => o is RewardsRecord;
}
