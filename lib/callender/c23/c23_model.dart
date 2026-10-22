import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/callender/calender/calender_widget.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'c23_widget.dart' show C23Widget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class C23Model extends FlutterFlowModel<C23Widget> {
  ///  Local state fields for this page.

  DateTime? selectedDate;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // Model for calender component.
  late CalenderModel calenderModel;

  @override
  void initState(BuildContext context) {
    calenderModel = createModel(context, () => CalenderModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    calenderModel.dispose();
  }
}
