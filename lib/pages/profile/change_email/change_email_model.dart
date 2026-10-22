import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'change_email_widget.dart' show ChangeEmailWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChangeEmailModel extends FlutterFlowModel<ChangeEmailWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for changeEmailTextFeild widget.
  FocusNode? changeEmailTextFeildFocusNode;
  TextEditingController? changeEmailTextFeildTextController;
  String? Function(BuildContext, String?)?
      changeEmailTextFeildTextControllerValidator;
  String? _changeEmailTextFeildTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'New Valid Email is required';
    }

    if (val.length > 254) {
      return 'Email Address must not exceed 254 characters.';
    }
    if (!RegExp('^[^\\s@]+@[^\\s@]+\\.[^\\s@]+\$').hasMatch(val)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  // Stores action output result for [Firestore Query - Query a collection] action in Button-Login widget.
  int? numEmail;

  @override
  void initState(BuildContext context) {
    changeEmailTextFeildTextControllerValidator =
        _changeEmailTextFeildTextControllerValidator;
  }

  @override
  void dispose() {
    changeEmailTextFeildFocusNode?.dispose();
    changeEmailTextFeildTextController?.dispose();
  }
}
