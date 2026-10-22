import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/nav_bar1_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/request_manager.dart';

import '/index.dart';
import 'riyadh_widget.dart' show RiyadhWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RiyadhModel extends FlutterFlowModel<RiyadhWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in Riyadh widget.
  RegionalChallengesRecord? newChallengeDoc;
  // Stores action output result for [Firestore Query - Query a collection] action in Riyadh widget.
  RegionalChallengesRecord? oldActiveDoc;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // Model for NavBar1 component.
  late NavBar1Model navBar1Model;

  /// Query cache managers for this widget.

  final _someManager = StreamRequestManager<List<RegionalChallengesRecord>>();
  Stream<List<RegionalChallengesRecord>> some({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<RegionalChallengesRecord>> Function() requestFn,
  }) =>
      _someManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearSomeCache() => _someManager.clear();
  void clearSomeCacheKey(String? uniqueKey) =>
      _someManager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {
    navBar1Model = createModel(context, () => NavBar1Model());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    navBar1Model.dispose();

    /// Dispose query cache managers for this widget.

    clearSomeCache();
  }
}
