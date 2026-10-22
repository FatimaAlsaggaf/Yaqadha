import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'city_chall_widget.dart' show CityChallWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CityChallModel extends FlutterFlowModel<CityChallWidget> {
  ///  Local state fields for this page.

  String imageRiyadh =
      'https://saudipedia.com/saudipedia/uploads/images/2024/02/13/88618.jpg';

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in cityChall widget.
  RegionalChallengesRecord? newChallengeDoc;
  // Stores action output result for [Firestore Query - Query a collection] action in cityChall widget.
  RegionalChallengesRecord? oldActiveDoc;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
