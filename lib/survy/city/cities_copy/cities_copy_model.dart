import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'cities_copy_widget.dart' show CitiesCopyWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CitiesCopyModel extends FlutterFlowModel<CitiesCopyWidget> {
  ///  Local state fields for this page.

  String? regionSelected;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  CommunityRecord? riyadhDoc;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  CommunityRecord? jeddahDoc;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  CommunityRecord? abhaDoc;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
