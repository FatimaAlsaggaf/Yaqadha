import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotificationRecord extends FirestoreRecord {
  NotificationRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userID" field.
  String? _userID;
  String get userID => _userID ?? '';
  bool hasUserID() => _userID != null;

  // "notification_title" field.
  String? _notificationTitle;
  String get notificationTitle => _notificationTitle ?? '';
  bool hasNotificationTitle() => _notificationTitle != null;

  // "notification_body" field.
  String? _notificationBody;
  String get notificationBody => _notificationBody ?? '';
  bool hasNotificationBody() => _notificationBody != null;

  // "notification_timestamp" field.
  DateTime? _notificationTimestamp;
  DateTime? get notificationTimestamp => _notificationTimestamp;
  bool hasNotificationTimestamp() => _notificationTimestamp != null;

  // "is_read" field.
  bool? _isRead;
  bool get isRead => _isRead ?? false;
  bool hasIsRead() => _isRead != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _userID = snapshotData['userID'] as String?;
    _notificationTitle = snapshotData['notification_title'] as String?;
    _notificationBody = snapshotData['notification_body'] as String?;
    _notificationTimestamp =
        snapshotData['notification_timestamp'] as DateTime?;
    _isRead = snapshotData['is_read'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Notification')
          : FirebaseFirestore.instance.collectionGroup('Notification');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('Notification').doc(id);

  static Stream<NotificationRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NotificationRecord.fromSnapshot(s));

  static Future<NotificationRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NotificationRecord.fromSnapshot(s));

  static NotificationRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NotificationRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NotificationRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NotificationRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NotificationRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NotificationRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNotificationRecordData({
  String? userID,
  String? notificationTitle,
  String? notificationBody,
  DateTime? notificationTimestamp,
  bool? isRead,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userID': userID,
      'notification_title': notificationTitle,
      'notification_body': notificationBody,
      'notification_timestamp': notificationTimestamp,
      'is_read': isRead,
    }.withoutNulls,
  );

  return firestoreData;
}

class NotificationRecordDocumentEquality
    implements Equality<NotificationRecord> {
  const NotificationRecordDocumentEquality();

  @override
  bool equals(NotificationRecord? e1, NotificationRecord? e2) {
    return e1?.userID == e2?.userID &&
        e1?.notificationTitle == e2?.notificationTitle &&
        e1?.notificationBody == e2?.notificationBody &&
        e1?.notificationTimestamp == e2?.notificationTimestamp &&
        e1?.isRead == e2?.isRead;
  }

  @override
  int hash(NotificationRecord? e) => const ListEquality().hash([
        e?.userID,
        e?.notificationTitle,
        e?.notificationBody,
        e?.notificationTimestamp,
        e?.isRead
      ]);

  @override
  bool isValidKey(Object? o) => o is NotificationRecord;
}
