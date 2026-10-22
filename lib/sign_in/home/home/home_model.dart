import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/nav_bar1_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import '/sign_in/streak/streak_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'home_widget.dart' show HomeWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  Local state fields for this page.

  int currentWeekOffset = 0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - countActiveChallenges] action in HOME widget.
  int? activeCalloutput;
  // Stores action output result for [Custom Action - countCompletedChallenges] action in HOME widget.
  int? completedChall;
  InstantTimer? countdownTimer;
  // State field(s) for Column widget.
  ScrollController? columnController;
  // State field(s) for ListView widget.
  ScrollController? listViewController;
  // Model for NavBar1 component.
  late NavBar1Model navBar1Model;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
    listViewController = ScrollController();
    navBar1Model = createModel(context, () => NavBar1Model());
  }

  @override
  void dispose() {
    countdownTimer?.cancel();
    columnController?.dispose();
    listViewController?.dispose();
    navBar1Model.dispose();
  }
}
