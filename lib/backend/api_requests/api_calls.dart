import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class SendNotificationJCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? title = '',
    String? body = '',
  }) async {
    final ffApiRequestBody = '''
{
  "to":"${escapeStringForJson(token)}" ,
  "notification": {
    "title":"${escapeStringForJson(title)}" ,
    "body": "${escapeStringForJson(body)}",
    "badge": 1,
    "sound": "Default",
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'send notification j',
      apiUrl: 'https://fcm.googleapis.com/fcm/send',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'key=REMOVED_GOOGLE_KEY',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ChatGPTGenerateTextCall {
  static Future<ApiCallResponse> call({
    String? userPrompt = '',
  }) async {
    final ffApiRequestBody = '''
{
  "model": "gpt-3.5-turbo",
  "messages": [
    {
      "role": "user",
      "content": "[${escapeStringForJson(userPrompt)}USER_PROMPT]"
    }
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ChatGPTGenerateText',
      apiUrl: 'https://api.openai.com/v1/chat/completions',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
            'Bearer REMOVED_OPENAI_KEY',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? aiResponse(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.choices[0].message.content''',
      ));
}

class SendChallengeReminderCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? uid = '',
  }) async {
    final ffApiRequestBody = '''
{
"token": "{{token}}",
"uid": "{{uid}}",
  "title": "Reminder",
  "body": "You haven't completed the challenge yet!"
}
''';
    return ApiManager.instance.makeApiCall(
      callName: 'SendChallengeReminder',
      apiUrl: 'https://sendchallengereminder-cybfza6j7q-uc.a.run.app',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
