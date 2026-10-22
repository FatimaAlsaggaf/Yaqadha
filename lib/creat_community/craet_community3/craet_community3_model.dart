import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/index.dart';
import 'craet_community3_widget.dart' show CraetCommunity3Widget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class CraetCommunity3Model extends FlutterFlowModel<CraetCommunity3Widget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading_uploadedFileUrlphoto = false;
  FFUploadedFile uploadedLocalFile_uploadedFileUrlphoto =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadedFileUrlphoto = '';

  // State field(s) for CommunityNameTextFeild widget.
  FocusNode? communityNameTextFeildFocusNode;
  TextEditingController? communityNameTextFeildTextController;
  String? Function(BuildContext, String?)?
      communityNameTextFeildTextControllerValidator;
  String? _communityNameTextFeildTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Community Name is required';
    }

    if (!RegExp('^(?=.{3,100}\$)[A-Z]+(?: [A-Z]+)*\$').hasMatch(val)) {
      return 'Use 3–100 uppercase letters, no spaces at start or end';
    }
    return null;
  }

  // State field(s) for Description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  CommunityRecord? existingCommunity;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  CommunityRecord? newCommunityRef;

  @override
  void initState(BuildContext context) {
    communityNameTextFeildTextControllerValidator =
        _communityNameTextFeildTextControllerValidator;
  }

  @override
  void dispose() {
    communityNameTextFeildFocusNode?.dispose();
    communityNameTextFeildTextController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();
  }
}
