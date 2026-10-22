import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/profile/failure_to_change/failure_to_change_widget.dart';
import '/pages/profile/mismatch_password/mismatch_password_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'change_password_widget.dart' show ChangePasswordWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChangePasswordModel extends FlutterFlowModel<ChangePasswordWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for textfiledPASSWORDcurrnet widget.
  FocusNode? textfiledPASSWORDcurrnetFocusNode;
  TextEditingController? textfiledPASSWORDcurrnetTextController;
  late bool textfiledPASSWORDcurrnetVisibility;
  String? Function(BuildContext, String?)?
      textfiledPASSWORDcurrnetTextControllerValidator;
  String? _textfiledPASSWORDcurrnetTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'current password is required';
    }

    if (!RegExp(
            '^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@\$!%*?&])[A-Za-z\\d@\$!%*?&]{8,50}\$')
        .hasMatch(val)) {
      return 'Password must contain 8 to 20 \ncharacter and at least\none uppercase letter,\none lowercase letter, \none number, and\none special character (! @ \$ % * ? &).';
    }
    return null;
  }

  // State field(s) for textfiledPASSWORD widget.
  FocusNode? textfiledPASSWORDFocusNode;
  TextEditingController? textfiledPASSWORDTextController;
  late bool textfiledPASSWORDVisibility;
  String? Function(BuildContext, String?)?
      textfiledPASSWORDTextControllerValidator;
  String? _textfiledPASSWORDTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'new password is required';
    }

    if (!RegExp(
            '^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@\$!%*?&])[A-Za-z\\d@\$!%*?&]{8,50}\$')
        .hasMatch(val)) {
      return 'Password must contain 8 to 20 \ncharacter and at least\none uppercase letter,\none lowercase letter, \none number, and\none special character (! @ \$ % * ? &).';
    }
    return null;
  }

  // State field(s) for textfiledPASSWORDconfirm widget.
  FocusNode? textfiledPASSWORDconfirmFocusNode;
  TextEditingController? textfiledPASSWORDconfirmTextController;
  late bool textfiledPASSWORDconfirmVisibility;
  String? Function(BuildContext, String?)?
      textfiledPASSWORDconfirmTextControllerValidator;
  String? _textfiledPASSWORDconfirmTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'confirm new password is required';
    }

    if (!RegExp(
            '^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@\$!%*?&])[A-Za-z\\d@\$!%*?&]{8,50}\$')
        .hasMatch(val)) {
      return 'Password must contain 8 to 20 \ncharacter and at least\none uppercase letter,\none lowercase letter, \none number, and\none special character (! @ \$ % * ? &).';
    }
    return null;
  }

  // Stores action output result for [Custom Action - changePassword] action in Button-Login widget.
  bool? chanagePasswordResult;

  @override
  void initState(BuildContext context) {
    textfiledPASSWORDcurrnetVisibility = false;
    textfiledPASSWORDcurrnetTextControllerValidator =
        _textfiledPASSWORDcurrnetTextControllerValidator;
    textfiledPASSWORDVisibility = false;
    textfiledPASSWORDTextControllerValidator =
        _textfiledPASSWORDTextControllerValidator;
    textfiledPASSWORDconfirmVisibility = false;
    textfiledPASSWORDconfirmTextControllerValidator =
        _textfiledPASSWORDconfirmTextControllerValidator;
  }

  @override
  void dispose() {
    textfiledPASSWORDcurrnetFocusNode?.dispose();
    textfiledPASSWORDcurrnetTextController?.dispose();

    textfiledPASSWORDFocusNode?.dispose();
    textfiledPASSWORDTextController?.dispose();

    textfiledPASSWORDconfirmFocusNode?.dispose();
    textfiledPASSWORDconfirmTextController?.dispose();
  }
}
