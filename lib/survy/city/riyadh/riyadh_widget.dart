import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/nav_bar1_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'riyadh_model.dart';
export 'riyadh_model.dart';

class RiyadhWidget extends StatefulWidget {
  const RiyadhWidget({super.key});

  static String routeName = 'Riyadh';
  static String routePath = '/riyadh';

  @override
  State<RiyadhWidget> createState() => _RiyadhWidgetState();
}

class _RiyadhWidgetState extends State<RiyadhWidget>
    with TickerProviderStateMixin {
  late RiyadhModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RiyadhModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (valueOrDefault(currentUserDocument?.region, '') == null ||
          valueOrDefault(currentUserDocument?.region, '') == '') {
        context.pushNamed(CitiesCopyWidget.routeName);
      }
      _model.newChallengeDoc = await queryRegionalChallengesRecordOnce(
        queryBuilder: (regionalChallengesRecord) => regionalChallengesRecord
            .where(
              'challenge_StartDate',
              isLessThanOrEqualTo: getCurrentTimestamp,
            )
            .where(
              'target_city',
              isEqualTo: valueOrDefault(currentUserDocument?.region, ''),
            )
            .orderBy('challenge_StartDate', descending: true),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      if (_model.newChallengeDoc?.isActive == false) {
        _model.oldActiveDoc = await queryRegionalChallengesRecordOnce(
          queryBuilder: (regionalChallengesRecord) => regionalChallengesRecord
              .where(
                'is_active',
                isEqualTo: true,
              )
              .where(
                'target_city',
                isEqualTo: valueOrDefault(currentUserDocument?.region, ''),
              ),
          singleRecord: true,
        ).then((s) => s.firstOrNull);

        await _model.oldActiveDoc!.reference
            .update(createRegionalChallengesRecordData(
          isActive: false,
        ));

        await _model.newChallengeDoc!.reference
            .update(createRegionalChallengesRecordData(
          isActive: true,
        ));
      }
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: AuthUserStreamWidget(
          builder: (context) => StreamBuilder<List<RegionalChallengesRecord>>(
            stream: _model.some(
              requestFn: () => queryRegionalChallengesRecord(
                queryBuilder: (regionalChallengesRecord) =>
                    regionalChallengesRecord
                        .where(
                          'target_city',
                          isEqualTo:
                              valueOrDefault(currentUserDocument?.region, ''),
                        )
                        .where(
                          'challenge_EndDate',
                          isGreaterThanOrEqualTo: getCurrentTimestamp,
                        )
                        .orderBy('challenge_EndDate'),
                singleRecord: true,
              ),
            ),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 40.0,
                    height: 40.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).success,
                      ),
                    ),
                  ),
                );
              }
              List<RegionalChallengesRecord> stackRegionalChallengesRecordList =
                  snapshot.data!;
              final stackRegionalChallengesRecord =
                  stackRegionalChallengesRecordList.isNotEmpty
                      ? stackRegionalChallengesRecordList.first
                      : null;

              return Container(
                width: double.infinity,
                height: double.infinity,
                child: Stack(
                  alignment: AlignmentDirectional(0.0, -1.0),
                  children: [
                    Stack(
                      children: [
                        if ((dateTimeFormat("M", getCurrentTimestamp) ==
                                '11') &&
                            (stackRegionalChallengesRecord?.targetCity ==
                                'Riyadh'))
                          Align(
                            alignment: AlignmentDirectional(0.0, -1.0),
                            child: Image.asset(
                              'assets/images/hq720.jpg',
                              width: double.infinity,
                              height: 340.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        if ((dateTimeFormat("M", getCurrentTimestamp) ==
                                '12') &&
                            (stackRegionalChallengesRecord?.targetCity ==
                                'Jeddah'))
                          Align(
                            alignment: AlignmentDirectional(0.0, -1.0),
                            child: Image.asset(
                              'assets/images/istockphoto-2152510409-612x612.jpg',
                              width: double.infinity,
                              height: 340.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        if ((dateTimeFormat("M", getCurrentTimestamp) ==
                                '12') &&
                            (stackRegionalChallengesRecord?.targetCity ==
                                'Riyadh'))
                          Align(
                            alignment: AlignmentDirectional(0.0, -1.01),
                            child: Image.asset(
                              'assets/images/6cefc22de0dac9ae42847e9f6930b3a8.jpg',
                              width: double.infinity,
                              height: 340.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        if ((dateTimeFormat("M", getCurrentTimestamp) ==
                                '11') &&
                            (stackRegionalChallengesRecord?.targetCity ==
                                'Jeddah'))
                          Align(
                            alignment: AlignmentDirectional(0.0, -1.2),
                            child: Image.asset(
                              'assets/images/5bedc277dbd9c0277d43655ac797c454.jpg',
                              width: double.infinity,
                              height: 340.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        if ((dateTimeFormat("M", getCurrentTimestamp) ==
                                '11') &&
                            (stackRegionalChallengesRecord?.targetCity ==
                                'Abha'))
                          Align(
                            alignment: AlignmentDirectional(0.0, -1.2),
                            child: Image.asset(
                              'assets/images/mmsh-aldbab.webp',
                              width: double.infinity,
                              height: 340.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        if ((dateTimeFormat("M", getCurrentTimestamp) ==
                                '12') &&
                            (stackRegionalChallengesRecord?.targetCity ==
                                'Abha'))
                          Align(
                            alignment: AlignmentDirectional(0.0, -1.2),
                            child: Image.asset(
                              'assets/images/the-art-street-in-abha-crop-1920x1080.webp',
                              width: double.infinity,
                              height: 340.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                      ],
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, 1.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 200.0, 0.0, 0.0),
                                child: Container(
                                  width: double.infinity,
                                  height: 800.0,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 4.0,
                                        color: Color(0x320E151B),
                                        offset: Offset(
                                          0.0,
                                          -2.0,
                                        ),
                                      )
                                    ],
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(16.0),
                                      topRight: Radius.circular(16.0),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 12.0, 0.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Flexible(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  20.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        valueOrDefault<String>(
                                                          stackRegionalChallengesRecord
                                                              ?.location,
                                                          'Location',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineSmall
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .interTight(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineSmall
                                                                        .fontStyle,
                                                                  ),
                                                                  color: Color(
                                                                      0xFF0F1113),
                                                                  fontSize:
                                                                      20.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmall
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                    ),
                                                    Text(
                                                      valueOrDefault<String>(
                                                        stackRegionalChallengesRecord
                                                            ?.description,
                                                        'Description',
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineSmall
                                                              .override(
                                                                font: GoogleFonts
                                                                    .interTight(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmall
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                fontSize: 17.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmall
                                                                    .fontStyle,
                                                              ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              FFButtonWidget(
                                                onPressed: () async {
                                                  if (stackRegionalChallengesRecord
                                                          ?.targetCity ==
                                                      'Riyadh') {
                                                    await launchURL(
                                                        'https://maps.app.goo.gl/Fyi33o3ew1to61wE7');
                                                  } else {
                                                    if (stackRegionalChallengesRecord
                                                            ?.targetCity ==
                                                        'Jeddah') {
                                                      await launchURL(
                                                          'https://maps.app.goo.gl/2sZcwRUMimAeXREv5?g_st=ipc');
                                                    } else {
                                                      await launchURL(
                                                          'https://maps.app.goo.gl/7PBwwtcd918DmFNq7');
                                                    }
                                                  }
                                                },
                                                text: 'Location',
                                                options: FFButtonOptions(
                                                  width: 100.0,
                                                  height: 40.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .success,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .titleSmall
                                                      .override(
                                                        font: GoogleFonts
                                                            .interTight(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .fontStyle,
                                                        ),
                                                        color: Colors.white,
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .fontStyle,
                                                      ),
                                                  elevation: 2.0,
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 12.0, 0.0, 0.0),
                                            child: Column(
                                              children: [
                                                Align(
                                                  alignment: Alignment(0.0, 0),
                                                  child: TabBar(
                                                    labelColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .success,
                                                    unselectedLabelColor:
                                                        Color(0xFF57636C),
                                                    labelStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .interTight(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium
                                                                    .fontStyle,
                                                          ),
                                                          color: Colors.white,
                                                          fontSize: 18.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleMedium
                                                                  .fontStyle,
                                                        ),
                                                    unselectedLabelStyle:
                                                        TextStyle(),
                                                    indicatorColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .success,
                                                    tabs: [
                                                      Tab(
                                                        text: 'Challenges',
                                                      ),
                                                      Tab(
                                                        text: 'LeaderBoard',
                                                      ),
                                                    ],
                                                    controller:
                                                        _model.tabBarController,
                                                    onTap: (i) async {
                                                      [
                                                        () async {},
                                                        () async {}
                                                      ][i]();
                                                    },
                                                  ),
                                                ),
                                                Expanded(
                                                  child: TabBarView(
                                                    controller:
                                                        _model.tabBarController,
                                                    children: [
                                                      ListView(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        15.0,
                                                                        10.0,
                                                                        0.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                StreamBuilder<
                                                                    List<
                                                                        UsersRecord>>(
                                                                  stream:
                                                                      queryUsersRecord(
                                                                    queryBuilder:
                                                                        (usersRecord) =>
                                                                            usersRecord.where(
                                                                      'region',
                                                                      isEqualTo:
                                                                          stackRegionalChallengesRecord
                                                                              ?.targetCity,
                                                                    ),
                                                                  ),
                                                                  builder: (context,
                                                                      snapshot) {
                                                                    // Customize what your widget looks like when it's loading.
                                                                    if (!snapshot
                                                                        .hasData) {
                                                                      return Center(
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              10.0,
                                                                          height:
                                                                              10.0,
                                                                          child:
                                                                              CircularProgressIndicator(
                                                                            valueColor:
                                                                                AlwaysStoppedAnimation<Color>(
                                                                              Color(0x00249689),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                    List<UsersRecord>
                                                                        containerUsersRecordList =
                                                                        snapshot
                                                                            .data!;

                                                                    return Container(
                                                                      width: double
                                                                          .infinity,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        boxShadow: [
                                                                          BoxShadow(
                                                                            blurRadius:
                                                                                3.0,
                                                                            color:
                                                                                Color(0x33000000),
                                                                            offset:
                                                                                Offset(
                                                                              0.0,
                                                                              1.0,
                                                                            ),
                                                                          )
                                                                        ],
                                                                        borderRadius:
                                                                            BorderRadius.circular(12.0),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            16.0,
                                                                            16.0,
                                                                            16.0,
                                                                            16.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Column(
                                                                              mainAxisSize: MainAxisSize.min,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Text(
                                                                                      'Region ',
                                                                                      style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                            font: GoogleFonts.inter(
                                                                                              fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                            ),
                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                          ),
                                                                                    ),
                                                                                    Text(
                                                                                      valueOrDefault(currentUserDocument?.region, ''),
                                                                                      style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                            font: GoogleFonts.interTight(
                                                                                              fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                            ),
                                                                                            color: FlutterFlowTheme.of(context).success,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                          ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Text(
                                                                                      'Participants: ',
                                                                                      style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                            font: GoogleFonts.inter(
                                                                                              fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                            ),
                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                          ),
                                                                                    ),
                                                                                    Text(
                                                                                      formatNumber(
                                                                                        containerUsersRecordList.length,
                                                                                        formatType: FormatType.compact,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                            font: GoogleFonts.inter(
                                                                                              fontWeight: FontWeight.bold,
                                                                                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                            ),
                                                                                            color: FlutterFlowTheme.of(context).success,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.bold,
                                                                                            fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                          ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            FlutterFlowIconButton(
                                                                              borderColor: Colors.transparent,
                                                                              borderRadius: 8.0,
                                                                              buttonSize: 40.0,
                                                                              fillColor: Color(0x00FFFFFF),
                                                                              icon: Icon(
                                                                                Icons.edit,
                                                                                color: FlutterFlowTheme.of(context).success,
                                                                                size: 20.0,
                                                                              ),
                                                                              onPressed: () async {
                                                                                context.pushNamed(CitiesCopyWidget.routeName);
                                                                              },
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        15.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Text(
                                                                        dateTimeFormat(
                                                                            "MMMM",
                                                                            getCurrentTimestamp),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FontWeight.bold,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              fontSize: 28.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.bold,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                      Text(
                                                                        ' Challenge',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FontWeight.bold,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              fontSize: 28.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.bold,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Stack(
                                                                  children: [
                                                                    Container(
                                                                      width:
                                                                          578.7,
                                                                      height:
                                                                          220.47,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        boxShadow: [
                                                                          BoxShadow(
                                                                            blurRadius:
                                                                                4.0,
                                                                            color:
                                                                                Color(0x33000000),
                                                                            offset:
                                                                                Offset(
                                                                              2.0,
                                                                              2.0,
                                                                            ),
                                                                          )
                                                                        ],
                                                                        borderRadius:
                                                                            BorderRadius.circular(24.0),
                                                                      ),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children:
                                                                                [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 11.0, 0.0, 0.0),
                                                                                child: Text(
                                                                                  valueOrDefault<String>(
                                                                                    stackRegionalChallengesRecord?.titleOfChall,
                                                                                    'titleOfChall',
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                        font: GoogleFonts.interTight(
                                                                                          fontWeight: FlutterFlowTheme.of(context).headlineSmall.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).headlineSmall.fontStyle,
                                                                                        ),
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FlutterFlowTheme.of(context).headlineSmall.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).headlineSmall.fontStyle,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(16.0, 6.0, 16.0, 0.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                                                  children: [
                                                                                    Container(
                                                                                      width: 48.0,
                                                                                      height: 48.0,
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).accent2,
                                                                                        borderRadius: BorderRadius.circular(24.0),
                                                                                      ),
                                                                                      child: Align(
                                                                                        alignment: AlignmentDirectional(0.0, 0.0),
                                                                                        child: Icon(
                                                                                          Icons.sports_kabaddi_sharp,
                                                                                          color: Color(0xFF249689),
                                                                                          size: 24.0,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Expanded(
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.min,
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          Text(
                                                                                            valueOrDefault<String>(
                                                                                              stackRegionalChallengesRecord?.descriptionOfChall,
                                                                                              'DescriptionOfChall',
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  font: GoogleFonts.inter(
                                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                  ),
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ].divide(SizedBox(width: 12.0)),
                                                                                ),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(16.0, 6.0, 16.0, 0.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  children: [
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Text(
                                                                                          'Time remaining: ',
                                                                                          style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                font: GoogleFonts.inter(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                                ),
                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                              ),
                                                                                        ),
                                                                                        Text(
                                                                                          valueOrDefault<String>(
                                                                                            dateTimeFormat("relative", stackRegionalChallengesRecord?.challengeEndDate),
                                                                                            'challenge_EndDate',
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                font: GoogleFonts.inter(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                                ),
                                                                                                color: FlutterFlowTheme.of(context).success,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                              ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                    Align(
                                                                                      alignment: AlignmentDirectional(1.0, 0.0),
                                                                                      child: Stack(
                                                                                        alignment: AlignmentDirectional(1.0, 0.0),
                                                                                        children: [
                                                                                          InkWell(
                                                                                            splashColor: Colors.transparent,
                                                                                            focusColor: Colors.transparent,
                                                                                            hoverColor: Colors.transparent,
                                                                                            highlightColor: Colors.transparent,
                                                                                            onTap: () async {
                                                                                              await stackRegionalChallengesRecord!.reference.update({
                                                                                                ...mapToFirestore(
                                                                                                  {
                                                                                                    'completed_by_usersR': FieldValue.arrayUnion([currentUserReference]),
                                                                                                  },
                                                                                                ),
                                                                                              });
                                                                                            },
                                                                                            child: Icon(
                                                                                              Icons.circle_outlined,
                                                                                              color: Color(0xB657636C),
                                                                                              size: 40.0,
                                                                                            ),
                                                                                          ),
                                                                                          if (stackRegionalChallengesRecord?.completedByUsersR?.contains(currentUserReference) ?? true)
                                                                                            Align(
                                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                                              child: Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(1.0, 1.0, 0.5, 0.5),
                                                                                                child: InkWell(
                                                                                                  splashColor: Colors.transparent,
                                                                                                  focusColor: Colors.transparent,
                                                                                                  hoverColor: Colors.transparent,
                                                                                                  highlightColor: Colors.transparent,
                                                                                                  onTap: () async {
                                                                                                    await stackRegionalChallengesRecord!.reference.update({
                                                                                                      ...mapToFirestore(
                                                                                                        {
                                                                                                          'completed_by_usersR': FieldValue.arrayRemove([currentUserReference]),
                                                                                                          'completedCounts': FieldValue.increment(1),
                                                                                                        },
                                                                                                      ),
                                                                                                    });
                                                                                                  },
                                                                                                  child: Icon(
                                                                                                    Icons.check_circle,
                                                                                                    color: FlutterFlowTheme.of(context).success,
                                                                                                    size: 38.0,
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Icon(
                                                                                    Icons.emoji_events,
                                                                                    color: FlutterFlowTheme.of(context).success,
                                                                                    size: 20.0,
                                                                                  ),
                                                                                  Text(
                                                                                    'You\'ve got this! Stay consistent and focused.',
                                                                                    style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                          font: GoogleFonts.inter(
                                                                                            fontWeight: FontWeight.w600,
                                                                                            fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                          ),
                                                                                          color: FlutterFlowTheme.of(context).success,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w600,
                                                                                          fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                ].divide(SizedBox(width: 8.0)),
                                                                              ),
                                                                            ].divide(SizedBox(height: 12.0)),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ].divide(SizedBox(
                                                                  height:
                                                                      10.0)),
                                                            ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            height: 10.0)),
                                                      ),
                                                      Container(
                                                        width: double.infinity,
                                                        height: double.infinity,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                        ),
                                                        child: ListView(
                                                          padding:
                                                              EdgeInsets.zero,
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          children: [
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                StreamBuilder<
                                                                    List<
                                                                        RegionalChallengesRecord>>(
                                                                  stream:
                                                                      queryRegionalChallengesRecord(
                                                                    queryBuilder: (regionalChallengesRecord) =>
                                                                        regionalChallengesRecord
                                                                            .where(
                                                                              'is_active',
                                                                              isEqualTo: true,
                                                                            )
                                                                            .orderBy('completedCounts',
                                                                                descending: true),
                                                                  ),
                                                                  builder: (context,
                                                                      snapshot) {
                                                                    // Customize what your widget looks like when it's loading.
                                                                    if (!snapshot
                                                                        .hasData) {
                                                                      return Center(
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              10.0,
                                                                          height:
                                                                              10.0,
                                                                          child:
                                                                              CircularProgressIndicator(
                                                                            valueColor:
                                                                                AlwaysStoppedAnimation<Color>(
                                                                              Color(0x00249689),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                    List<RegionalChallengesRecord>
                                                                        containerRegionalChallengesRecordList =
                                                                        snapshot
                                                                            .data!;

                                                                    return Container(
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            24.0,
                                                                            0.0,
                                                                            24.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.min,
                                                                          children:
                                                                              [
                                                                            Align(
                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                child: Text(
                                                                                  'Leaderboard',
                                                                                  style: FlutterFlowTheme.of(context).headlineLarge.override(
                                                                                        font: GoogleFonts.interTight(
                                                                                          fontWeight: FontWeight.bold,
                                                                                          fontStyle: FlutterFlowTheme.of(context).headlineLarge.fontStyle,
                                                                                        ),
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.bold,
                                                                                        fontStyle: FlutterFlowTheme.of(context).headlineLarge.fontStyle,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                              child: Container(
                                                                                width: double.infinity,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).alternate,
                                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                                  border: Border.all(
                                                                                    color: FlutterFlowTheme.of(context).alternate,
                                                                                    width: 1.0,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.min,
                                                                                children: [
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                    crossAxisAlignment: CrossAxisAlignment.end,
                                                                                    children: [
                                                                                      Column(
                                                                                        mainAxisSize: MainAxisSize.min,
                                                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                                                        children: [
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
                                                                                            child: Container(
                                                                                              width: 80.0,
                                                                                              height: 80.0,
                                                                                              child: Stack(
                                                                                                children: [
                                                                                                  Container(
                                                                                                    width: 80.0,
                                                                                                    height: 80.0,
                                                                                                    decoration: BoxDecoration(
                                                                                                      color: FlutterFlowTheme.of(context).accent2,
                                                                                                      borderRadius: BorderRadius.circular(40.0),
                                                                                                      border: Border.all(
                                                                                                        color: FlutterFlowTheme.of(context).secondary,
                                                                                                        width: 3.0,
                                                                                                      ),
                                                                                                    ),
                                                                                                    child: Stack(
                                                                                                      children: [
                                                                                                        if (valueOrDefault<String>(
                                                                                                              containerRegionalChallengesRecordList.elementAtOrNull(1)?.targetCity,
                                                                                                              'a',
                                                                                                            ) ==
                                                                                                            'Abha')
                                                                                                          ClipRRect(
                                                                                                            borderRadius: BorderRadius.circular(40.0),
                                                                                                            child: Image.asset(
                                                                                                              'assets/images/photo-1660841699513-bd3d3322c17f.jpeg',
                                                                                                              width: 80.0,
                                                                                                              height: 80.0,
                                                                                                              fit: BoxFit.cover,
                                                                                                              alignment: Alignment(1.0, -1.0),
                                                                                                            ),
                                                                                                          ),
                                                                                                        if (valueOrDefault<String>(
                                                                                                              containerRegionalChallengesRecordList.elementAtOrNull(1)?.targetCity,
                                                                                                              'a',
                                                                                                            ) ==
                                                                                                            'Jeddah')
                                                                                                          Align(
                                                                                                            alignment: AlignmentDirectional(0.0, -3.0),
                                                                                                            child: ClipRRect(
                                                                                                              borderRadius: BorderRadius.circular(40.0),
                                                                                                              child: Image.asset(
                                                                                                                'assets/images/istockphoto-2152510409-612x612.jpg',
                                                                                                                width: 80.0,
                                                                                                                height: 80.0,
                                                                                                                fit: BoxFit.cover,
                                                                                                                alignment: Alignment(-1.0, -1.0),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        if (valueOrDefault<String>(
                                                                                                              containerRegionalChallengesRecordList.elementAtOrNull(1)?.targetCity,
                                                                                                              'a',
                                                                                                            ) ==
                                                                                                            'Riyadh')
                                                                                                          ClipRRect(
                                                                                                            borderRadius: BorderRadius.circular(40.0),
                                                                                                            child: Image.asset(
                                                                                                              'assets/images/photo-1577968946327-25e3eb1e8c3d.jpeg',
                                                                                                              width: 80.0,
                                                                                                              height: 80.0,
                                                                                                              fit: BoxFit.cover,
                                                                                                              alignment: Alignment(0.0, 1.0),
                                                                                                            ),
                                                                                                          ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
                                                                                            child: Text(
                                                                                              valueOrDefault<String>(
                                                                                                containerRegionalChallengesRecordList.elementAtOrNull(1)?.targetCity,
                                                                                                'a',
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    font: GoogleFonts.inter(
                                                                                                      fontWeight: FontWeight.w600,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                    ),
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w600,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          Container(
                                                                                            width: 60.0,
                                                                                            height: 56.8,
                                                                                            decoration: BoxDecoration(
                                                                                              gradient: LinearGradient(
                                                                                                colors: [
                                                                                                  FlutterFlowTheme.of(context).success,
                                                                                                  Color(0xFF10D6BF)
                                                                                                ],
                                                                                                stops: [0.0, 1.0],
                                                                                                begin: AlignmentDirectional(0.0, 1.0),
                                                                                                end: AlignmentDirectional(0, -1.0),
                                                                                              ),
                                                                                              borderRadius: BorderRadius.only(
                                                                                                topLeft: Radius.circular(8.0),
                                                                                                topRight: Radius.circular(8.0),
                                                                                              ),
                                                                                            ),
                                                                                            child: Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                                                                                              child: Column(
                                                                                                mainAxisSize: MainAxisSize.min,
                                                                                                mainAxisAlignment: MainAxisAlignment.end,
                                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                children: [
                                                                                                  Text(
                                                                                                    '2',
                                                                                                    style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                          font: GoogleFonts.inter(
                                                                                                            fontWeight: FontWeight.bold,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                          ),
                                                                                                          color: FlutterFlowTheme.of(context).info,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.bold,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                        ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ].divide(SizedBox(height: 8.0)),
                                                                                      ),
                                                                                      Column(
                                                                                        mainAxisSize: MainAxisSize.min,
                                                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                                                        children: [
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
                                                                                            child: Container(
                                                                                              width: 90.0,
                                                                                              height: 90.0,
                                                                                              child: Stack(
                                                                                                children: [
                                                                                                  Container(
                                                                                                    width: 90.0,
                                                                                                    height: 90.0,
                                                                                                    decoration: BoxDecoration(
                                                                                                      color: FlutterFlowTheme.of(context).accent1,
                                                                                                      borderRadius: BorderRadius.circular(45.0),
                                                                                                      border: Border.all(
                                                                                                        color: FlutterFlowTheme.of(context).warning,
                                                                                                        width: 4.0,
                                                                                                      ),
                                                                                                    ),
                                                                                                    child: Stack(
                                                                                                      children: [
                                                                                                        if (valueOrDefault<String>(
                                                                                                              containerRegionalChallengesRecordList.elementAtOrNull(0)?.targetCity,
                                                                                                              'a',
                                                                                                            ) ==
                                                                                                            'Abha')
                                                                                                          Align(
                                                                                                            alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                            child: ClipRRect(
                                                                                                              borderRadius: BorderRadius.circular(40.0),
                                                                                                              child: Image.asset(
                                                                                                                'assets/images/photo-1660841699513-bd3d3322c17f.jpeg',
                                                                                                                width: 80.0,
                                                                                                                height: 80.0,
                                                                                                                fit: BoxFit.cover,
                                                                                                                alignment: Alignment(0.0, 1.0),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        if (valueOrDefault<String>(
                                                                                                              containerRegionalChallengesRecordList.elementAtOrNull(0)?.targetCity,
                                                                                                              'a',
                                                                                                            ) ==
                                                                                                            'Jeddah')
                                                                                                          Align(
                                                                                                            alignment: AlignmentDirectional(0.0, -3.0),
                                                                                                            child: ClipRRect(
                                                                                                              borderRadius: BorderRadius.circular(40.0),
                                                                                                              child: Image.asset(
                                                                                                                'assets/images/istockphoto-2152510409-612x612.jpg',
                                                                                                                width: 80.0,
                                                                                                                height: 107.64,
                                                                                                                fit: BoxFit.cover,
                                                                                                                alignment: Alignment(-1.0, -1.0),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        if (valueOrDefault<String>(
                                                                                                              containerRegionalChallengesRecordList.elementAtOrNull(0)?.targetCity,
                                                                                                              'a',
                                                                                                            ) ==
                                                                                                            'Riyadh')
                                                                                                          ClipRRect(
                                                                                                            borderRadius: BorderRadius.circular(40.0),
                                                                                                            child: Image.asset(
                                                                                                              'assets/images/photo-1577968946327-25e3eb1e8c3d.jpeg',
                                                                                                              width: 80.0,
                                                                                                              height: 80.0,
                                                                                                              fit: BoxFit.cover,
                                                                                                              alignment: Alignment(0.0, 1.0),
                                                                                                            ),
                                                                                                          ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                  Align(
                                                                                                    alignment: AlignmentDirectional(0.0, -1.2),
                                                                                                    child: Container(
                                                                                                      width: 24.0,
                                                                                                      height: 24.0,
                                                                                                      decoration: BoxDecoration(
                                                                                                        color: FlutterFlowTheme.of(context).warning,
                                                                                                        borderRadius: BorderRadius.circular(12.0),
                                                                                                      ),
                                                                                                      child: Icon(
                                                                                                        Icons.emoji_events,
                                                                                                        color: Colors.white,
                                                                                                        size: 16.0,
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
                                                                                            child: Text(
                                                                                              valueOrDefault<String>(
                                                                                                containerRegionalChallengesRecordList.elementAtOrNull(0)?.targetCity,
                                                                                                'a',
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    font: GoogleFonts.inter(
                                                                                                      fontWeight: FontWeight.w600,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                    ),
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w600,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          Container(
                                                                                            width: 80.0,
                                                                                            height: 75.9,
                                                                                            decoration: BoxDecoration(
                                                                                              gradient: LinearGradient(
                                                                                                colors: [
                                                                                                  FlutterFlowTheme.of(context).success,
                                                                                                  Color(0xFF10D6BF)
                                                                                                ],
                                                                                                stops: [0.0, 1.0],
                                                                                                begin: AlignmentDirectional(0.0, 1.0),
                                                                                                end: AlignmentDirectional(0, -1.0),
                                                                                              ),
                                                                                              borderRadius: BorderRadius.only(
                                                                                                topLeft: Radius.circular(8.0),
                                                                                                topRight: Radius.circular(8.0),
                                                                                              ),
                                                                                            ),
                                                                                            child: Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                                                                                              child: Column(
                                                                                                mainAxisSize: MainAxisSize.min,
                                                                                                mainAxisAlignment: MainAxisAlignment.end,
                                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                children: [
                                                                                                  Text(
                                                                                                    '1',
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          font: GoogleFonts.inter(
                                                                                                            fontWeight: FontWeight.bold,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                          ),
                                                                                                          color: FlutterFlowTheme.of(context).info,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.bold,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                        ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ].divide(SizedBox(height: 8.0)),
                                                                                      ),
                                                                                      Column(
                                                                                        mainAxisSize: MainAxisSize.min,
                                                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                                                        children: [
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
                                                                                            child: Container(
                                                                                              width: 80.0,
                                                                                              height: 80.0,
                                                                                              child: Stack(
                                                                                                children: [
                                                                                                  Container(
                                                                                                    width: 80.0,
                                                                                                    height: 80.0,
                                                                                                    decoration: BoxDecoration(
                                                                                                      color: FlutterFlowTheme.of(context).accent3,
                                                                                                      borderRadius: BorderRadius.circular(40.0),
                                                                                                      border: Border.all(
                                                                                                        color: Color(0xFFFFA67F),
                                                                                                        width: 3.0,
                                                                                                      ),
                                                                                                    ),
                                                                                                    child: Stack(
                                                                                                      children: [
                                                                                                        if (valueOrDefault<String>(
                                                                                                              containerRegionalChallengesRecordList.elementAtOrNull(2)?.targetCity,
                                                                                                              'a',
                                                                                                            ) ==
                                                                                                            'Abha')
                                                                                                          ClipRRect(
                                                                                                            borderRadius: BorderRadius.circular(40.0),
                                                                                                            child: Image.asset(
                                                                                                              'assets/images/photo-1660841699513-bd3d3322c17f.jpeg',
                                                                                                              width: 80.0,
                                                                                                              height: 80.0,
                                                                                                              fit: BoxFit.cover,
                                                                                                              alignment: Alignment(1.0, -1.0),
                                                                                                            ),
                                                                                                          ),
                                                                                                        if (valueOrDefault<String>(
                                                                                                              containerRegionalChallengesRecordList.elementAtOrNull(2)?.targetCity,
                                                                                                              'a',
                                                                                                            ) ==
                                                                                                            'Jeddah')
                                                                                                          Align(
                                                                                                            alignment: AlignmentDirectional(0.0, -3.0),
                                                                                                            child: ClipRRect(
                                                                                                              borderRadius: BorderRadius.circular(40.0),
                                                                                                              child: Image.asset(
                                                                                                                'assets/images/istockphoto-2152510409-612x612.jpg',
                                                                                                                width: 80.0,
                                                                                                                height: 80.0,
                                                                                                                fit: BoxFit.cover,
                                                                                                                alignment: Alignment(-1.0, -1.0),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        if (valueOrDefault<String>(
                                                                                                              containerRegionalChallengesRecordList.elementAtOrNull(2)?.targetCity,
                                                                                                              'a',
                                                                                                            ) ==
                                                                                                            'Riyadh')
                                                                                                          ClipRRect(
                                                                                                            borderRadius: BorderRadius.circular(40.0),
                                                                                                            child: Image.asset(
                                                                                                              'assets/images/photo-1577968946327-25e3eb1e8c3d.jpeg',
                                                                                                              width: 80.0,
                                                                                                              height: 80.0,
                                                                                                              fit: BoxFit.cover,
                                                                                                              alignment: Alignment(0.0, 1.0),
                                                                                                            ),
                                                                                                          ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
                                                                                            child: Text(
                                                                                              valueOrDefault<String>(
                                                                                                containerRegionalChallengesRecordList.elementAtOrNull(2)?.targetCity,
                                                                                                'a',
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    font: GoogleFonts.inter(
                                                                                                      fontWeight: FontWeight.w600,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                    ),
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w600,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          Container(
                                                                                            width: 60.0,
                                                                                            height: 40.0,
                                                                                            decoration: BoxDecoration(
                                                                                              gradient: LinearGradient(
                                                                                                colors: [
                                                                                                  FlutterFlowTheme.of(context).success,
                                                                                                  Color(0xFF10D6BF)
                                                                                                ],
                                                                                                stops: [0.0, 1.0],
                                                                                                begin: AlignmentDirectional(0.0, 1.0),
                                                                                                end: AlignmentDirectional(0, -1.0),
                                                                                              ),
                                                                                              borderRadius: BorderRadius.only(
                                                                                                topLeft: Radius.circular(8.0),
                                                                                                topRight: Radius.circular(8.0),
                                                                                              ),
                                                                                            ),
                                                                                            child: Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                                                                                              child: Column(
                                                                                                mainAxisSize: MainAxisSize.min,
                                                                                                mainAxisAlignment: MainAxisAlignment.end,
                                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                children: [
                                                                                                  Text(
                                                                                                    '3',
                                                                                                    style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                          font: GoogleFonts.inter(
                                                                                                            fontWeight: FontWeight.bold,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                          ),
                                                                                                          color: FlutterFlowTheme.of(context).info,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.bold,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                        ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ].divide(SizedBox(height: 8.0)),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ].divide(SizedBox(height: 16.0)),
                                                                              ),
                                                                            ),
                                                                          ].divide(SizedBox(height: 24.0)),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 1.0),
                      child: wrapWithModel(
                        model: _model.navBar1Model,
                        updateCallback: () => safeSetState(() {}),
                        child: NavBar1Widget(
                          page: 'Riyadh',
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
