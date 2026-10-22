import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "username" field.
  String? _username;
  String get username => _username ?? '';
  bool hasUsername() => _username != null;

  // "gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  bool hasGender() => _gender != null;

  // "health_goal" field.
  String? _healthGoal;
  String get healthGoal => _healthGoal ?? '';
  bool hasHealthGoal() => _healthGoal != null;

  // "self_rating" field.
  String? _selfRating;
  String get selfRating => _selfRating ?? '';
  bool hasSelfRating() => _selfRating != null;

  // "age" field.
  int? _age;
  int get age => _age ?? 0;
  bool hasAge() => _age != null;

  // "fcm_token" field.
  String? _fcmToken;
  String get fcmToken => _fcmToken ?? '';
  bool hasFcmToken() => _fcmToken != null;

  // "lastNotifyReadTime" field.
  DateTime? _lastNotifyReadTime;
  DateTime? get lastNotifyReadTime => _lastNotifyReadTime;
  bool hasLastNotifyReadTime() => _lastNotifyReadTime != null;

  // "Points" field.
  int? _points;
  int get points => _points ?? 0;
  bool hasPoints() => _points != null;

  // "daily_streak" field.
  int? _dailyStreak;
  int get dailyStreak => _dailyStreak ?? 0;
  bool hasDailyStreak() => _dailyStreak != null;

  // "last_completion_date" field.
  DateTime? _lastCompletionDate;
  DateTime? get lastCompletionDate => _lastCompletionDate;
  bool hasLastCompletionDate() => _lastCompletionDate != null;

  // "getcode" field.
  bool? _getcode;
  bool get getcode => _getcode ?? false;
  bool hasGetcode() => _getcode != null;

  // "region" field.
  String? _region;
  String get region => _region ?? '';
  bool hasRegion() => _region != null;

  // "getreward" field.
  bool? _getreward;
  bool get getreward => _getreward ?? false;
  bool hasGetreward() => _getreward != null;

  // "Posts" field.
  List<DocumentReference>? _posts;
  List<DocumentReference> get posts => _posts ?? const [];
  bool hasPosts() => _posts != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _username = snapshotData['username'] as String?;
    _gender = snapshotData['gender'] as String?;
    _healthGoal = snapshotData['health_goal'] as String?;
    _selfRating = snapshotData['self_rating'] as String?;
    _age = castToType<int>(snapshotData['age']);
    _fcmToken = snapshotData['fcm_token'] as String?;
    _lastNotifyReadTime = snapshotData['lastNotifyReadTime'] as DateTime?;
    _points = castToType<int>(snapshotData['Points']);
    _dailyStreak = castToType<int>(snapshotData['daily_streak']);
    _lastCompletionDate = snapshotData['last_completion_date'] as DateTime?;
    _getcode = snapshotData['getcode'] as bool?;
    _region = snapshotData['region'] as String?;
    _getreward = snapshotData['getreward'] as bool?;
    _posts = getDataList(snapshotData['Posts']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? username,
  String? gender,
  String? healthGoal,
  String? selfRating,
  int? age,
  String? fcmToken,
  DateTime? lastNotifyReadTime,
  int? points,
  int? dailyStreak,
  DateTime? lastCompletionDate,
  bool? getcode,
  String? region,
  bool? getreward,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'username': username,
      'gender': gender,
      'health_goal': healthGoal,
      'self_rating': selfRating,
      'age': age,
      'fcm_token': fcmToken,
      'lastNotifyReadTime': lastNotifyReadTime,
      'Points': points,
      'daily_streak': dailyStreak,
      'last_completion_date': lastCompletionDate,
      'getcode': getcode,
      'region': region,
      'getreward': getreward,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.username == e2?.username &&
        e1?.gender == e2?.gender &&
        e1?.healthGoal == e2?.healthGoal &&
        e1?.selfRating == e2?.selfRating &&
        e1?.age == e2?.age &&
        e1?.fcmToken == e2?.fcmToken &&
        e1?.lastNotifyReadTime == e2?.lastNotifyReadTime &&
        e1?.points == e2?.points &&
        e1?.dailyStreak == e2?.dailyStreak &&
        e1?.lastCompletionDate == e2?.lastCompletionDate &&
        e1?.getcode == e2?.getcode &&
        e1?.region == e2?.region &&
        e1?.getreward == e2?.getreward &&
        listEquality.equals(e1?.posts, e2?.posts);
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.username,
        e?.gender,
        e?.healthGoal,
        e?.selfRating,
        e?.age,
        e?.fcmToken,
        e?.lastNotifyReadTime,
        e?.points,
        e?.dailyStreak,
        e?.lastCompletionDate,
        e?.getcode,
        e?.region,
        e?.getreward,
        e?.posts
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
