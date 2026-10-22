import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/callender/text_day/text_day_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:math' as math;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'calender_model.dart';
export 'calender_model.dart';

class CalenderWidget extends StatefulWidget {
  const CalenderWidget({
    super.key,
    required this.inputDate,
    this.onSelectDateAction,
    this.initialSelectedDate,
  });

  final DateTime? inputDate;
  final Future Function(DateTime? selectedDate1)? onSelectDateAction;
  final DateTime? initialSelectedDate;

  @override
  State<CalenderWidget> createState() => _CalenderWidgetState();
}

class _CalenderWidgetState extends State<CalenderWidget> {
  late CalenderModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CalenderModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.calUserChall = await queryChallengeHistoryRecordOnce(
        parent: currentUserReference,
      );
      _model.inputDate = widget!.inputDate;
      safeSetState(() {});
      if (widget!.initialSelectedDate != null) {
        _model.selectedDate1 = widget!.initialSelectedDate;
        safeSetState(() {});
      }
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<ChallengeHistoryRecord>>(
      stream: queryChallengeHistoryRecord(
        parent: currentUserReference,
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
        List<ChallengeHistoryRecord> containerChallengeHistoryRecordList =
            snapshot.data!;

        return Container(
          width: 446.12,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Transform.rotate(
                      angle: 180.0 * (math.pi / 180),
                      child: FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30.0,
                        buttonSize: 45.0,
                        icon: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24.0,
                        ),
                        onPressed: () async {
                          _model.inputDate =
                              functions.getLastMonthDateTime(_model.inputDate!);
                          safeSetState(() {});
                        },
                      ),
                    ),
                    Text(
                      containerChallengeHistoryRecordList.length.toString(),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                      functions
                          .getCalendarForMonth(_model.inputDate!)
                          .length
                          .toString(),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                      '${dateTimeFormat("MMMM", dateTimeFromSecondsSinceEpoch(valueOrDefault<int>(
                            _model.inputDate?.secondsSinceEpoch,
                            0,
                          )))} ${dateTimeFormat("y", _model.inputDate)}',
                      style: FlutterFlowTheme.of(context).labelLarge.override(
                            font: GoogleFonts.inter(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .labelLarge
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .labelLarge
                                  .fontStyle,
                            ),
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .labelLarge
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .labelLarge
                                .fontStyle,
                          ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            _model.inputDate = getCurrentTimestamp;
                            _model.selectedDate1 = getCurrentTimestamp;
                            safeSetState(() {});
                            await widget.onSelectDateAction?.call(
                              _model.selectedDate1,
                            );
                          },
                          child: Icon(
                            Icons.restart_alt,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                        ),
                        FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 30.0,
                          buttonSize: 45.0,
                          icon: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                          onPressed: () async {
                            _model.inputDate = functions
                                .getNextMonthDateTime(_model.inputDate!);
                            safeSetState(() {});
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(26.0, 10.0, 26.0, 10.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    wrapWithModel(
                      model: _model.textDayModel1,
                      updateCallback: () => safeSetState(() {}),
                      child: TextDayWidget(
                        day: 'Mon',
                      ),
                    ),
                    wrapWithModel(
                      model: _model.textDayModel2,
                      updateCallback: () => safeSetState(() {}),
                      child: TextDayWidget(
                        day: 'Tue',
                      ),
                    ),
                    wrapWithModel(
                      model: _model.textDayModel3,
                      updateCallback: () => safeSetState(() {}),
                      child: TextDayWidget(
                        day: 'Wed',
                      ),
                    ),
                    wrapWithModel(
                      model: _model.textDayModel4,
                      updateCallback: () => safeSetState(() {}),
                      child: TextDayWidget(
                        day: 'Thu',
                      ),
                    ),
                    wrapWithModel(
                      model: _model.textDayModel5,
                      updateCallback: () => safeSetState(() {}),
                      child: TextDayWidget(
                        day: 'Fri',
                      ),
                    ),
                    wrapWithModel(
                      model: _model.textDayModel6,
                      updateCallback: () => safeSetState(() {}),
                      child: TextDayWidget(
                        day: 'Sat',
                      ),
                    ),
                    wrapWithModel(
                      model: _model.textDayModel7,
                      updateCallback: () => safeSetState(() {}),
                      child: TextDayWidget(
                        day: 'Sun',
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                  child: Builder(
                    builder: (context) {
                      final calendar = functions
                          .getCalendarForMonth(_model.inputDate!)
                          .toList();

                      return GridView.builder(
                        padding: EdgeInsets.zero,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 7,
                          crossAxisSpacing: 2.0,
                          mainAxisSpacing: 2.0,
                          childAspectRatio: 1.0,
                        ),
                        primary: false,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: calendar.length,
                        itemBuilder: (context, calendarIndex) {
                          final calendarItem = calendar[calendarIndex];
                          return InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              _model.selectedDate1 = calendarItem.calendarDate;
                              safeSetState(() {});
                              await widget.onSelectDateAction?.call(
                                _model.selectedDate1,
                              );
                            },
                            child: Container(
                              width: 0.0,
                              height: 30.0,
                              decoration: BoxDecoration(
                                color: dateTimeFormat("d/M/y",
                                            calendarItem.calendarDate) ==
                                        dateTimeFormat(
                                            "d/M/y", _model.selectedDate1)
                                    ? FlutterFlowTheme.of(context).primaryText
                                    : Color(0x00000000),
                                borderRadius: BorderRadius.circular(30.0),
                                border: Border.all(
                                  color: dateTimeFormat("d/M/y",
                                              calendarItem.calendarDate) ==
                                          dateTimeFormat(
                                              "d/M/y", getCurrentTimestamp)
                                      ? FlutterFlowTheme.of(context).primaryText
                                      : Color(0x00000000),
                                  width: 0.5,
                                ),
                              ),
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: CircularPercentIndicator(
                                      percent: functions.getDayProgress(
                                          calendarItem.calendarDate!,
                                          containerChallengeHistoryRecordList
                                              .toList()),
                                      radius: 27.5,
                                      lineWidth: 100.0,
                                      animation: true,
                                      animateFromLastPercent: true,
                                      progressColor:
                                          FlutterFlowTheme.of(context)
                                              .secondary,
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Text(
                                      dateTimeFormat(
                                          "d",
                                          dateTimeFromSecondsSinceEpoch(
                                              valueOrDefault<int>(
                                            calendarItem.calendarDate
                                                ?.secondsSinceEpoch,
                                            0,
                                          ))),
                                      style:
                                          FlutterFlowTheme.of(context)
                                              .labelLarge
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelLarge
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelLarge
                                                          .fontStyle,
                                                ),
                                                color: (calendarItem
                                                                .isPreviousMonth ==
                                                            true) ||
                                                        (calendarItem
                                                                .isNextMonth ==
                                                            true)
                                                    ? (dateTimeFormat(
                                                                "d/M/y",
                                                                calendarItem
                                                                    .calendarDate) ==
                                                            dateTimeFormat(
                                                                "d/M/y",
                                                                _model
                                                                    .selectedDate1)
                                                        ? FlutterFlowTheme.of(context)
                                                            .alternate
                                                        : FlutterFlowTheme.of(context)
                                                            .secondaryText)
                                                    : (dateTimeFormat(
                                                                "d/M/y",
                                                                calendarItem
                                                                    .calendarDate) ==
                                                            dateTimeFormat(
                                                                "d/M/y",
                                                                _model
                                                                    .selectedDate1)
                                                        ? FlutterFlowTheme.of(context)
                                                            .alternate
                                                        : FlutterFlowTheme.of(context)
                                                            .primaryText),
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .labelLarge
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelLarge
                                                        .fontStyle,
                                                lineHeight: 1.1,
                                              ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
              Container(
                height: 40.0,
                decoration: BoxDecoration(),
              ),
            ].addToStart(SizedBox(height: 16.0)),
          ),
        );
      },
    );
  }
}
