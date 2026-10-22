import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/commnet_post_widget.dart';
import '/components/no_comment_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import '/pages/com/pin_mass/pin_mass_widget.dart';
import '/pages/comments/comments_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'community_page_copy_copy_widget.dart' show CommunityPageCopyCopyWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class CommunityPageCopyCopyModel
    extends FlutterFlowModel<CommunityPageCopyCopyWidget> {
  ///  Local state fields for this page.

  int goalToday = 0;

  int steptoday = 0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getExistingPinnedPostRef] action in CommunityPageCopyCopy widget.
  DocumentReference? loadedRef;
  InstantTimer? instantTimer;
  // Stores action output result for [Custom Action - stepsGet] action in CommunityPageCopyCopy widget.
  int? stepsO;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    instantTimer?.cancel();
    tabBarController?.dispose();
  }
}
