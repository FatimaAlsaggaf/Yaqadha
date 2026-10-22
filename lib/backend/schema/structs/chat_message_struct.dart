// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatMessageStruct extends FFFirebaseStruct {
  ChatMessageStruct({
    bool? isUser,
    String? contact,
    DateTime? timechat,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _isUser = isUser,
        _contact = contact,
        _timechat = timechat,
        super(firestoreUtilData);

  // "isUser" field.
  bool? _isUser;
  bool get isUser => _isUser ?? false;
  set isUser(bool? val) => _isUser = val;

  bool hasIsUser() => _isUser != null;

  // "contact" field.
  String? _contact;
  String get contact => _contact ?? '';
  set contact(String? val) => _contact = val;

  bool hasContact() => _contact != null;

  // "timechat" field.
  DateTime? _timechat;
  DateTime? get timechat => _timechat;
  set timechat(DateTime? val) => _timechat = val;

  bool hasTimechat() => _timechat != null;

  static ChatMessageStruct fromMap(Map<String, dynamic> data) =>
      ChatMessageStruct(
        isUser: data['isUser'] as bool?,
        contact: data['contact'] as String?,
        timechat: data['timechat'] as DateTime?,
      );

  static ChatMessageStruct? maybeFromMap(dynamic data) => data is Map
      ? ChatMessageStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'isUser': _isUser,
        'contact': _contact,
        'timechat': _timechat,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'isUser': serializeParam(
          _isUser,
          ParamType.bool,
        ),
        'contact': serializeParam(
          _contact,
          ParamType.String,
        ),
        'timechat': serializeParam(
          _timechat,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static ChatMessageStruct fromSerializableMap(Map<String, dynamic> data) =>
      ChatMessageStruct(
        isUser: deserializeParam(
          data['isUser'],
          ParamType.bool,
          false,
        ),
        contact: deserializeParam(
          data['contact'],
          ParamType.String,
          false,
        ),
        timechat: deserializeParam(
          data['timechat'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'ChatMessageStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ChatMessageStruct &&
        isUser == other.isUser &&
        contact == other.contact &&
        timechat == other.timechat;
  }

  @override
  int get hashCode => const ListEquality().hash([isUser, contact, timechat]);
}

ChatMessageStruct createChatMessageStruct({
  bool? isUser,
  String? contact,
  DateTime? timechat,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ChatMessageStruct(
      isUser: isUser,
      contact: contact,
      timechat: timechat,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ChatMessageStruct? updateChatMessageStruct(
  ChatMessageStruct? chatMessage, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    chatMessage
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addChatMessageStructData(
  Map<String, dynamic> firestoreData,
  ChatMessageStruct? chatMessage,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (chatMessage == null) {
    return;
  }
  if (chatMessage.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && chatMessage.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final chatMessageData =
      getChatMessageFirestoreData(chatMessage, forFieldValue);
  final nestedData =
      chatMessageData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = chatMessage.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getChatMessageFirestoreData(
  ChatMessageStruct? chatMessage, [
  bool forFieldValue = false,
]) {
  if (chatMessage == null) {
    return {};
  }
  final firestoreData = mapToFirestore(chatMessage.toMap());

  // Add any Firestore field values
  mapToFirestore(chatMessage.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getChatMessageListFirestoreData(
  List<ChatMessageStruct>? chatMessages,
) =>
    chatMessages?.map((e) => getChatMessageFirestoreData(e, true)).toList() ??
    [];
