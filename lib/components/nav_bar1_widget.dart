import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'nav_bar1_model.dart';
export 'nav_bar1_model.dart';

class NavBar1Widget extends StatefulWidget {
  const NavBar1Widget({
    super.key,
    required this.page,
  });

  final String? page;

  @override
  State<NavBar1Widget> createState() => _NavBar1WidgetState();
}

class _NavBar1WidgetState extends State<NavBar1Widget>
    with TickerProviderStateMixin {
  late NavBar1Model _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavBar1Model());

    animationsMap.addAll({
      'iconButtonOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          RotateEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 900.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 110.0,
      decoration: BoxDecoration(
        color: Color(0x00EEEEEE),
      ),
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Material(
                color: Colors.transparent,
                elevation: 0.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                child: Container(
                  width: double.infinity,
                  height: 100.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10.0,
                        color: Color(0x1A57636C),
                        offset: Offset(
                          0.0,
                          -10.0,
                        ),
                        spreadRadius: 0.1,
                      )
                    ],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 35.0,
                borderWidth: 1.0,
                buttonSize: 70.0,
                icon: Icon(
                  Icons.home_rounded,
                  color: widget!.page == 'HOME'
                      ? FlutterFlowTheme.of(context).success
                      : Color(0xFF9299A1),
                  size: 45.0,
                ),
                onPressed: () async {
                  context.pushNamed(
                    HomeWidget.routeName,
                    extra: <String, dynamic>{
                      '__transition_info__': TransitionInfo(
                        hasTransition: true,
                        transitionType: PageTransitionType.fade,
                        duration: Duration(milliseconds: 0),
                      ),
                    },
                  );
                },
              ),
              FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 35.0,
                borderWidth: 1.0,
                buttonSize: 70.0,
                icon: Icon(
                  Icons.location_city,
                  color: widget!.page == 'Riyadh'
                      ? FlutterFlowTheme.of(context).success
                      : Color(0xFF9299A1),
                  size: 45.0,
                ),
                onPressed: () async {
                  context.pushNamed(
                    RiyadhWidget.routeName,
                    extra: <String, dynamic>{
                      '__transition_info__': TransitionInfo(
                        hasTransition: true,
                        transitionType: PageTransitionType.fade,
                        duration: Duration(milliseconds: 0),
                      ),
                    },
                  );
                },
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 30.0),
                    child: FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 40.0,
                      borderWidth: 1.0,
                      buttonSize: 75.0,
                      fillColor: FlutterFlowTheme.of(context).success,
                      icon: Icon(
                        Icons.star_rounded,
                        color: Colors.white,
                        size: 45.0,
                      ),
                      onPressed: () async {
                        await Future.wait([
                          Future(() async {
                            context.pushNamed(
                              RedeemWidget.routeName,
                              extra: <String, dynamic>{
                                '__transition_info__': TransitionInfo(
                                  hasTransition: true,
                                  transitionType: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 0),
                                ),
                              },
                            );

                            await Future.delayed(
                              Duration(
                                milliseconds: 500,
                              ),
                            );
                          }),
                          Future(() async {
                            if (animationsMap[
                                    'iconButtonOnActionTriggerAnimation'] !=
                                null) {
                              await animationsMap[
                                      'iconButtonOnActionTriggerAnimation']!
                                  .controller
                                  .forward(from: 0.0);
                            }
                          }),
                        ]);
                      },
                    ).animateOnActionTrigger(
                      animationsMap['iconButtonOnActionTriggerAnimation']!,
                    ),
                  ),
                ],
              ),
              FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 35.0,
                borderWidth: 1.0,
                buttonSize: 70.0,
                icon: Icon(
                  Icons.people_alt_sharp,
                  color: widget!.page == 'MyCommunities'
                      ? FlutterFlowTheme.of(context).success
                      : Color(0xFF9299A1),
                  size: 45.0,
                ),
                onPressed: () async {
                  context.pushNamed(
                    MyCommunitiesWidget.routeName,
                    extra: <String, dynamic>{
                      '__transition_info__': TransitionInfo(
                        hasTransition: true,
                        transitionType: PageTransitionType.fade,
                        duration: Duration(milliseconds: 0),
                      ),
                    },
                  );
                },
              ),
              FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 35.0,
                borderWidth: 1.0,
                buttonSize: 70.0,
                icon: Icon(
                  Icons.person,
                  color: widget!.page == 'Profile'
                      ? FlutterFlowTheme.of(context).success
                      : Color(0xFF9299A1),
                  size: 45.0,
                ),
                onPressed: () async {
                  context.pushNamed(
                    ProfileWidget.routeName,
                    extra: <String, dynamic>{
                      '__transition_info__': TransitionInfo(
                        hasTransition: true,
                        transitionType: PageTransitionType.fade,
                        duration: Duration(milliseconds: 0),
                      ),
                    },
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
