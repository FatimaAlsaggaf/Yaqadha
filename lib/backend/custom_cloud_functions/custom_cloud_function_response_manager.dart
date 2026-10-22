import '/backend/schema/structs/index.dart';

class DeletePostCommentsCloudFunctionCallResponse {
  DeletePostCommentsCloudFunctionCallResponse({
    this.errorCode,
    this.succeeded,
    this.jsonBody,
  });
  String? errorCode;
  bool? succeeded;
  dynamic jsonBody;
}
