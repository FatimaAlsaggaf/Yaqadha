import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/code_widget.dart';
import '/components/nav_bar1_widget.dart';
import '/components/no_point_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'redeem_widget.dart' show RedeemWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RedeemModel extends FlutterFlowModel<RedeemWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for NavBar1 component.
  late NavBar1Model navBar1Model;

  @override
  void initState(BuildContext context) {
    navBar1Model = createModel(context, () => NavBar1Model());
  }

  @override
  void dispose() {
    navBar1Model.dispose();
  }
}
