import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/poinerarn_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import 'sharepic_widget.dart' show SharepicWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SharepicModel extends FlutterFlowModel<SharepicWidget> {
  ///  State fields for stateful widgets in this component.

  bool isDataUploading_uploadedFileUrlphoto8 = false;
  FFUploadedFile uploadedLocalFile_uploadedFileUrlphoto8 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadedFileUrlphoto8 = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
