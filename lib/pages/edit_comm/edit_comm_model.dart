import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/image_option_com_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/index.dart';
import 'edit_comm_widget.dart' show EditCommWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditCommModel extends FlutterFlowModel<EditCommWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for textFieldNAME widget.
  FocusNode? textFieldNAMEFocusNode;
  TextEditingController? textFieldNAMETextController;
  String? Function(BuildContext, String?)? textFieldNAMETextControllerValidator;
  String? _textFieldNAMETextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Community ame is required';
    }

    if (!RegExp('^[A-Z]{3,50}\$').hasMatch(val)) {
      return 'Name must be between 3 and 50 letters only.';
    }
    return null;
  }

  // State field(s) for textfieldDesc widget.
  FocusNode? textfieldDescFocusNode;
  TextEditingController? textfieldDescTextController;
  String? Function(BuildContext, String?)? textfieldDescTextControllerValidator;
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
  }

  @override
  void dispose() {
    textFieldNAMEFocusNode?.dispose();
    textFieldNAMETextController?.dispose();

    textfieldDescFocusNode?.dispose();
    textfieldDescTextController?.dispose();
  }
}
