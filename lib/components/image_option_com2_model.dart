import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/index.dart';
import 'image_option_com2_widget.dart' show ImageOptionCom2Widget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ImageOptionCom2Model extends FlutterFlowModel<ImageOptionCom2Widget> {
  ///  State fields for stateful widgets in this component.

  bool isDataUploading_uploadedFileUrlphoto5 = false;
  FFUploadedFile uploadedLocalFile_uploadedFileUrlphoto5 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadedFileUrlphoto5 = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
