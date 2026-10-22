import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/index.dart';
import 'edit_profile_widget.dart' show EditProfileWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditProfileModel extends FlutterFlowModel<EditProfileWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for textFieldNAME widget.
  FocusNode? textFieldNAMEFocusNode;
  TextEditingController? textFieldNAMETextController;
  String? Function(BuildContext, String?)? textFieldNAMETextControllerValidator;
  String? _textFieldNAMETextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Name is required';
    }

    if (!RegExp('^[A-Za-z]{3,50}\$').hasMatch(val)) {
      return 'Name must be between 3 and 50 letters only.';
    }
    return null;
  }

  // State field(s) for textfieldAGE widget.
  FocusNode? textfieldAGEFocusNode;
  TextEditingController? textfieldAGETextController;
  String? Function(BuildContext, String?)? textfieldAGETextControllerValidator;
  String? _textfieldAGETextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Age is required';
    }

    if (!RegExp('^(?:[7-9]|[1-9][0-9]|1[01][0-9]|120)\$').hasMatch(val)) {
      return 'Age must be a number between 7 and 120';
    }
    return null;
  }

  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController1;
  String? get choiceChipsValue1 =>
      choiceChipsValueController1?.value?.firstOrNull;
  set choiceChipsValue1(String? val) =>
      choiceChipsValueController1?.value = val != null ? [val] : [];
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController2;
  String? get choiceChipsValue2 =>
      choiceChipsValueController2?.value?.firstOrNull;
  set choiceChipsValue2(String? val) =>
      choiceChipsValueController2?.value = val != null ? [val] : [];

  @override
  void initState(BuildContext context) {
    textFieldNAMETextControllerValidator =
        _textFieldNAMETextControllerValidator;
    textfieldAGETextControllerValidator = _textfieldAGETextControllerValidator;
  }

  @override
  void dispose() {
    textFieldNAMEFocusNode?.dispose();
    textFieldNAMETextController?.dispose();

    textfieldAGEFocusNode?.dispose();
    textfieldAGETextController?.dispose();
  }
}
