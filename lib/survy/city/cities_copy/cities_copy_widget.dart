import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'cities_copy_model.dart';
export 'cities_copy_model.dart';

/// Create a FlutterFlow page titled "Choose your region… and start the
/// challenge!" with a dropdown menu: Riyadh, Jeddah, Eastern Province, Abha.
///
/// Each region triggers a unique challenge and visual style. Riyadh: "Walk 2
/// km on the Sports Boulevard" with skyline background (Kingdom Tower),
/// gold/beige colors. Jeddah: "Walk 15 min on the Corniche" with sea waves
/// and fountain, blue/aqua palette. Eastern: "Ride a bike on the Corniche"
/// with palm trees, green/turquoise. Abha: "Explore a mountain park and
/// capture a view" with foggy mountains, forest tones. Each challenge gives
/// 10 points. Unlock badges: Riyadh Explorer, Sea Spirit, Highlands Hero. Add
/// progress bar. Motivational line: "Every challenge brings you closer to the
/// title Champion of Regions 🏅"
class CitiesCopyWidget extends StatefulWidget {
  const CitiesCopyWidget({super.key});

  static String routeName = 'CitiesCopy';
  static String routePath = '/citiesCopy';

  @override
  State<CitiesCopyWidget> createState() => _CitiesCopyWidgetState();
}

class _CitiesCopyWidgetState extends State<CitiesCopyWidget> {
  late CitiesCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CitiesCopyModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<CommunityRecord>>(
      stream: queryCommunityRecord(),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<CommunityRecord> citiesCopyCommunityRecordList = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(110.0),
              child: AppBar(
                backgroundColor: Colors.white,
                automaticallyImplyLeading: false,
                leading: Visibility(
                  visible:
                      valueOrDefault(currentUserDocument?.region, '') != null &&
                          valueOrDefault(currentUserDocument?.region, '') != '',
                  child: AuthUserStreamWidget(
                    builder: (context) => FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30.0,
                      borderWidth: 1.0,
                      buttonSize: 60.0,
                      icon: Icon(
                        Icons.arrow_back_rounded,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 30.0,
                      ),
                      onPressed: () async {
                        context.pop();
                      },
                    ),
                  ),
                ),
                actions: [],
                flexibleSpace: FlexibleSpaceBar(
                  title: Align(
                    alignment: AlignmentDirectional(-1.0, 1.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(25.0, 0.0, 0.0, 0.0),
                      child: Text(
                        'Regional Challenges',
                        style: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .override(
                              font: GoogleFonts.interTight(
                                fontWeight: FontWeight.bold,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .fontStyle,
                              ),
                              color: Color(0xFF2C1810),
                              fontSize: 32.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .headlineMedium
                                  .fontStyle,
                            ),
                      ),
                    ),
                  ),
                  centerTitle: true,
                  expandedTitleScale: 1.0,
                ),
                elevation: 0.0,
              ),
            ),
            body: SafeArea(
              top: true,
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Choose your region… and start the ',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .displayMedium
                                .override(
                                  font: GoogleFonts.interTight(
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .displayMedium
                                        .fontStyle,
                                  ),
                                  color: Color(0xFF2C1810),
                                  fontSize: 28.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .displayMedium
                                      .fontStyle,
                                  lineHeight: 1.2,
                                ),
                          ),
                          Text(
                            'challenge!',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .displayMedium
                                .override(
                                  font: GoogleFonts.interTight(
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .displayMedium
                                        .fontStyle,
                                  ),
                                  color: FlutterFlowTheme.of(context).success,
                                  fontSize: 28.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .displayMedium
                                      .fontStyle,
                                  lineHeight: 1.2,
                                ),
                          ),
                        ],
                      ),
                      Container(
                        width: double.infinity,
                        height: 220.0,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 15.0,
                              color: Color(0x33000000),
                              offset: Offset(
                                0.0,
                                8.0,
                              ),
                            )
                          ],
                          gradient: LinearGradient(
                            colors: [Color(0xFFD4AF37), Color(0xFFF4E4BC)],
                            stops: [0.0, 1.0],
                            begin: AlignmentDirectional(1.0, -1.0),
                            end: AlignmentDirectional(-1.0, 1.0),
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Image.network(
                                'https://images.unsplash.com/photo-1577968946327-25e3eb1e8c3d?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHJhbmRvbXx8fHx8fHx8fDE3NjM4MzMzOTV8&ixlib=rb-4.1.0&q=80&w=1080',
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                _model.regionSelected = 'Riyadh';
                                safeSetState(() {});
                              },
                              child: Container(
                                width: double.infinity,
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xA52D5A27),
                                      Color(0x99F4E4BC)
                                    ],
                                    stops: [0.0, 1.0],
                                    begin: AlignmentDirectional(0.0, -1.0),
                                    end: AlignmentDirectional(0, 1.0),
                                  ),
                                  borderRadius: BorderRadius.circular(20.0),
                                  border: Border.all(
                                    color: _model.regionSelected == 'Riyadh'
                                        ? Color(0xFFF4D792)
                                        : FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                    width: 4.0,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(24.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 12.0),
                                        child: Icon(
                                          Icons.location_city,
                                          color:
                                              _model.regionSelected == 'Riyadh'
                                                  ? Color(0xD5F4D792)
                                                  : FlutterFlowTheme.of(context)
                                                      .alternate,
                                          size: 48.0,
                                        ),
                                      ),
                                      Text(
                                        'Riyadh\'s Challenges',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .headlineMedium
                                            .override(
                                              font: GoogleFonts.interTight(
                                                fontWeight: FontWeight.bold,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineMedium
                                                        .fontStyle,
                                              ),
                                              color: _model.regionSelected ==
                                                      'Riyadh'
                                                  ? Color(0xD5F4D792)
                                                  : FlutterFlowTheme.of(context)
                                                      .alternate,
                                              fontSize: 24.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 220.0,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 15.0,
                              color: Color(0x33000000),
                              offset: Offset(
                                0.0,
                                8.0,
                              ),
                            )
                          ],
                          gradient: LinearGradient(
                            colors: [Color(0xFF0EA5E9), Color(0xFF06B6D4)],
                            stops: [0.0, 1.0],
                            begin: AlignmentDirectional(1.0, -1.0),
                            end: AlignmentDirectional(-1.0, 1.0),
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Image.network(
                                'https://images.unsplash.com/photo-1658844239513-6c358c94b9c2?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHJhbmRvbXx8fHx8fHx8fDE3NjM4MzMzOTV8&ixlib=rb-4.1.0&q=80&w=1080',
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                _model.regionSelected = 'Jeddah';
                                safeSetState(() {});
                              },
                              child: Container(
                                width: double.infinity,
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0x660EA5E9),
                                      Color(0x9906B6D4)
                                    ],
                                    stops: [0.0, 1.0],
                                    begin: AlignmentDirectional(0.0, -1.0),
                                    end: AlignmentDirectional(0, 1.0),
                                  ),
                                  borderRadius: BorderRadius.circular(20.0),
                                  border: Border.all(
                                    color: _model.regionSelected == 'Jeddah'
                                        ? Color(0xFF69D6FB)
                                        : FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                    width: 4.0,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(24.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 12.0),
                                        child: Icon(
                                          Icons.waves,
                                          color:
                                              _model.regionSelected == 'Jeddah'
                                                  ? Color(0xFF69D6FB)
                                                  : FlutterFlowTheme.of(context)
                                                      .alternate,
                                          size: 48.0,
                                        ),
                                      ),
                                      Text(
                                        'Jeddah\'s Challenge',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .headlineMedium
                                            .override(
                                              font: GoogleFonts.interTight(
                                                fontWeight: FontWeight.bold,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineMedium
                                                        .fontStyle,
                                              ),
                                              color: _model.regionSelected ==
                                                      'Jeddah'
                                                  ? Color(0xFF69D6FB)
                                                  : FlutterFlowTheme.of(context)
                                                      .alternate,
                                              fontSize: 24.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 220.0,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 15.0,
                              color: Color(0x33000000),
                              offset: Offset(
                                0.0,
                                8.0,
                              ),
                            )
                          ],
                          gradient: LinearGradient(
                            colors: [Color(0xFF16A34A), Color(0xFF84CC16)],
                            stops: [0.0, 1.0],
                            begin: AlignmentDirectional(1.0, -1.0),
                            end: AlignmentDirectional(-1.0, 1.0),
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Image.network(
                                'https://images.unsplash.com/photo-1660841699513-bd3d3322c17f?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHJhbmRvbXx8fHx8fHx8fDE3NjM4MzMzOTV8&ixlib=rb-4.1.0&q=80&w=1080',
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                _model.regionSelected = 'Abha';
                                safeSetState(() {});
                              },
                              child: Container(
                                width: double.infinity,
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0x6616A34A),
                                      Color(0x9984CC16)
                                    ],
                                    stops: [0.0, 1.0],
                                    begin: AlignmentDirectional(0.0, -1.0),
                                    end: AlignmentDirectional(0, 1.0),
                                  ),
                                  borderRadius: BorderRadius.circular(20.0),
                                  border: Border.all(
                                    color: _model.regionSelected == 'Abha'
                                        ? Color(0xFF92FFB7)
                                        : FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                    width: 4.0,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(24.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 12.0),
                                        child: Icon(
                                          Icons.landscape,
                                          color: _model.regionSelected == 'Abha'
                                              ? Color(0xD392FFB7)
                                              : FlutterFlowTheme.of(context)
                                                  .alternate,
                                          size: 48.0,
                                        ),
                                      ),
                                      Text(
                                        'Abha\'s Challenge',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .headlineMedium
                                            .override(
                                              font: GoogleFonts.interTight(
                                                fontWeight: FontWeight.bold,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineMedium
                                                        .fontStyle,
                                              ),
                                              color: _model.regionSelected ==
                                                      'Abha'
                                                  ? Color(0xD392FFB7)
                                                  : FlutterFlowTheme.of(context)
                                                      .alternate,
                                              fontSize: 24.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 0.0),
                          child: StreamBuilder<List<CommunityRecord>>(
                            stream: queryCommunityRecord(
                              queryBuilder: (communityRecord) =>
                                  communityRecord.where(Filter.or(
                                Filter(
                                  'isRiyadh',
                                  isEqualTo: true,
                                ),
                                Filter(
                                  'isJeddah',
                                  isEqualTo: true,
                                ),
                                Filter(
                                  'isAbha',
                                  isEqualTo: true,
                                ),
                              )),
                              singleRecord: true,
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        FlutterFlowTheme.of(context).primary,
                                      ),
                                    ),
                                  ),
                                );
                              }
                              List<CommunityRecord> buttonCommunityRecordList =
                                  snapshot.data!;
                              // Return an empty Container when the item does not exist.
                              if (snapshot.data!.isEmpty) {
                                return Container();
                              }
                              final buttonCommunityRecord =
                                  buttonCommunityRecordList.isNotEmpty
                                      ? buttonCommunityRecordList.first
                                      : null;

                              return FFButtonWidget(
                                onPressed: (_model.regionSelected == null ||
                                        _model.regionSelected == '')
                                    ? null
                                    : () async {
                                        if (_model.regionSelected == 'Riyadh') {
                                          await currentUserReference!
                                              .update(createUsersRecordData(
                                            region: 'Riyadh',
                                          ));
                                          _model.riyadhDoc =
                                              await queryCommunityRecordOnce(
                                            queryBuilder: (communityRecord) =>
                                                communityRecord.where(
                                              'isRiyadh',
                                              isEqualTo: true,
                                            ),
                                            singleRecord: true,
                                          ).then((s) => s.firstOrNull);
                                          FFAppState().selectedCommunityRef =
                                              _model.riyadhDoc?.reference;
                                          safeSetState(() {});
                                        } else {
                                          if (_model.regionSelected ==
                                              'Jeddah') {
                                            await currentUserReference!
                                                .update(createUsersRecordData(
                                              region: 'Jeddah',
                                            ));
                                            _model.jeddahDoc =
                                                await queryCommunityRecordOnce(
                                              queryBuilder: (communityRecord) =>
                                                  communityRecord.where(
                                                'isJeddah',
                                                isEqualTo: true,
                                              ),
                                              singleRecord: true,
                                            ).then((s) => s.firstOrNull);
                                            FFAppState().selectedCommunityRef =
                                                buttonCommunityRecord
                                                    ?.reference;
                                            safeSetState(() {});
                                          } else {
                                            await currentUserReference!
                                                .update(createUsersRecordData(
                                              region: 'Abha',
                                            ));
                                            _model.abhaDoc =
                                                await queryCommunityRecordOnce(
                                              queryBuilder: (communityRecord) =>
                                                  communityRecord.where(
                                                'isAbha',
                                                isEqualTo: true,
                                              ),
                                              singleRecord: true,
                                            ).then((s) => s.firstOrNull);
                                            FFAppState().selectedCommunityRef =
                                                buttonCommunityRecord
                                                    ?.reference;
                                            safeSetState(() {});
                                          }
                                        }

                                        await currentUserReference!
                                            .update(createUsersRecordData(
                                          region: _model.regionSelected,
                                        ));

                                        context
                                            .pushNamed(RiyadhWidget.routeName);

                                        safeSetState(() {});
                                      },
                                text: 'Next',
                                options: FFButtonOptions(
                                  width: double.infinity,
                                  height: 56.0,
                                  padding: EdgeInsets.all(8.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).success,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .override(
                                        font: GoogleFonts.interTight(
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleMedium
                                                  .fontStyle,
                                        ),
                                        color: Colors.white,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .fontStyle,
                                      ),
                                  elevation: 0.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                  disabledColor: Color(0xFFBDBDBD),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ]
                        .divide(SizedBox(height: 24.0))
                        .addToStart(SizedBox(height: 20.0))
                        .addToEnd(SizedBox(height: 32.0)),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
