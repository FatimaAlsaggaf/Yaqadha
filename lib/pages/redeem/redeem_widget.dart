import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/code_widget.dart';
import '/components/nav_bar1_widget.dart';
import '/components/no_point_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'redeem_model.dart';
export 'redeem_model.dart';

/// Design a modern and clean “Reward Points” page for a wellness app.
///
/// Use a light blue color palette with soft gradients and smooth rounded
/// shapes. At the top, show the user’s points in a beautiful card with a
/// large number (e.g., “You have 1250 points”). Below the points, display a
/// section titled “Available Rewards”.
///
/// Each reward card should include:
/// – A reward image on the left or top
/// – The reward name
/// – A short description
/// – Expiry date (e.g., “Valid until Dec 31, 2025”)
/// – A rounded “Redeem” button
///
/// Use a minimal, elegant layout with spacing, soft shadows, and a fresh
/// light-blue wellness feeling. Make the design modern, friendly, and
/// visually appealing for a mobile screen.
class RedeemWidget extends StatefulWidget {
  const RedeemWidget({super.key});

  static String routeName = 'Redeem';
  static String routePath = '/redeem';

  @override
  State<RedeemWidget> createState() => _RedeemWidgetState();
}

class _RedeemWidgetState extends State<RedeemWidget> {
  late RedeemModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RedeemModel());
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
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(110.0),
          child: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            actions: [],
            flexibleSpace: FlexibleSpaceBar(
              title: Align(
                alignment: AlignmentDirectional(-1.0, 1.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(25.0, 0.0, 0.0, 0.0),
                  child: Text(
                    'Reward Points',
                    style: FlutterFlowTheme.of(context).headlineLarge.override(
                          font: GoogleFonts.interTight(
                            fontWeight: FontWeight.bold,
                            fontStyle: FlutterFlowTheme.of(context)
                                .headlineLarge
                                .fontStyle,
                          ),
                          fontSize: 35.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                          fontStyle: FlutterFlowTheme.of(context)
                              .headlineLarge
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
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        height: 180.0,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 20.0,
                              color: Color(0x1A87CEEB),
                              offset: Offset(
                                0.0,
                                8.0,
                              ),
                            )
                          ],
                          gradient: LinearGradient(
                            colors: [Color(0xFF87CEEB), Color(0xFFB0E0E6)],
                            stops: [0.0, 1.0],
                            begin: AlignmentDirectional(1.0, 1.0),
                            end: AlignmentDirectional(-1.0, -1.0),
                          ),
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                FlutterFlowTheme.of(context).success,
                                Color(0xFF95F6E9)
                              ],
                              stops: [0.0, 1.0],
                              begin: AlignmentDirectional(0.0, -1.0),
                              end: AlignmentDirectional(0, 1.0),
                            ),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Stack(
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Your Wellness Points',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight: FontWeight.bold,
                                                fontStyle: FontStyle.italic,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              fontSize: 18.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                              fontStyle: FontStyle.italic,
                                            ),
                                      ),
                                      AuthUserStreamWidget(
                                        builder: (context) => Text(
                                          valueOrDefault(
                                                  currentUserDocument?.points,
                                                  0)
                                              .toString(),
                                          style: FlutterFlowTheme.of(context)
                                              .displayMedium
                                              .override(
                                                font: GoogleFonts.readexPro(
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .displayMedium
                                                          .fontStyle,
                                                ),
                                                color: Colors.white,
                                                fontSize: 48.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .displayMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                      ),
                                      Text(
                                        'Keep up the great work!',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight: FontWeight.bold,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              fontSize: 18.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ].divide(SizedBox(height: 8.0)),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.83, 0.21),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 20.0),
                                  child: Container(
                                    width: 80.0,
                                    height: 80.0,
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 15.0,
                                          color: Color(0x33FFD700),
                                          offset: Offset(
                                            0.0,
                                            5.0,
                                          ),
                                        )
                                      ],
                                      gradient: LinearGradient(
                                        colors: [
                                          Color(0xFFFFD700),
                                          Color(0xFFFFB347)
                                        ],
                                        stops: [0.0, 1.0],
                                        begin: AlignmentDirectional(1.0, -1.0),
                                        end: AlignmentDirectional(-1.0, 1.0),
                                      ),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Icon(
                                        Icons.emoji_events,
                                        color: Colors.white,
                                        size: 40.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(-0.79, 0.73),
                                child: Icon(
                                  Icons.star,
                                  color: Color(0x66FFFFFF),
                                  size: 12.0,
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.49, 0.81),
                                child: Icon(
                                  Icons.star,
                                  color: Color(0x66FFFFFF),
                                  size: 12.0,
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(-0.74, -0.5),
                                child: Icon(
                                  Icons.star,
                                  color: Color(0x66FFFFFF),
                                  size: 12.0,
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.41, -0.63),
                                child: Icon(
                                  Icons.star,
                                  color: Color(0x66FFFFFF),
                                  size: 12.0,
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(-0.41, 0.0),
                                child: Icon(
                                  Icons.star,
                                  color: Color(0x66FFFFFF),
                                  size: 12.0,
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.86, -0.75),
                                child: Icon(
                                  Icons.star,
                                  color: Color(0x66FFFFFF),
                                  size: 12.0,
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.83, 0.21),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 20.0),
                                  child: Container(
                                    width: 80.0,
                                    height: 80.0,
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 15.0,
                                          color: Color(0x33FFD700),
                                          offset: Offset(
                                            0.0,
                                            5.0,
                                          ),
                                        )
                                      ],
                                      gradient: LinearGradient(
                                        colors: [
                                          Color(0xFFFFD700),
                                          Color(0xFFFFB347)
                                        ],
                                        stops: [0.0, 1.0],
                                        begin: AlignmentDirectional(1.0, -1.0),
                                        end: AlignmentDirectional(-1.0, 1.0),
                                      ),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Icon(
                                        Icons.emoji_events,
                                        color: Colors.white,
                                        size: 40.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(-0.74, -0.5),
                                child: Icon(
                                  Icons.star,
                                  color: Color(0x66FFFFFF),
                                  size: 12.0,
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.49, 0.81),
                                child: Icon(
                                  Icons.star,
                                  color: Color(0x66FFFFFF),
                                  size: 12.0,
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(-0.41, 0.0),
                                child: Icon(
                                  Icons.star,
                                  color: Color(0x66FFFFFF),
                                  size: 12.0,
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(-0.41, 0.0),
                                child: Icon(
                                  Icons.star,
                                  color: Color(0x66FFFFFF),
                                  size: 12.0,
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(-0.41, 0.0),
                                child: Icon(
                                  Icons.star,
                                  color: Color(0x66FFFFFF),
                                  size: 12.0,
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(-0.79, 0.73),
                                child: Icon(
                                  Icons.star,
                                  color: Color(0x66FFFFFF),
                                  size: 12.0,
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(-0.79, 0.73),
                                child: Icon(
                                  Icons.star,
                                  color: Color(0x66FFFFFF),
                                  size: 12.0,
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.41, -0.63),
                                child: Icon(
                                  Icons.star,
                                  color: Color(0x66FFFFFF),
                                  size: 12.0,
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(-0.87, 0.09),
                                child: Icon(
                                  Icons.star,
                                  color: Color(0x66FFFFFF),
                                  size: 12.0,
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.88, 0.5),
                                child: Icon(
                                  Icons.star,
                                  color: Color(0x66FFFFFF),
                                  size: 12.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'Available Rewards',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .override(
                                        font: GoogleFonts.readexPro(
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .headlineSmall
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontSize: 24.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .fontStyle,
                                      ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        280.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      '🌟🌟🌟',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            StreamBuilder<List<RewardsRecord>>(
                              stream: queryRewardsRecord(
                                queryBuilder: (rewardsRecord) =>
                                    rewardsRecord.where(
                                  'expiryDate',
                                  isGreaterThanOrEqualTo: getCurrentTimestamp,
                                ),
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<RewardsRecord> listViewRewardsRecordList =
                                    snapshot.data!;

                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: listViewRewardsRecordList.length,
                                  itemBuilder: (context, listViewIndex) {
                                    final listViewRewardsRecord =
                                        listViewRewardsRecordList[
                                            listViewIndex];
                                    return Padding(
                                      padding: EdgeInsets.all(20.0),
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 4.0,
                                              color: Color(0x33000000),
                                              offset: Offset(
                                                0.0,
                                                2.0,
                                              ),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(12.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: 122.7,
                                                height: 165.3,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFF0F8FF),
                                                  image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: Image.network(
                                                      'https://images.unsplash.com/photo-1574527772485-ea7017e54ef4?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHJhbmRvbXx8fHx8fHx8fDE3NjM2NDM1MDJ8&ixlib=rb-4.1.0&q=80&w=1080',
                                                    ).image,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                ),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.network(
                                                    listViewRewardsRecord.image,
                                                    width: 200.0,
                                                    height: 200.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      listViewRewardsRecord
                                                          .name,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .titleMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .inter(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .fontStyle,
                                                            ),
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            fontSize: 18.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium
                                                                    .fontStyle,
                                                          ),
                                                    ),
                                                    Text(
                                                      listViewRewardsRecord.des,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .inter(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            fontSize: 14.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                            lineHeight: 1.4,
                                                          ),
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Icon(
                                                          Icons.stars,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .warning,
                                                          size: 20.0,
                                                        ),
                                                        RichText(
                                                          textScaler:
                                                              MediaQuery.of(
                                                                      context)
                                                                  .textScaler,
                                                          text: TextSpan(
                                                            children: [
                                                              TextSpan(
                                                                text: listViewRewardsRecord
                                                                    .pointsCost
                                                                    .toString(),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .inter(
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .success,
                                                                      fontSize:
                                                                          14.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                              TextSpan(
                                                                text: ' Points',
                                                                style:
                                                                    TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontStyle:
                                                                      FontStyle
                                                                          .normal,
                                                                ),
                                                              )
                                                            ],
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      16.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                        ),
                                                      ].divide(
                                                          SizedBox(width: 4.0)),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    0.0,
                                                                    8.0,
                                                                    0.0),
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .accent2,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    8.0),
                                                            child: RichText(
                                                              textScaler:
                                                                  MediaQuery.of(
                                                                          context)
                                                                      .textScaler,
                                                              text: TextSpan(
                                                                children: [
                                                                  TextSpan(
                                                                    text:
                                                                        'Valid until ',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelSmall
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.inter(
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                          ),
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          fontSize:
                                                                              14.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .labelSmall
                                                                              .fontStyle,
                                                                        ),
                                                                  ),
                                                                  TextSpan(
                                                                    text: dateTimeFormat(
                                                                        "d/M/y",
                                                                        listViewRewardsRecord
                                                                            .expiryDate!),
                                                                    style:
                                                                        TextStyle(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .success,
                                                                    ),
                                                                  )
                                                                ],
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmall
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .inter(
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .labelSmall
                                                                            .fontStyle,
                                                                      ),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelSmall
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              1.0, 0.0),
                                                      child: Builder(
                                                        builder: (context) =>
                                                            FFButtonWidget(
                                                          onPressed: () async {
                                                            if (listViewRewardsRecord
                                                                    .pointsCost <=
                                                                valueOrDefault(
                                                                    currentUserDocument
                                                                        ?.points,
                                                                    0)) {
                                                              await showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (dialogContext) {
                                                                  return Dialog(
                                                                    elevation:
                                                                        0,
                                                                    insetPadding:
                                                                        EdgeInsets
                                                                            .zero,
                                                                    backgroundColor:
                                                                        Colors
                                                                            .transparent,
                                                                    alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0)
                                                                        .resolve(
                                                                            Directionality.of(context)),
                                                                    child:
                                                                        GestureDetector(
                                                                      onTap:
                                                                          () {
                                                                        FocusScope.of(dialogContext)
                                                                            .unfocus();
                                                                        FocusManager
                                                                            .instance
                                                                            .primaryFocus
                                                                            ?.unfocus();
                                                                      },
                                                                      child:
                                                                          CodeWidget(
                                                                        code: listViewRewardsRecord
                                                                            .code,
                                                                        qr: listViewRewardsRecord
                                                                            .qr,
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              );

                                                              if (listViewRewardsRecord
                                                                      .getby
                                                                      .contains(
                                                                          currentUserReference) !=
                                                                  true) {
                                                                await currentUserReference!
                                                                    .update(
                                                                        createUsersRecordData(
                                                                  points: valueOrDefault(
                                                                          currentUserDocument
                                                                              ?.points,
                                                                          0) -
                                                                      listViewRewardsRecord
                                                                          .pointsCost,
                                                                  getcode: true,
                                                                ));

                                                                await listViewRewardsRecord
                                                                    .reference
                                                                    .update({
                                                                  ...mapToFirestore(
                                                                    {
                                                                      'getby':
                                                                          FieldValue
                                                                              .arrayUnion([
                                                                        currentUserReference
                                                                      ]),
                                                                    },
                                                                  ),
                                                                });
                                                              }
                                                            } else {
                                                              if (listViewRewardsRecord
                                                                      .getby
                                                                      .contains(
                                                                          currentUserReference) ==
                                                                  true) {
                                                                await showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (dialogContext) {
                                                                    return Dialog(
                                                                      elevation:
                                                                          0,
                                                                      insetPadding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      backgroundColor:
                                                                          Colors
                                                                              .transparent,
                                                                      alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0)
                                                                          .resolve(
                                                                              Directionality.of(context)),
                                                                      child:
                                                                          GestureDetector(
                                                                        onTap:
                                                                            () {
                                                                          FocusScope.of(dialogContext)
                                                                              .unfocus();
                                                                          FocusManager
                                                                              .instance
                                                                              .primaryFocus
                                                                              ?.unfocus();
                                                                        },
                                                                        child:
                                                                            CodeWidget(
                                                                          code:
                                                                              listViewRewardsRecord.code,
                                                                          qr: listViewRewardsRecord
                                                                              .qr,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                );
                                                              } else {
                                                                await showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (dialogContext) {
                                                                    return Dialog(
                                                                      elevation:
                                                                          0,
                                                                      insetPadding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      backgroundColor:
                                                                          Colors
                                                                              .transparent,
                                                                      alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0)
                                                                          .resolve(
                                                                              Directionality.of(context)),
                                                                      child:
                                                                          GestureDetector(
                                                                        onTap:
                                                                            () {
                                                                          FocusScope.of(dialogContext)
                                                                              .unfocus();
                                                                          FocusManager
                                                                              .instance
                                                                              .primaryFocus
                                                                              ?.unfocus();
                                                                        },
                                                                        child:
                                                                            NoPointWidget(),
                                                                      ),
                                                                    );
                                                                  },
                                                                );
                                                              }
                                                            }
                                                          },
                                                          text: listViewRewardsRecord
                                                                      .getby
                                                                      .contains(
                                                                          currentUserReference) ==
                                                                  true
                                                              ? 'Show Coupon'
                                                              : 'Redeem',
                                                          options:
                                                              FFButtonOptions(
                                                            width: 150.0,
                                                            height: 40.0,
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        20.0,
                                                                        0.0,
                                                                        20.0,
                                                                        0.0),
                                                            iconPadding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .success,
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .inter(
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          15.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                            elevation: 2.0,
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0xFFD2FFF9),
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20.0),
                                                            hoverBorderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondary,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(height: 8.0)),
                                                ),
                                              ),
                                            ].divide(SizedBox(width: 16.0)),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ].divide(SizedBox(height: 16.0)),
                        ),
                      ),
                    ),
                  ]
                      .divide(SizedBox(height: 24.0))
                      .addToStart(SizedBox(height: 20.0))
                      .addToEnd(SizedBox(height: 32.0)),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: wrapWithModel(
                  model: _model.navBar1Model,
                  updateCallback: () => safeSetState(() {}),
                  child: NavBar1Widget(
                    page: 'Redeem',
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
