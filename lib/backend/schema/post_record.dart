import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PostRecord extends FirestoreRecord {
  PostRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "post_photo" field.
  String? _postPhoto;
  String get postPhoto => _postPhoto ?? '';
  bool hasPostPhoto() => _postPhoto != null;

  // "post_description" field.
  String? _postDescription;
  String get postDescription => _postDescription ?? '';
  bool hasPostDescription() => _postDescription != null;

  // "post_user" field.
  DocumentReference? _postUser;
  DocumentReference? get postUser => _postUser;
  bool hasPostUser() => _postUser != null;

  // "time_posted" field.
  DateTime? _timePosted;
  DateTime? get timePosted => _timePosted;
  bool hasTimePosted() => _timePosted != null;

  // "likes" field.
  List<DocumentReference>? _likes;
  List<DocumentReference> get likes => _likes ?? const [];
  bool hasLikes() => _likes != null;

  // "num_comments" field.
  int? _numComments;
  int get numComments => _numComments ?? 0;
  bool hasNumComments() => _numComments != null;

  // "num_votes" field.
  int? _numVotes;
  int get numVotes => _numVotes ?? 0;
  bool hasNumVotes() => _numVotes != null;

  // "post_community" field.
  DocumentReference? _postCommunity;
  DocumentReference? get postCommunity => _postCommunity;
  bool hasPostCommunity() => _postCommunity != null;

  // "commentref" field.
  DocumentReference? _commentref;
  DocumentReference? get commentref => _commentref;
  bool hasCommentref() => _commentref != null;

  // "isPinned" field.
  bool? _isPinned;
  bool get isPinned => _isPinned ?? false;
  bool hasIsPinned() => _isPinned != null;

  // "reportCount" field.
  int? _reportCount;
  int get reportCount => _reportCount ?? 0;
  bool hasReportCount() => _reportCount != null;

  // "Post_Title" field.
  String? _postTitle;
  String get postTitle => _postTitle ?? '';
  bool hasPostTitle() => _postTitle != null;

  void _initializeFields() {
    _postPhoto = snapshotData['post_photo'] as String?;
    _postDescription = snapshotData['post_description'] as String?;
    _postUser = snapshotData['post_user'] as DocumentReference?;
    _timePosted = snapshotData['time_posted'] as DateTime?;
    _likes = getDataList(snapshotData['likes']);
    _numComments = castToType<int>(snapshotData['num_comments']);
    _numVotes = castToType<int>(snapshotData['num_votes']);
    _postCommunity = snapshotData['post_community'] as DocumentReference?;
    _commentref = snapshotData['commentref'] as DocumentReference?;
    _isPinned = snapshotData['isPinned'] as bool?;
    _reportCount = castToType<int>(snapshotData['reportCount']);
    _postTitle = snapshotData['Post_Title'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('post');

  static Stream<PostRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PostRecord.fromSnapshot(s));

  static Future<PostRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PostRecord.fromSnapshot(s));

  static PostRecord fromSnapshot(DocumentSnapshot snapshot) => PostRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PostRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PostRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PostRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PostRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPostRecordData({
  String? postPhoto,
  String? postDescription,
  DocumentReference? postUser,
  DateTime? timePosted,
  int? numComments,
  int? numVotes,
  DocumentReference? postCommunity,
  DocumentReference? commentref,
  bool? isPinned,
  int? reportCount,
  String? postTitle,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'post_photo': postPhoto,
      'post_description': postDescription,
      'post_user': postUser,
      'time_posted': timePosted,
      'num_comments': numComments,
      'num_votes': numVotes,
      'post_community': postCommunity,
      'commentref': commentref,
      'isPinned': isPinned,
      'reportCount': reportCount,
      'Post_Title': postTitle,
    }.withoutNulls,
  );

  return firestoreData;
}

class PostRecordDocumentEquality implements Equality<PostRecord> {
  const PostRecordDocumentEquality();

  @override
  bool equals(PostRecord? e1, PostRecord? e2) {
    const listEquality = ListEquality();
    return e1?.postPhoto == e2?.postPhoto &&
        e1?.postDescription == e2?.postDescription &&
        e1?.postUser == e2?.postUser &&
        e1?.timePosted == e2?.timePosted &&
        listEquality.equals(e1?.likes, e2?.likes) &&
        e1?.numComments == e2?.numComments &&
        e1?.numVotes == e2?.numVotes &&
        e1?.postCommunity == e2?.postCommunity &&
        e1?.commentref == e2?.commentref &&
        e1?.isPinned == e2?.isPinned &&
        e1?.reportCount == e2?.reportCount &&
        e1?.postTitle == e2?.postTitle;
  }

  @override
  int hash(PostRecord? e) => const ListEquality().hash([
        e?.postPhoto,
        e?.postDescription,
        e?.postUser,
        e?.timePosted,
        e?.likes,
        e?.numComments,
        e?.numVotes,
        e?.postCommunity,
        e?.commentref,
        e?.isPinned,
        e?.reportCount,
        e?.postTitle
      ]);

  @override
  bool isValidKey(Object? o) => o is PostRecord;
}
