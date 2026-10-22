import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/callender/text_day/text_day_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'calender_widget.dart' show CalenderWidget;
import 'dart:math' as math;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class CalenderModel extends FlutterFlowModel<CalenderWidget> {
  ///  Local state fields for this component.

  DateTime? inputDate;

  DateTime? selectedDate1;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in calender widget.
  List<ChallengeHistoryRecord>? calUserChall;
  // Model for textDay component.
  late TextDayModel textDayModel1;
  // Model for textDay component.
  late TextDayModel textDayModel2;
  // Model for textDay component.
  late TextDayModel textDayModel3;
  // Model for textDay component.
  late TextDayModel textDayModel4;
  // Model for textDay component.
  late TextDayModel textDayModel5;
  // Model for textDay component.
  late TextDayModel textDayModel6;
  // Model for textDay component.
  late TextDayModel textDayModel7;

  @override
  void initState(BuildContext context) {
    textDayModel1 = createModel(context, () => TextDayModel());
    textDayModel2 = createModel(context, () => TextDayModel());
    textDayModel3 = createModel(context, () => TextDayModel());
    textDayModel4 = createModel(context, () => TextDayModel());
    textDayModel5 = createModel(context, () => TextDayModel());
    textDayModel6 = createModel(context, () => TextDayModel());
    textDayModel7 = createModel(context, () => TextDayModel());
  }

  @override
  void dispose() {
    textDayModel1.dispose();
    textDayModel2.dispose();
    textDayModel3.dispose();
    textDayModel4.dispose();
    textDayModel5.dispose();
    textDayModel6.dispose();
    textDayModel7.dispose();
  }
}
