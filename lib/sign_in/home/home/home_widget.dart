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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_model.dart';
export 'home_model.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  static String routeName = 'HOME';
  static String routePath = '/home';

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  late HomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().selectedDate = getCurrentTimestamp;
      FFAppState().currentHour = DateTime.now().hour;
      safeSetState(() {});
      _model.activeCalloutput = await actions.countActiveChallenges(
        context,
        currentUserReference!,
      );
      _model.completedChall = await actions.countCompletedChallenges(
        context,
        currentUserReference!,
      );
      FFAppState().completedChall = valueOrDefault<int>(
        _model.completedChall,
        1,
      );
      FFAppState().activeChall = _model.activeCalloutput!;
      safeSetState(() {});
      if (functions.hasStreakBroken(currentUserDocument?.lastCompletionDate)!) {
        await currentUserReference!.update(createUsersRecordData(
          dailyStreak: 0,
        ));
      }
      _model.countdownTimer = InstantTimer.periodic(
        duration: Duration(milliseconds: 1000),
        callback: (timer) async {
          FFAppState().countdownDisplay = functions.getDynamicCountdown()!;
          safeSetState(() {});
        },
        startImmediately: true,
      );
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              SingleChildScrollView(
                controller: _model.columnController,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 12.0,
                            color: Color(0xFED2F5F0),
                            offset: Offset(
                              0.0,
                              4.0,
                            ),
                            spreadRadius: 0.0,
                          )
                        ],
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(24.0),
                          bottomRight: Radius.circular(24.0),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 16.0, 16.0, 50.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Stack(
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 12.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Stack(
                                            alignment: AlignmentDirectional(
                                                0.3999999999999999, -0.35),
                                            children: [
                                              FlutterFlowIconButton(
                                                borderColor: Colors.transparent,
                                                borderRadius: 30.0,
                                                borderWidth: 1.0,
                                                buttonSize: 48.0,
                                                icon: Icon(
                                                  Icons.notifications,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 24.0,
                                                ),
                                                onPressed: () async {
                                                  context.pushNamed(
                                                      NotificationsWidget
                                                          .routeName);
                                                },
                                              ),
                                              AuthUserStreamWidget(
                                                builder: (context) =>
                                                    StreamBuilder<
                                                        List<
                                                            NotificationRecord>>(
                                                  stream:
                                                      queryNotificationRecord(
                                                    parent:
                                                        currentUserReference,
                                                    queryBuilder:
                                                        (notificationRecord) =>
                                                            notificationRecord
                                                                .where(
                                                      'notification_timestamp',
                                                      isGreaterThan:
                                                          currentUserDocument
                                                              ?.lastNotifyReadTime,
                                                    ),
                                                    singleRecord: true,
                                                  ),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 10.0,
                                                          height: 10.0,
                                                          child:
                                                              CircularProgressIndicator(
                                                            valueColor:
                                                                AlwaysStoppedAnimation<
                                                                    Color>(
                                                              Color(0x00FF5963),
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    List<NotificationRecord>
                                                        containerNotificationRecordList =
                                                        snapshot.data!;
                                                    // Return an empty Container when the item does not exist.
                                                    if (snapshot
                                                        .data!.isEmpty) {
                                                      return Container();
                                                    }
                                                    final containerNotificationRecord =
                                                        containerNotificationRecordList
                                                                .isNotEmpty
                                                            ? containerNotificationRecordList
                                                                .first
                                                            : null;

                                                    return Container(
                                                      width: 12.0,
                                                      height: 12.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Container(
                                                        width: 12.0,
                                                        height: 12.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ].divide(SizedBox(width: 8.0)),
                                      ),
                                      Stack(
                                        alignment:
                                            AlignmentDirectional(1.0, 0.0),
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    25.0, 0.0, 0.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      _model.currentWeekOffset =
                                                          _model.currentWeekOffset +
                                                              -1;
                                                      safeSetState(() {});
                                                    },
                                                    child: Icon(
                                                      Icons.arrow_back_ios,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      size: 24.0,
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Text(
                                                    dateTimeFormat(
                                                        "yMMMd",
                                                        FFAppState()
                                                            .selectedDate),
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .headlineMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .interTight(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineMedium
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineMedium
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      _model.currentWeekOffset =
                                                          _model.currentWeekOffset +
                                                              1;
                                                      safeSetState(() {});
                                                    },
                                                    child: Icon(
                                                      Icons.arrow_forward_ios,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      size: 24.0,
                                                    ),
                                                  ),
                                                ),
                                                Wrap(
                                                  spacing: 0.0,
                                                  runSpacing: 0.0,
                                                  alignment:
                                                      WrapAlignment.start,
                                                  crossAxisAlignment:
                                                      WrapCrossAlignment.start,
                                                  direction: Axis.horizontal,
                                                  runAlignment:
                                                      WrapAlignment.start,
                                                  verticalDirection:
                                                      VerticalDirection.down,
                                                  clipBehavior: Clip.none,
                                                  children: [
                                                    if (_model
                                                            .currentWeekOffset !=
                                                        0)
                                                      InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          _model.currentWeekOffset =
                                                              0;
                                                          safeSetState(() {});
                                                        },
                                                        child: Icon(
                                                          Icons.restart_alt,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          size: 24.0,
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              ].divide(SizedBox(width: 8.0)),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Align(
                                            alignment: AlignmentDirectional(
                                                -2.57, -0.03),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 16.0, 10.0, 8.0),
                                              child: StreamBuilder<
                                                  List<UsersRecord>>(
                                                stream: queryUsersRecord(
                                                  queryBuilder: (usersRecord) =>
                                                      usersRecord.where(
                                                    'uid',
                                                    isEqualTo: currentUserUid,
                                                  ),
                                                  singleRecord: true,
                                                ),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 10.0,
                                                        height: 10.0,
                                                        child:
                                                            CircularProgressIndicator(
                                                          valueColor:
                                                              AlwaysStoppedAnimation<
                                                                  Color>(
                                                            Color(0x004B39EF),
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  List<UsersRecord>
                                                      containerUsersRecordList =
                                                      snapshot.data!;
                                                  // Return an empty Container when the item does not exist.
                                                  if (snapshot.data!.isEmpty) {
                                                    return Container();
                                                  }
                                                  final containerUsersRecord =
                                                      containerUsersRecordList
                                                              .isNotEmpty
                                                          ? containerUsersRecordList
                                                              .first
                                                          : null;

                                                  return Container(
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 8.0,
                                                          color:
                                                              Color(0xFFE0D4FF),
                                                          offset: Offset(
                                                            0.0,
                                                            2.0,
                                                          ),
                                                          spreadRadius: 0.0,
                                                        )
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(12.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Icon(
                                                            Icons
                                                                .local_fire_department,
                                                            color: Color(
                                                                0xFFEE8B60),
                                                          ),
                                                          Text(
                                                            valueOrDefault<
                                                                String>(
                                                              containerUsersRecord
                                                                  ?.dailyStreak
                                                                  ?.toString(),
                                                              '0',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  fontSize:
                                                                      18.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            width: 4.0)),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ].divide(SizedBox(width: 4.0)),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              height: 83.8,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Builder(
                                      builder: (context) {
                                        final weekView = functions
                                            .getCurrentWeekDates(
                                                _model.currentWeekOffset)
                                            .toList();

                                        return InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            await _model.listViewController
                                                ?.animateTo(
                                              _model.listViewController!
                                                  .position.maxScrollExtent,
                                              duration:
                                                  Duration(milliseconds: 100),
                                              curve: Curves.ease,
                                            );
                                          },
                                          child: ListView.separated(
                                            padding: EdgeInsets.zero,
                                            primary: false,
                                            scrollDirection: Axis.horizontal,
                                            itemCount: weekView.length,
                                            separatorBuilder: (_, __) =>
                                                SizedBox(width: 33.0),
                                            itemBuilder:
                                                (context, weekViewIndex) {
                                              final weekViewItem =
                                                  weekView[weekViewIndex];
                                              return InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  FFAppState().selectedDate =
                                                      weekViewItem;
                                                  safeSetState(() {});
                                                },
                                                child: Container(
                                                  width: 52.1,
                                                  height: 79.6,
                                                  decoration: BoxDecoration(
                                                    color: () {
                                                      if (functions.areDatesTheSame(
                                                          weekViewItem,
                                                          FFAppState()
                                                              .selectedDate)!) {
                                                        return Color(
                                                            0xFFA4ECE3);
                                                      } else if (functions
                                                          .isCurrentDay(
                                                              weekViewItem)!) {
                                                        return Color(
                                                            0xFF7ACFC4);
                                                      } else {
                                                        return FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground;
                                                      }
                                                    }(),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.all(8.0),
                                                        child: Text(
                                                          dateTimeFormat("E",
                                                              weekViewItem),
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: functions.areDatesTheSame(
                                                                        weekViewItem,
                                                                        FFAppState()
                                                                            .selectedDate)!
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                      ),
                                                      Container(
                                                        width: 41.4,
                                                        height: 41.4,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: functions.areDatesTheSame(
                                                                  weekViewItem,
                                                                  FFAppState()
                                                                      .selectedDate)!
                                                              ? Colors.white
                                                              : FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                          shape:
                                                              BoxShape.circle,
                                                          border: Border.all(
                                                            color: Color(
                                                                0xFFA3B5C3),
                                                          ),
                                                        ),
                                                        child: Stack(
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0,
                                                                      -1.0),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            9.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  dateTimeFormat(
                                                                      "d",
                                                                      weekViewItem),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .inter(
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyLarge
                                                                              .fontStyle,
                                                                        ),
                                                                        color: functions.areDatesTheSame(weekViewItem,
                                                                                FFAppState().selectedDate)!
                                                                            ? FlutterFlowTheme.of(context).primaryText
                                                                            : Color(0xC457636C),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyLarge
                                                                            .fontStyle,
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
                                              );
                                            },
                                            controller:
                                                _model.listViewController,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ].divide(SizedBox(height: 16.0)),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 12.0),
                          child: Container(
                            width: 540.6,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(0.0),
                            ),
                            alignment: AlignmentDirectional(0.0, 1.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  valueOrDefault<String>(
                                    dateTimeFormat(
                                        "EEEE", FFAppState().selectedDate),
                                    'Today\'s',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .override(
                                        font: GoogleFonts.interTight(
                                          fontWeight: FontWeight.bold,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleMedium
                                                  .fontStyle,
                                        ),
                                        fontSize: 20.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .fontStyle,
                                        lineHeight: 1.5,
                                      ),
                                ),
                                Text(
                                  ' Challenges',
                                  style: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .override(
                                        font: GoogleFonts.interTight(
                                          fontWeight: FontWeight.bold,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleMedium
                                                  .fontStyle,
                                        ),
                                        fontSize: 20.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .fontStyle,
                                        lineHeight: 1.5,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Finish the current challenge before the time runs out! : ',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                            Text(
                              FFAppState().countdownDisplay,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 18.0, 20.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              if (valueOrDefault<bool>(
                                functions
                                    .isFutureDate(FFAppState().selectedDate),
                                false,
                              ))
                                Align(
                                  alignment: AlignmentDirectional(0.0, -1.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 24.0, 20.0, 24.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 16.0, 16.0, 16.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: 80.0,
                                              height: 80.0,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(40.0),
                                              ),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Icon(
                                                  Icons.calendar_today_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 40.0,
                                                ),
                                              ),
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Text(
                                                    'No challenge for today yet',
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .interTight(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleMedium
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Text(
                                                    'stay tuned for upcoming ones and keep the streak going!',
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                ),
                                              ].divide(SizedBox(height: 8.0)),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              if (dateTimeFormat(
                                      "d/M", FFAppState().selectedDate) ==
                                  dateTimeFormat("d/M", getCurrentTimestamp))
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    if (FFAppState().currentHour >= 20)
                                      Opacity(
                                        opacity: FFAppState().currentHour >= 24
                                            ? 0.5
                                            : 1.0,
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          child: StreamBuilder<
                                              List<ChallengesRecord>>(
                                            stream: queryChallengesRecord(
                                              parent: currentUserReference,
                                              queryBuilder:
                                                  (challengesRecord) =>
                                                      challengesRecord.where(
                                                'time_slot_num',
                                                isEqualTo: 20,
                                              ),
                                              singleRecord: true,
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 50,
                                                    height: 50,
                                                    child:
                                                        CircularProgressIndicator(
                                                      valueColor:
                                                          AlwaysStoppedAnimation<
                                                              Color>(
                                                        Color(0x00FFFFFF),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<ChallengesRecord>
                                                  containerChallengeChallengesRecordList =
                                                  snapshot.data!;
                                              // Return an empty Container when the item does not exist.
                                              if (snapshot.data!.isEmpty) {
                                                return Container();
                                              }
                                              final containerChallengeChallengesRecord =
                                                  containerChallengeChallengesRecordList
                                                          .isNotEmpty
                                                      ? containerChallengeChallengesRecordList
                                                          .first
                                                      : null;

                                              return Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 3.0,
                                                      color: Color(0x33000000),
                                                      offset: Offset(
                                                        0.0,
                                                        1.0,
                                                      ),
                                                    )
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                    width: 2.0,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(16.0, 16.0,
                                                          16.0, 16.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Stack(
                                                        children: [
                                                          if (containerChallengeChallengesRecord
                                                                  ?.focusArea ==
                                                              'Nutrition')
                                                            Container(
                                                              width: 48.0,
                                                              height: 48.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .accent2,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            24.0),
                                                              ),
                                                              child: Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: FaIcon(
                                                                  FontAwesomeIcons
                                                                      .appleAlt,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary,
                                                                  size: 24.0,
                                                                ),
                                                              ),
                                                            ),
                                                          if (containerChallengeChallengesRecord
                                                                  ?.focusArea ==
                                                              'Breathing')
                                                            Container(
                                                              width: 48.0,
                                                              height: 48.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color(
                                                                    0x4CEE8B60),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            24.0),
                                                              ),
                                                              child: Icon(
                                                                Icons
                                                                    .favorite_rounded,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .tertiary,
                                                                size: 24.0,
                                                              ),
                                                            ),
                                                          if (containerChallengeChallengesRecord
                                                                  ?.focusArea ==
                                                              'Hydration')
                                                            Container(
                                                              width: 48.0,
                                                              height: 48.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color(
                                                                    0x4D44EF39),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            24.0),
                                                              ),
                                                              child: Icon(
                                                                Icons
                                                                    .water_drop,
                                                                color: Color(
                                                                    0xFF32CC28),
                                                                size: 24.0,
                                                              ),
                                                            ),
                                                          if (containerChallengeChallengesRecord
                                                                  ?.focusArea ==
                                                              'Movement')
                                                            Container(
                                                              width: 48.0,
                                                              height: 48.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color(
                                                                    0x4DF9CF58),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            24.0),
                                                              ),
                                                              child: Icon(
                                                                Icons
                                                                    .directions_run,
                                                                color: Color(
                                                                    0xFFF0BE29),
                                                                size: 24.0,
                                                              ),
                                                            ),
                                                        ],
                                                      ),
                                                      Expanded(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                containerChallengeChallengesRecord
                                                                    ?.title,
                                                                'no challage today',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .interTight(
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleMedium
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                            Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                containerChallengeChallengesRecord
                                                                    ?.description,
                                                                'no ',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .inter(
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                          ].divide(SizedBox(
                                                              height: 4.0)),
                                                        ),
                                                      ),
                                                      if ((FFAppState()
                                                                  .currentHour >=
                                                              20) &&
                                                          true)
                                                        Container(
                                                          width: 45.9,
                                                          height: 42.1,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Builder(
                                                            builder: (context) =>
                                                                FlutterFlowIconButton(
                                                              borderRadius: 8.0,
                                                              buttonSize: 17.9,
                                                              fillColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .success,
                                                              disabledColor:
                                                                  Color(
                                                                      0xFF57636C),
                                                              icon: Icon(
                                                                Icons
                                                                    .check_circle,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                              ),
                                                              onPressed: ((FFAppState()
                                                                              .iscompleted4 ==
                                                                          true) ||
                                                                      (DateTime.now()
                                                                              .hour >=
                                                                          24))
                                                                  ? null
                                                                  : () async {
                                                                      if (dateTimeFormat(
                                                                              "y/M/d",
                                                                              currentUserDocument
                                                                                  ?.lastCompletionDate) !=
                                                                          dateTimeFormat(
                                                                              "y/M/d",
                                                                              getCurrentTimestamp)) {
                                                                        await currentUserReference!
                                                                            .update({
                                                                          ...createUsersRecordData(
                                                                            lastCompletionDate:
                                                                                getCurrentTimestamp,
                                                                          ),
                                                                          ...mapToFirestore(
                                                                            {
                                                                              'daily_streak': FieldValue.increment(1),
                                                                            },
                                                                          ),
                                                                        });
                                                                        await Future
                                                                            .delayed(
                                                                          Duration(
                                                                            milliseconds:
                                                                                200,
                                                                          ),
                                                                        );
                                                                      } else {
                                                                        await Future
                                                                            .delayed(
                                                                          Duration(
                                                                            milliseconds:
                                                                                10,
                                                                          ),
                                                                        );
                                                                      }

                                                                      await containerChallengeChallengesRecord!
                                                                          .reference
                                                                          .update(
                                                                              createChallengesRecordData(
                                                                        status:
                                                                            '\"Completed\"',
                                                                      ));
                                                                      FFAppState()
                                                                              .iscompleted4 =
                                                                          true;
                                                                      safeSetState(
                                                                          () {});
                                                                      await showDialog(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (dialogContext) {
                                                                          return Dialog(
                                                                            elevation:
                                                                                0,
                                                                            insetPadding:
                                                                                EdgeInsets.zero,
                                                                            backgroundColor:
                                                                                Colors.transparent,
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                            child:
                                                                                GestureDetector(
                                                                              onTap: () {
                                                                                FocusScope.of(dialogContext).unfocus();
                                                                                FocusManager.instance.primaryFocus?.unfocus();
                                                                              },
                                                                              child: StreakWidget(),
                                                                            ),
                                                                          );
                                                                        },
                                                                      );
                                                                    },
                                                            ),
                                                          ),
                                                        ),
                                                    ].divide(
                                                        SizedBox(width: 16.0)),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    if (FFAppState().currentHour >= 16)
                                      Opacity(
                                        opacity: FFAppState().currentHour >= 20
                                            ? 0.5
                                            : 1.0,
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          child: StreamBuilder<
                                              List<ChallengesRecord>>(
                                            stream: queryChallengesRecord(
                                              parent: currentUserReference,
                                              queryBuilder:
                                                  (challengesRecord) =>
                                                      challengesRecord.where(
                                                'time_slot_num',
                                                isEqualTo: 16,
                                              ),
                                              singleRecord: true,
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 50,
                                                    height: 50,
                                                    child:
                                                        CircularProgressIndicator(
                                                      valueColor:
                                                          AlwaysStoppedAnimation<
                                                              Color>(
                                                        Color(0x00FFFFFF),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<ChallengesRecord>
                                                  containerChallengeChallengesRecordList =
                                                  snapshot.data!;
                                              // Return an empty Container when the item does not exist.
                                              if (snapshot.data!.isEmpty) {
                                                return Container();
                                              }
                                              final containerChallengeChallengesRecord =
                                                  containerChallengeChallengesRecordList
                                                          .isNotEmpty
                                                      ? containerChallengeChallengesRecordList
                                                          .first
                                                      : null;

                                              return Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 3.0,
                                                      color: Color(0x33000000),
                                                      offset: Offset(
                                                        0.0,
                                                        1.0,
                                                      ),
                                                    )
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                    width: 1.0,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(16.0, 16.0,
                                                          16.0, 16.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Stack(
                                                        children: [
                                                          if (containerChallengeChallengesRecord
                                                                  ?.focusArea ==
                                                              'Nutrition')
                                                            Container(
                                                              width: 48.0,
                                                              height: 48.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .accent2,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            24.0),
                                                              ),
                                                              child: Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: FaIcon(
                                                                  FontAwesomeIcons
                                                                      .appleAlt,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary,
                                                                  size: 24.0,
                                                                ),
                                                              ),
                                                            ),
                                                          if (containerChallengeChallengesRecord
                                                                  ?.focusArea ==
                                                              'Breathing')
                                                            Container(
                                                              width: 48.0,
                                                              height: 48.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color(
                                                                    0x4CEE8B60),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            24.0),
                                                              ),
                                                              child: Icon(
                                                                Icons
                                                                    .favorite_rounded,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .tertiary,
                                                                size: 24.0,
                                                              ),
                                                            ),
                                                          if (containerChallengeChallengesRecord
                                                                  ?.focusArea ==
                                                              'Hydration')
                                                            Container(
                                                              width: 48.0,
                                                              height: 48.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color(
                                                                    0x4D44EF39),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            24.0),
                                                              ),
                                                              child: Icon(
                                                                Icons
                                                                    .water_drop,
                                                                color: Color(
                                                                    0xFF32CC28),
                                                                size: 24.0,
                                                              ),
                                                            ),
                                                          if (containerChallengeChallengesRecord
                                                                  ?.focusArea ==
                                                              'Movement')
                                                            Container(
                                                              width: 48.0,
                                                              height: 48.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color(
                                                                    0x4DF9CF58),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            24.0),
                                                              ),
                                                              child: Icon(
                                                                Icons
                                                                    .directions_run,
                                                                color: Color(
                                                                    0xFFF0BE29),
                                                                size: 24.0,
                                                              ),
                                                            ),
                                                        ],
                                                      ),
                                                      Expanded(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                containerChallengeChallengesRecord
                                                                    ?.title,
                                                                'no challage today',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .interTight(
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleMedium
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                            Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                containerChallengeChallengesRecord
                                                                    ?.description,
                                                                'no ',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .inter(
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                          ].divide(SizedBox(
                                                              height: 4.0)),
                                                        ),
                                                      ),
                                                      if ((FFAppState()
                                                                  .currentHour >=
                                                              16) &&
                                                          true)
                                                        Container(
                                                          width: 45.9,
                                                          height: 42.1,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Builder(
                                                            builder: (context) =>
                                                                FlutterFlowIconButton(
                                                              borderRadius: 8.0,
                                                              buttonSize: 17.9,
                                                              fillColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .success,
                                                              disabledColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                              icon: Icon(
                                                                Icons
                                                                    .check_circle,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                              ),
                                                              onPressed: ((FFAppState()
                                                                              .iscompleted3 ==
                                                                          true) ||
                                                                      (DateTime.now()
                                                                              .hour >=
                                                                          20))
                                                                  ? null
                                                                  : () async {
                                                                      if (dateTimeFormat(
                                                                              "y/M/d",
                                                                              currentUserDocument
                                                                                  ?.lastCompletionDate) !=
                                                                          dateTimeFormat(
                                                                              "y/M/d",
                                                                              getCurrentTimestamp)) {
                                                                        await currentUserReference!
                                                                            .update({
                                                                          ...createUsersRecordData(
                                                                            lastCompletionDate:
                                                                                getCurrentTimestamp,
                                                                          ),
                                                                          ...mapToFirestore(
                                                                            {
                                                                              'daily_streak': FieldValue.increment(1),
                                                                            },
                                                                          ),
                                                                        });
                                                                        await Future
                                                                            .delayed(
                                                                          Duration(
                                                                            milliseconds:
                                                                                200,
                                                                          ),
                                                                        );
                                                                      } else {
                                                                        await Future
                                                                            .delayed(
                                                                          Duration(
                                                                            milliseconds:
                                                                                10,
                                                                          ),
                                                                        );
                                                                      }

                                                                      await containerChallengeChallengesRecord!
                                                                          .reference
                                                                          .update(
                                                                              createChallengesRecordData(
                                                                        status:
                                                                            '\"Completed\"',
                                                                      ));
                                                                      FFAppState()
                                                                              .iscompleted3 =
                                                                          true;
                                                                      safeSetState(
                                                                          () {});
                                                                      await showDialog(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (dialogContext) {
                                                                          return Dialog(
                                                                            elevation:
                                                                                0,
                                                                            insetPadding:
                                                                                EdgeInsets.zero,
                                                                            backgroundColor:
                                                                                Colors.transparent,
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                            child:
                                                                                GestureDetector(
                                                                              onTap: () {
                                                                                FocusScope.of(dialogContext).unfocus();
                                                                                FocusManager.instance.primaryFocus?.unfocus();
                                                                              },
                                                                              child: StreakWidget(),
                                                                            ),
                                                                          );
                                                                        },
                                                                      );
                                                                    },
                                                            ),
                                                          ),
                                                        ),
                                                    ].divide(
                                                        SizedBox(width: 16.0)),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    if (FFAppState().currentHour >= 12)
                                      Opacity(
                                        opacity: FFAppState().currentHour >= 16
                                            ? 0.5
                                            : 1.0,
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          child: StreamBuilder<
                                              List<ChallengesRecord>>(
                                            stream: queryChallengesRecord(
                                              parent: currentUserReference,
                                              queryBuilder:
                                                  (challengesRecord) =>
                                                      challengesRecord.where(
                                                'time_slot_num',
                                                isEqualTo: 12,
                                              ),
                                              singleRecord: true,
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 50,
                                                    height: 50,
                                                    child:
                                                        CircularProgressIndicator(
                                                      valueColor:
                                                          AlwaysStoppedAnimation<
                                                              Color>(
                                                        Color(0x00FFFFFF),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<ChallengesRecord>
                                                  containerChallengeChallengesRecordList =
                                                  snapshot.data!;
                                              // Return an empty Container when the item does not exist.
                                              if (snapshot.data!.isEmpty) {
                                                return Container();
                                              }
                                              final containerChallengeChallengesRecord =
                                                  containerChallengeChallengesRecordList
                                                          .isNotEmpty
                                                      ? containerChallengeChallengesRecordList
                                                          .first
                                                      : null;

                                              return Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 3.0,
                                                      color: Color(0x33000000),
                                                      offset: Offset(
                                                        0.0,
                                                        1.0,
                                                      ),
                                                    )
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                    width: 1.0,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(16.0, 16.0,
                                                          16.0, 16.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Stack(
                                                        children: [
                                                          if (containerChallengeChallengesRecord
                                                                  ?.focusArea ==
                                                              'Nutrition')
                                                            Container(
                                                              width: 48.0,
                                                              height: 48.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .accent2,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            24.0),
                                                              ),
                                                              child: Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: FaIcon(
                                                                  FontAwesomeIcons
                                                                      .appleAlt,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary,
                                                                  size: 24.0,
                                                                ),
                                                              ),
                                                            ),
                                                          if (containerChallengeChallengesRecord
                                                                  ?.focusArea ==
                                                              'Breathing')
                                                            Container(
                                                              width: 48.0,
                                                              height: 48.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color(
                                                                    0x4CEE8B60),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            24.0),
                                                              ),
                                                              child: Icon(
                                                                Icons
                                                                    .favorite_rounded,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .tertiary,
                                                                size: 24.0,
                                                              ),
                                                            ),
                                                          if (containerChallengeChallengesRecord
                                                                  ?.focusArea ==
                                                              'Hydration')
                                                            Container(
                                                              width: 48.0,
                                                              height: 48.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color(
                                                                    0x4D44EF39),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            24.0),
                                                              ),
                                                              child: Icon(
                                                                Icons
                                                                    .water_drop,
                                                                color: Color(
                                                                    0xFF32CC28),
                                                                size: 24.0,
                                                              ),
                                                            ),
                                                          if (containerChallengeChallengesRecord
                                                                  ?.focusArea ==
                                                              'Movement')
                                                            Container(
                                                              width: 48.0,
                                                              height: 48.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color(
                                                                    0x4DF9CF58),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            24.0),
                                                              ),
                                                              child: Icon(
                                                                Icons
                                                                    .directions_run,
                                                                color: Color(
                                                                    0xFFF0BE29),
                                                                size: 24.0,
                                                              ),
                                                            ),
                                                        ],
                                                      ),
                                                      Expanded(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                containerChallengeChallengesRecord
                                                                    ?.title,
                                                                'no challage today',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .interTight(
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleMedium
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                            Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                containerChallengeChallengesRecord
                                                                    ?.description,
                                                                'no ',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .inter(
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                          ].divide(SizedBox(
                                                              height: 4.0)),
                                                        ),
                                                      ),
                                                      if ((FFAppState()
                                                                  .currentHour >=
                                                              12) &&
                                                          true)
                                                        Container(
                                                          width: 45.9,
                                                          height: 42.1,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Builder(
                                                            builder: (context) =>
                                                                FlutterFlowIconButton(
                                                              borderRadius: 8.0,
                                                              buttonSize: 17.9,
                                                              fillColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .success,
                                                              disabledColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                              icon: Icon(
                                                                Icons
                                                                    .check_circle,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                              ),
                                                              onPressed: ((FFAppState()
                                                                              .iscompleted2 ==
                                                                          true) ||
                                                                      (DateTime.now()
                                                                              .hour >=
                                                                          16))
                                                                  ? null
                                                                  : () async {
                                                                      if (dateTimeFormat(
                                                                              "y/M/d",
                                                                              currentUserDocument
                                                                                  ?.lastCompletionDate) !=
                                                                          dateTimeFormat(
                                                                              "y/M/d",
                                                                              getCurrentTimestamp)) {
                                                                        await currentUserReference!
                                                                            .update({
                                                                          ...createUsersRecordData(
                                                                            lastCompletionDate:
                                                                                getCurrentTimestamp,
                                                                          ),
                                                                          ...mapToFirestore(
                                                                            {
                                                                              'daily_streak': FieldValue.increment(1),
                                                                            },
                                                                          ),
                                                                        });
                                                                        await Future
                                                                            .delayed(
                                                                          Duration(
                                                                            milliseconds:
                                                                                200,
                                                                          ),
                                                                        );
                                                                      } else {
                                                                        await Future
                                                                            .delayed(
                                                                          Duration(
                                                                            milliseconds:
                                                                                10,
                                                                          ),
                                                                        );
                                                                      }

                                                                      await containerChallengeChallengesRecord!
                                                                          .reference
                                                                          .update(
                                                                              createChallengesRecordData(
                                                                        status:
                                                                            '\"Completed\"',
                                                                      ));
                                                                      FFAppState()
                                                                              .iscompleted2 =
                                                                          true;
                                                                      safeSetState(
                                                                          () {});
                                                                      await showDialog(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (dialogContext) {
                                                                          return Dialog(
                                                                            elevation:
                                                                                0,
                                                                            insetPadding:
                                                                                EdgeInsets.zero,
                                                                            backgroundColor:
                                                                                Colors.transparent,
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                            child:
                                                                                GestureDetector(
                                                                              onTap: () {
                                                                                FocusScope.of(dialogContext).unfocus();
                                                                                FocusManager.instance.primaryFocus?.unfocus();
                                                                              },
                                                                              child: StreakWidget(),
                                                                            ),
                                                                          );
                                                                        },
                                                                      );
                                                                    },
                                                            ),
                                                          ),
                                                        ),
                                                    ].divide(
                                                        SizedBox(width: 16.0)),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    if (FFAppState().currentHour >= 8)
                                      Opacity(
                                        opacity: FFAppState().currentHour >= 12
                                            ? 0.5
                                            : 1.0,
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          child: StreamBuilder<
                                              List<ChallengesRecord>>(
                                            stream: queryChallengesRecord(
                                              parent: currentUserReference,
                                              queryBuilder:
                                                  (challengesRecord) =>
                                                      challengesRecord.where(
                                                'time_slot_num',
                                                isEqualTo: 8,
                                              ),
                                              singleRecord: true,
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 50,
                                                    height: 50,
                                                    child:
                                                        CircularProgressIndicator(
                                                      valueColor:
                                                          AlwaysStoppedAnimation<
                                                              Color>(
                                                        Color(0x00FFFFFF),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<ChallengesRecord>
                                                  containerChallengeChallengesRecordList =
                                                  snapshot.data!;
                                              // Return an empty Container when the item does not exist.
                                              if (snapshot.data!.isEmpty) {
                                                return Container();
                                              }
                                              final containerChallengeChallengesRecord =
                                                  containerChallengeChallengesRecordList
                                                          .isNotEmpty
                                                      ? containerChallengeChallengesRecordList
                                                          .first
                                                      : null;

                                              return Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 3.0,
                                                      color: Color(0x33000000),
                                                      offset: Offset(
                                                        0.0,
                                                        1.0,
                                                      ),
                                                    )
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                    width: 1.0,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(16.0, 16.0,
                                                          16.0, 16.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Stack(
                                                        children: [
                                                          if (containerChallengeChallengesRecord
                                                                  ?.focusArea ==
                                                              'Nutrition')
                                                            Container(
                                                              width: 48.0,
                                                              height: 48.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .accent2,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            24.0),
                                                              ),
                                                              child: Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: FaIcon(
                                                                  FontAwesomeIcons
                                                                      .appleAlt,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary,
                                                                  size: 24.0,
                                                                ),
                                                              ),
                                                            ),
                                                          if (containerChallengeChallengesRecord
                                                                  ?.focusArea ==
                                                              'Breathing')
                                                            Container(
                                                              width: 48.0,
                                                              height: 48.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color(
                                                                    0x4CEE8B60),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            24.0),
                                                              ),
                                                              child: Icon(
                                                                Icons
                                                                    .favorite_rounded,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .tertiary,
                                                                size: 24.0,
                                                              ),
                                                            ),
                                                          if (containerChallengeChallengesRecord
                                                                  ?.focusArea ==
                                                              'Hydration')
                                                            Container(
                                                              width: 48.0,
                                                              height: 48.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color(
                                                                    0x4D44EF39),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            24.0),
                                                              ),
                                                              child: Icon(
                                                                Icons
                                                                    .water_drop,
                                                                color: Color(
                                                                    0xFF32CC28),
                                                                size: 24.0,
                                                              ),
                                                            ),
                                                          if (containerChallengeChallengesRecord
                                                                  ?.focusArea ==
                                                              'Movement')
                                                            Container(
                                                              width: 48.0,
                                                              height: 48.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color(
                                                                    0x4DF9CF58),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            24.0),
                                                              ),
                                                              child: Icon(
                                                                Icons
                                                                    .directions_run,
                                                                color: Color(
                                                                    0xFFF0BE29),
                                                                size: 24.0,
                                                              ),
                                                            ),
                                                        ],
                                                      ),
                                                      Expanded(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                containerChallengeChallengesRecord
                                                                    ?.title,
                                                                'no challage today',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .interTight(
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleMedium
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                            Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                containerChallengeChallengesRecord
                                                                    ?.description,
                                                                'no ',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .inter(
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                          ].divide(SizedBox(
                                                              height: 4.0)),
                                                        ),
                                                      ),
                                                      if ((FFAppState()
                                                                  .currentHour >=
                                                              8) &&
                                                          true)
                                                        Container(
                                                          width: 45.9,
                                                          height: 42.1,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Builder(
                                                            builder: (context) =>
                                                                FlutterFlowIconButton(
                                                              borderRadius: 8.0,
                                                              buttonSize: 17.9,
                                                              fillColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .success,
                                                              disabledColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                              icon: Icon(
                                                                Icons
                                                                    .check_circle,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                              ),
                                                              onPressed: ((FFAppState()
                                                                              .iscompleted1 ==
                                                                          true) ||
                                                                      (DateTime.now()
                                                                              .hour >=
                                                                          12))
                                                                  ? null
                                                                  : () async {
                                                                      if (dateTimeFormat(
                                                                              "y/M/d",
                                                                              currentUserDocument
                                                                                  ?.lastCompletionDate) !=
                                                                          dateTimeFormat(
                                                                              "y/M/d",
                                                                              getCurrentTimestamp)) {
                                                                        await currentUserReference!
                                                                            .update({
                                                                          ...createUsersRecordData(
                                                                            lastCompletionDate:
                                                                                getCurrentTimestamp,
                                                                          ),
                                                                          ...mapToFirestore(
                                                                            {
                                                                              'daily_streak': FieldValue.increment(1),
                                                                            },
                                                                          ),
                                                                        });
                                                                        await Future
                                                                            .delayed(
                                                                          Duration(
                                                                            milliseconds:
                                                                                200,
                                                                          ),
                                                                        );
                                                                      } else {
                                                                        await Future
                                                                            .delayed(
                                                                          Duration(
                                                                            milliseconds:
                                                                                10,
                                                                          ),
                                                                        );
                                                                      }

                                                                      await containerChallengeChallengesRecord!
                                                                          .reference
                                                                          .update(
                                                                              createChallengesRecordData(
                                                                        status:
                                                                            '\"Completed\"',
                                                                      ));
                                                                      FFAppState()
                                                                              .iscompleted1 =
                                                                          true;
                                                                      safeSetState(
                                                                          () {});
                                                                      await showDialog(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (dialogContext) {
                                                                          return Dialog(
                                                                            elevation:
                                                                                0,
                                                                            insetPadding:
                                                                                EdgeInsets.zero,
                                                                            backgroundColor:
                                                                                Colors.transparent,
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                            child:
                                                                                GestureDetector(
                                                                              onTap: () {
                                                                                FocusScope.of(dialogContext).unfocus();
                                                                                FocusManager.instance.primaryFocus?.unfocus();
                                                                              },
                                                                              child: StreakWidget(),
                                                                            ),
                                                                          );
                                                                        },
                                                                      );
                                                                    },
                                                            ),
                                                          ),
                                                        ),
                                                    ].divide(
                                                        SizedBox(width: 16.0)),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                  ].divide(SizedBox(height: 10.0)),
                                ),
                              if (functions.isBeforeRegistration(
                                      FFAppState().selectedDate,
                                      currentUserDocument?.createdTime) ??
                                  true)
                                Align(
                                  alignment: AlignmentDirectional(0.0, -1.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 24.0, 20.0, 24.0),
                                    child: AuthUserStreamWidget(
                                      builder: (context) => Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 16.0, 16.0, 16.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: 80.0,
                                                height: 80.0,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          40.0),
                                                ),
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Icon(
                                                    Icons
                                                        .calendar_today_rounded,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    size: 40.0,
                                                  ),
                                                ),
                                              ),
                                              Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Text(
                                                      'No challenge for today ',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .interTight(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium
                                                                    .fontStyle,
                                                              ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Text(
                                                      'you joined the app after this date',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                    ),
                                                  ),
                                                ].divide(SizedBox(height: 8.0)),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              if (dateTimeFormat(
                                      "d/M", FFAppState().selectedDate) !=
                                  dateTimeFormat("d/M", getCurrentTimestamp))
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Opacity(
                                      opacity: 0.5,
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        child: StreamBuilder<
                                            List<ChallengeHistoryRecord>>(
                                          stream: queryChallengeHistoryRecord(
                                            parent: currentUserReference,
                                            queryBuilder:
                                                (challengeHistoryRecord) =>
                                                    challengeHistoryRecord
                                                        .where(
                                                          'for_date',
                                                          isEqualTo: dateTimeFormat(
                                                              "yyyy-MM-dd",
                                                              FFAppState()
                                                                  .selectedDate),
                                                        )
                                                        .where(
                                                          'time_slot_num',
                                                          isEqualTo: 20,
                                                        ),
                                            singleRecord: true,
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 50,
                                                  height: 50,
                                                  child:
                                                      CircularProgressIndicator(
                                                    valueColor:
                                                        AlwaysStoppedAnimation<
                                                            Color>(
                                                      Color(0x00FFFFFF),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }
                                            List<ChallengeHistoryRecord>
                                                containerChallengeChallengeHistoryRecordList =
                                                snapshot.data!;
                                            // Return an empty Container when the item does not exist.
                                            if (snapshot.data!.isEmpty) {
                                              return Container();
                                            }
                                            final containerChallengeChallengeHistoryRecord =
                                                containerChallengeChallengeHistoryRecordList
                                                        .isNotEmpty
                                                    ? containerChallengeChallengeHistoryRecordList
                                                        .first
                                                    : null;

                                            return Container(
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  width: 1.0,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 16.0, 16.0, 16.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Stack(
                                                      children: [
                                                        if (containerChallengeChallengeHistoryRecord
                                                                ?.focusArea ==
                                                            'Nutrition')
                                                          Container(
                                                            width: 48.0,
                                                            height: 48.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .accent2,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          24.0),
                                                            ),
                                                            child: Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: FaIcon(
                                                                FontAwesomeIcons
                                                                    .appleAlt,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                                size: 24.0,
                                                              ),
                                                            ),
                                                          ),
                                                        if (containerChallengeChallengeHistoryRecord
                                                                ?.focusArea ==
                                                            'Breathing')
                                                          Container(
                                                            width: 48.0,
                                                            height: 48.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0x4CEE8B60),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          24.0),
                                                            ),
                                                            child: Icon(
                                                              Icons
                                                                  .favorite_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .tertiary,
                                                              size: 24.0,
                                                            ),
                                                          ),
                                                        if (containerChallengeChallengeHistoryRecord
                                                                ?.focusArea ==
                                                            'Hydration')
                                                          Container(
                                                            width: 48.0,
                                                            height: 48.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0x4D44EF39),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          24.0),
                                                            ),
                                                            child: Icon(
                                                              Icons.water_drop,
                                                              color: Color(
                                                                  0xFF32CC28),
                                                              size: 24.0,
                                                            ),
                                                          ),
                                                        if (containerChallengeChallengeHistoryRecord
                                                                ?.focusArea ==
                                                            'Movement')
                                                          Container(
                                                            width: 48.0,
                                                            height: 48.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0x4DF9CF58),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          24.0),
                                                            ),
                                                            child: Icon(
                                                              Icons
                                                                  .directions_run,
                                                              color: Color(
                                                                  0xFFF0BE29),
                                                              size: 24.0,
                                                            ),
                                                          ),
                                                      ],
                                                    ),
                                                    Expanded(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            valueOrDefault<
                                                                String>(
                                                              containerChallengeChallengeHistoryRecord
                                                                  ?.title,
                                                              'no challage today',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .interTight(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                          Text(
                                                            valueOrDefault<
                                                                String>(
                                                              containerChallengeChallengeHistoryRecord
                                                                  ?.description,
                                                              'no ',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            height: 4.0)),
                                                      ),
                                                    ),
                                                    Stack(
                                                      children: [
                                                        if (containerChallengeChallengeHistoryRecord
                                                                ?.status ==
                                                            '\"Completed\"')
                                                          Container(
                                                            width: 45.9,
                                                            height: 42.1,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                            child:
                                                                FlutterFlowIconButton(
                                                              borderRadius: 8.0,
                                                              buttonSize: 17.9,
                                                              fillColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .success,
                                                              disabledColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .success,
                                                              icon: Icon(
                                                                Icons
                                                                    .check_circle,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                              ),
                                                              onPressed: (containerChallengeChallengeHistoryRecord
                                                                          ?.status ==
                                                                      '\"Completed\"')
                                                                  ? null
                                                                  : () {
                                                                      print(
                                                                          'IconButton pressed ...');
                                                                    },
                                                            ),
                                                          ),
                                                        if (containerChallengeChallengeHistoryRecord
                                                                ?.status ==
                                                            'active')
                                                          Container(
                                                            width: 45.9,
                                                            height: 42.1,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                            child:
                                                                FlutterFlowIconButton(
                                                              borderRadius: 8.0,
                                                              buttonSize: 17.9,
                                                              fillColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                              disabledColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                              icon: Icon(
                                                                Icons.cancel,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                              ),
                                                              onPressed: (containerChallengeChallengeHistoryRecord
                                                                          ?.status ==
                                                                      'active')
                                                                  ? null
                                                                  : () {
                                                                      print(
                                                                          'IconButton pressed ...');
                                                                    },
                                                            ),
                                                          ),
                                                      ],
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 16.0)),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                    Opacity(
                                      opacity: 0.5,
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        child: StreamBuilder<
                                            List<ChallengeHistoryRecord>>(
                                          stream: queryChallengeHistoryRecord(
                                            parent: currentUserReference,
                                            queryBuilder:
                                                (challengeHistoryRecord) =>
                                                    challengeHistoryRecord
                                                        .where(
                                                          'for_date',
                                                          isEqualTo: dateTimeFormat(
                                                              "yyyy-MM-dd",
                                                              FFAppState()
                                                                  .selectedDate),
                                                        )
                                                        .where(
                                                          'time_slot_num',
                                                          isEqualTo: 16,
                                                        ),
                                            singleRecord: true,
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 50,
                                                  height: 50,
                                                  child:
                                                      CircularProgressIndicator(
                                                    valueColor:
                                                        AlwaysStoppedAnimation<
                                                            Color>(
                                                      Color(0x00FFFFFF),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }
                                            List<ChallengeHistoryRecord>
                                                containerChallengeChallengeHistoryRecordList =
                                                snapshot.data!;
                                            // Return an empty Container when the item does not exist.
                                            if (snapshot.data!.isEmpty) {
                                              return Container();
                                            }
                                            final containerChallengeChallengeHistoryRecord =
                                                containerChallengeChallengeHistoryRecordList
                                                        .isNotEmpty
                                                    ? containerChallengeChallengeHistoryRecordList
                                                        .first
                                                    : null;

                                            return Container(
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  width: 1.0,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 15.0, 16.0, 16.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Stack(
                                                      children: [
                                                        if (containerChallengeChallengeHistoryRecord
                                                                ?.focusArea ==
                                                            'Nutrition')
                                                          Container(
                                                            width: 48.0,
                                                            height: 48.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .accent2,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          24.0),
                                                            ),
                                                            child: Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: FaIcon(
                                                                FontAwesomeIcons
                                                                    .appleAlt,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                                size: 24.0,
                                                              ),
                                                            ),
                                                          ),
                                                        if (containerChallengeChallengeHistoryRecord
                                                                ?.focusArea ==
                                                            'Breathing')
                                                          Container(
                                                            width: 48.0,
                                                            height: 48.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0x4CEE8B60),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          24.0),
                                                            ),
                                                            child: Icon(
                                                              Icons
                                                                  .favorite_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .tertiary,
                                                              size: 24.0,
                                                            ),
                                                          ),
                                                        if (containerChallengeChallengeHistoryRecord
                                                                ?.focusArea ==
                                                            'Hydration')
                                                          Container(
                                                            width: 48.0,
                                                            height: 48.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0x4D44EF39),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          24.0),
                                                            ),
                                                            child: Icon(
                                                              Icons.water_drop,
                                                              color: Color(
                                                                  0xFF32CC28),
                                                              size: 24.0,
                                                            ),
                                                          ),
                                                        if (containerChallengeChallengeHistoryRecord
                                                                ?.focusArea ==
                                                            'Movement')
                                                          Container(
                                                            width: 48.0,
                                                            height: 48.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0x4DF9CF58),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          24.0),
                                                            ),
                                                            child: Icon(
                                                              Icons
                                                                  .directions_run,
                                                              color: Color(
                                                                  0xFFF0BE29),
                                                              size: 24.0,
                                                            ),
                                                          ),
                                                      ],
                                                    ),
                                                    Expanded(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            valueOrDefault<
                                                                String>(
                                                              containerChallengeChallengeHistoryRecord
                                                                  ?.title,
                                                              'no challage',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .interTight(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                          Text(
                                                            valueOrDefault<
                                                                String>(
                                                              containerChallengeChallengeHistoryRecord
                                                                  ?.description,
                                                              'no',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            height: 4.0)),
                                                      ),
                                                    ),
                                                    Stack(
                                                      children: [
                                                        if (containerChallengeChallengeHistoryRecord
                                                                ?.status ==
                                                            '\"Completed\"')
                                                          Container(
                                                            width: 45.9,
                                                            height: 42.1,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                            child:
                                                                FlutterFlowIconButton(
                                                              borderRadius: 8.0,
                                                              buttonSize: 17.9,
                                                              fillColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .success,
                                                              disabledColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .success,
                                                              icon: Icon(
                                                                Icons
                                                                    .check_circle,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                              ),
                                                              onPressed: (containerChallengeChallengeHistoryRecord
                                                                          ?.status ==
                                                                      '\"Completed\"')
                                                                  ? null
                                                                  : () {
                                                                      print(
                                                                          'IconButton pressed ...');
                                                                    },
                                                            ),
                                                          ),
                                                        if (containerChallengeChallengeHistoryRecord
                                                                ?.status ==
                                                            'active')
                                                          Container(
                                                            width: 45.9,
                                                            height: 42.1,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                            child:
                                                                FlutterFlowIconButton(
                                                              borderRadius: 8.0,
                                                              buttonSize: 17.9,
                                                              fillColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                              disabledColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                              icon: Icon(
                                                                Icons.cancel,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                              ),
                                                              onPressed: (containerChallengeChallengeHistoryRecord
                                                                          ?.status ==
                                                                      'active')
                                                                  ? null
                                                                  : () {
                                                                      print(
                                                                          'IconButton pressed ...');
                                                                    },
                                                            ),
                                                          ),
                                                      ],
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 16.0)),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                    Opacity(
                                      opacity: 0.5,
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        child: StreamBuilder<
                                            List<ChallengeHistoryRecord>>(
                                          stream: queryChallengeHistoryRecord(
                                            parent: currentUserReference,
                                            queryBuilder:
                                                (challengeHistoryRecord) =>
                                                    challengeHistoryRecord
                                                        .where(
                                                          'for_date',
                                                          isEqualTo: dateTimeFormat(
                                                              "yyyy-MM-dd",
                                                              FFAppState()
                                                                  .selectedDate),
                                                        )
                                                        .where(
                                                          'time_slot_num',
                                                          isEqualTo: 12,
                                                        ),
                                            singleRecord: true,
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 50,
                                                  height: 50,
                                                  child:
                                                      CircularProgressIndicator(
                                                    valueColor:
                                                        AlwaysStoppedAnimation<
                                                            Color>(
                                                      Color(0x00FFFFFF),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }
                                            List<ChallengeHistoryRecord>
                                                containerChallengeChallengeHistoryRecordList =
                                                snapshot.data!;
                                            // Return an empty Container when the item does not exist.
                                            if (snapshot.data!.isEmpty) {
                                              return Container();
                                            }
                                            final containerChallengeChallengeHistoryRecord =
                                                containerChallengeChallengeHistoryRecordList
                                                        .isNotEmpty
                                                    ? containerChallengeChallengeHistoryRecordList
                                                        .first
                                                    : null;

                                            return Container(
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  width: 1.0,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 16.0, 16.0, 16.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Stack(
                                                      children: [
                                                        if (containerChallengeChallengeHistoryRecord
                                                                ?.focusArea ==
                                                            'Nutrition')
                                                          Container(
                                                            width: 48.0,
                                                            height: 48.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .accent2,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          24.0),
                                                            ),
                                                            child: Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: FaIcon(
                                                                FontAwesomeIcons
                                                                    .appleAlt,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                                size: 24.0,
                                                              ),
                                                            ),
                                                          ),
                                                        if (containerChallengeChallengeHistoryRecord
                                                                ?.focusArea ==
                                                            'Breathing')
                                                          Container(
                                                            width: 48.0,
                                                            height: 48.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0x4CEE8B60),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          24.0),
                                                            ),
                                                            child: Icon(
                                                              Icons
                                                                  .favorite_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .tertiary,
                                                              size: 24.0,
                                                            ),
                                                          ),
                                                        if (containerChallengeChallengeHistoryRecord
                                                                ?.focusArea ==
                                                            'Hydration')
                                                          Container(
                                                            width: 48.0,
                                                            height: 48.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0x4D44EF39),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          24.0),
                                                            ),
                                                            child: Icon(
                                                              Icons.water_drop,
                                                              color: Color(
                                                                  0xFF32CC28),
                                                              size: 24.0,
                                                            ),
                                                          ),
                                                        if (containerChallengeChallengeHistoryRecord
                                                                ?.focusArea ==
                                                            'Movement')
                                                          Container(
                                                            width: 48.0,
                                                            height: 48.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0x4DF9CF58),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          24.0),
                                                            ),
                                                            child: Icon(
                                                              Icons
                                                                  .directions_run,
                                                              color: Color(
                                                                  0xFFF0BE29),
                                                              size: 24.0,
                                                            ),
                                                          ),
                                                      ],
                                                    ),
                                                    Expanded(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            valueOrDefault<
                                                                String>(
                                                              containerChallengeChallengeHistoryRecord
                                                                  ?.title,
                                                              'no challage',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .interTight(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                          Text(
                                                            valueOrDefault<
                                                                String>(
                                                              containerChallengeChallengeHistoryRecord
                                                                  ?.description,
                                                              'no',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            height: 4.0)),
                                                      ),
                                                    ),
                                                    Stack(
                                                      children: [
                                                        if (containerChallengeChallengeHistoryRecord
                                                                ?.status ==
                                                            '\"Completed\"')
                                                          Container(
                                                            width: 45.9,
                                                            height: 42.1,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                            child:
                                                                FlutterFlowIconButton(
                                                              borderRadius: 8.0,
                                                              buttonSize: 17.9,
                                                              fillColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .success,
                                                              disabledColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .success,
                                                              icon: Icon(
                                                                Icons
                                                                    .check_circle,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                              ),
                                                              onPressed: (containerChallengeChallengeHistoryRecord
                                                                          ?.status ==
                                                                      '\'Completed\"')
                                                                  ? null
                                                                  : () {
                                                                      print(
                                                                          'IconButton pressed ...');
                                                                    },
                                                            ),
                                                          ),
                                                        if (containerChallengeChallengeHistoryRecord
                                                                ?.status ==
                                                            'active')
                                                          Container(
                                                            width: 45.9,
                                                            height: 42.1,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                            child:
                                                                FlutterFlowIconButton(
                                                              borderRadius: 8.0,
                                                              buttonSize: 17.9,
                                                              fillColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                              disabledColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                              icon: Icon(
                                                                Icons.cancel,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                              ),
                                                              onPressed: (containerChallengeChallengeHistoryRecord
                                                                          ?.status ==
                                                                      'active')
                                                                  ? null
                                                                  : () {
                                                                      print(
                                                                          'IconButton pressed ...');
                                                                    },
                                                            ),
                                                          ),
                                                      ],
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 16.0)),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                    Opacity(
                                      opacity: 0.5,
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        child: StreamBuilder<
                                            List<ChallengeHistoryRecord>>(
                                          stream: queryChallengeHistoryRecord(
                                            parent: currentUserReference,
                                            queryBuilder:
                                                (challengeHistoryRecord) =>
                                                    challengeHistoryRecord
                                                        .where(
                                                          'for_date',
                                                          isEqualTo: dateTimeFormat(
                                                              "yyyy-MM-dd",
                                                              FFAppState()
                                                                  .selectedDate),
                                                        )
                                                        .where(
                                                          'time_slot_num',
                                                          isEqualTo: 8,
                                                        ),
                                            singleRecord: true,
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 50,
                                                  height: 50,
                                                  child:
                                                      CircularProgressIndicator(
                                                    valueColor:
                                                        AlwaysStoppedAnimation<
                                                            Color>(
                                                      Color(0x00FFFFFF),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }
                                            List<ChallengeHistoryRecord>
                                                containerChallengeChallengeHistoryRecordList =
                                                snapshot.data!;
                                            // Return an empty Container when the item does not exist.
                                            if (snapshot.data!.isEmpty) {
                                              return Container();
                                            }
                                            final containerChallengeChallengeHistoryRecord =
                                                containerChallengeChallengeHistoryRecordList
                                                        .isNotEmpty
                                                    ? containerChallengeChallengeHistoryRecordList
                                                        .first
                                                    : null;

                                            return Container(
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  width: 1.0,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 16.0, 16.0, 16.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Stack(
                                                      children: [
                                                        if (containerChallengeChallengeHistoryRecord
                                                                ?.focusArea ==
                                                            'Nutrition')
                                                          Container(
                                                            width: 48.0,
                                                            height: 48.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .accent2,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          24.0),
                                                            ),
                                                            child: Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: FaIcon(
                                                                FontAwesomeIcons
                                                                    .appleAlt,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                                size: 24.0,
                                                              ),
                                                            ),
                                                          ),
                                                        if (containerChallengeChallengeHistoryRecord
                                                                ?.focusArea ==
                                                            'Breathing')
                                                          Container(
                                                            width: 48.0,
                                                            height: 48.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0x4CEE8B60),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          24.0),
                                                            ),
                                                            child: Icon(
                                                              Icons
                                                                  .favorite_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .tertiary,
                                                              size: 24.0,
                                                            ),
                                                          ),
                                                        if (containerChallengeChallengeHistoryRecord
                                                                ?.focusArea ==
                                                            'Hydration')
                                                          Container(
                                                            width: 48.0,
                                                            height: 48.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0x4D44EF39),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          24.0),
                                                            ),
                                                            child: Icon(
                                                              Icons.water_drop,
                                                              color: Color(
                                                                  0xFF32CC28),
                                                              size: 24.0,
                                                            ),
                                                          ),
                                                        if (containerChallengeChallengeHistoryRecord
                                                                ?.focusArea ==
                                                            'Movement')
                                                          Container(
                                                            width: 48.0,
                                                            height: 48.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0x4DF9CF58),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          24.0),
                                                            ),
                                                            child: Icon(
                                                              Icons
                                                                  .directions_run,
                                                              color: Color(
                                                                  0xFFF0BE29),
                                                              size: 24.0,
                                                            ),
                                                          ),
                                                      ],
                                                    ),
                                                    Expanded(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            valueOrDefault<
                                                                String>(
                                                              containerChallengeChallengeHistoryRecord
                                                                  ?.title,
                                                              'no challage',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .interTight(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                          Text(
                                                            valueOrDefault<
                                                                String>(
                                                              containerChallengeChallengeHistoryRecord
                                                                  ?.description,
                                                              'no',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            height: 4.0)),
                                                      ),
                                                    ),
                                                    Stack(
                                                      children: [
                                                        if (containerChallengeChallengeHistoryRecord
                                                                ?.status ==
                                                            '\"Completed\"')
                                                          Container(
                                                            width: 45.9,
                                                            height: 42.1,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                            child:
                                                                FlutterFlowIconButton(
                                                              borderRadius: 8.0,
                                                              buttonSize: 17.9,
                                                              fillColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .success,
                                                              disabledColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .success,
                                                              icon: Icon(
                                                                Icons
                                                                    .check_circle,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                              ),
                                                              onPressed: (containerChallengeChallengeHistoryRecord
                                                                          ?.status ==
                                                                      '\"Completed\"')
                                                                  ? null
                                                                  : () {
                                                                      print(
                                                                          'IconButton pressed ...');
                                                                    },
                                                            ),
                                                          ),
                                                        if (containerChallengeChallengeHistoryRecord
                                                                ?.status ==
                                                            'active')
                                                          Container(
                                                            width: 45.9,
                                                            height: 42.1,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                            child:
                                                                FlutterFlowIconButton(
                                                              borderRadius: 8.0,
                                                              buttonSize: 17.9,
                                                              fillColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                              disabledColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                              icon: Icon(
                                                                Icons.cancel,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                              ),
                                                              onPressed: (containerChallengeChallengeHistoryRecord
                                                                          ?.status ==
                                                                      'active')
                                                                  ? null
                                                                  : () {
                                                                      print(
                                                                          'IconButton pressed ...');
                                                                    },
                                                            ),
                                                          ),
                                                      ],
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 16.0)),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ].divide(SizedBox(height: 10.0)),
                                ),
                              Stack(
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(1.0, 1.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 50.0, 10.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                              ChatbotWidget.routeName);
                                        },
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.asset(
                                            'assets/images/chatbot.png',
                                            width: 80.0,
                                            height: 80.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ].divide(SizedBox(height: 10.0)),
                          ),
                        ),
                      ].addToStart(SizedBox(height: 20.0)),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: wrapWithModel(
                  model: _model.navBar1Model,
                  updateCallback: () => safeSetState(() {}),
                  child: NavBar1Widget(
                    page: 'HOME',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
