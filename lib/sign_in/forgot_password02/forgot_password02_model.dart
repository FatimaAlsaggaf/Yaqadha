import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'forgot_password02_widget.dart' show ForgotPassword02Widget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ForgotPassword02Model extends FlutterFlowModel<ForgotPassword02Widget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for EmailTextFeild widget.
  FocusNode? emailTextFeildFocusNode;
  TextEditingController? emailTextFeildTextController;
  String? Function(BuildContext, String?)?
      emailTextFeildTextControllerValidator;
  String? _emailTextFeildTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Email Address is required';
    }

    if (val.length > 254) {
      return 'Email Address must not exceed 254 characters.';
    }
    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Enter Valid Email Address';
    }
    return null;
  }

  @override
  void initState(BuildContext context) {
    emailTextFeildTextControllerValidator =
        _emailTextFeildTextControllerValidator;
  }

  @override
  void dispose() {
    emailTextFeildFocusNode?.dispose();
    emailTextFeildTextController?.dispose();
  }
}
