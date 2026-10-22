import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'share_model.dart';
export 'share_model.dart';

/// Design a custom, modern action button for a challenge app.
///
/// Requirements:
/// – Rounded pill shape with soft edges and a clean, minimal look.
/// – Smooth gradient or solid primary color (friendly and energetic).
/// – Include a simple camera or upload icon on the left of the text.
/// – Text inside the button: “Share Your Photo”.
/// – Add subtle shadow and depth to make the button feel clickable.
/// – Include a light hover/tap animation (scale 1.03).
/// – Style should be playful, motivational, and suitable for wellness
/// challenge apps.
/// – Support both light and dark mode.
///
/// The button should stand out visually and feel premium and engaging
class ShareWidget extends StatefulWidget {
  const ShareWidget({super.key});

  static String routeName = 'share';
  static String routePath = '/share';

  @override
  State<ShareWidget> createState() => _ShareWidgetState();
}

class _ShareWidgetState extends State<ShareWidget> {
  late ShareModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ShareModel());
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
        backgroundColor: Color(0xFFF6F6F6),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(32.0),
                  child: Container(
                    width: double.infinity,
                    height: 200.0,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 20.0,
                          color: Color(0x4D6366F1),
                          offset: Offset(
                            0.0,
                            8.0,
                          ),
                        )
                      ],
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFF6366F1),
                          Color(0xFF8B5CF6),
                          Color(0xFF06B6D4)
                        ],
                        stops: [0.0, 0.5, 1.0],
                        begin: AlignmentDirectional(1.0, 1.0),
                        end: AlignmentDirectional(-1.0, -1.0),
                      ),
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Challenge Action Button',
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .override(
                                font: GoogleFonts.readexPro(
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .fontStyle,
                                ),
                                color: Colors.white,
                                fontSize: 22.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.bold,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .fontStyle,
                              ),
                        ),
                        Text(
                          'Modern, engaging design for wellness apps',
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: Color(0xCCFFFFFF),
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        ),
                      ].divide(SizedBox(height: 24.0)),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(28.0, 0.0, 28.0, 0.0),
                  child: Container(
                    width: 280.0,
                    height: 64.0,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 16.0,
                          color: Color(0x4D10B981),
                          offset: Offset(
                            0.0,
                            6.0,
                          ),
                        )
                      ],
                      gradient: LinearGradient(
                        colors: [Color(0xFF10B981), Color(0xFF059669)],
                        stops: [0.0, 1.0],
                        begin: AlignmentDirectional(1.0, -1.0),
                        end: AlignmentDirectional(-1.0, 1.0),
                      ),
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 32.0,
                          height: 32.0,
                          decoration: BoxDecoration(
                            color: Color(0x33FFFFFF),
                            shape: BoxShape.circle,
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Icon(
                              Icons.camera_alt_rounded,
                              color: Colors.white,
                              size: 20.0,
                            ),
                          ),
                        ),
                        Text(
                          'Share Your Photo',
                          style:
                              FlutterFlowTheme.of(context).titleMedium.override(
                                    font: GoogleFonts.readexPro(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontStyle,
                                    ),
                                    color: Colors.white,
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontStyle,
                                  ),
                        ),
                      ].divide(SizedBox(width: 12.0)),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(28.0, 0.0, 28.0, 0.0),
                  child: Container(
                    width: 280.0,
                    height: 64.0,
                    decoration: BoxDecoration(
                      color: Color(0xFF105DFB),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 12.0,
                          color: Color(0x33000000),
                          offset: Offset(
                            0.0,
                            4.0,
                          ),
                        )
                      ],
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.upload_rounded,
                            color: Colors.white,
                            size: 24.0,
                          ),
                          Text(
                            'Share Your Photo',
                            style: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  font: GoogleFonts.readexPro(
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontStyle,
                                  ),
                                  color: Colors.white,
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .fontStyle,
                                ),
                          ),
                        ].divide(SizedBox(width: 12.0)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(28.0, 0.0, 28.0, 0.0),
                  child: Container(
                    width: 300.0,
                    height: 68.0,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 20.0,
                          color: Color(0x4DFF6B6B),
                          offset: Offset(
                            0.0,
                            8.0,
                          ),
                        )
                      ],
                      gradient: LinearGradient(
                        colors: [Color(0xFFFF6B6B), Color(0xFFEE5A24)],
                        stops: [0.0, 1.0],
                        begin: AlignmentDirectional(1.0, -1.0),
                        end: AlignmentDirectional(-1.0, 1.0),
                      ),
                      borderRadius: BorderRadius.circular(34.0),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 36.0,
                          height: 36.0,
                          decoration: BoxDecoration(
                            color: Color(0x26FFFFFF),
                            shape: BoxShape.circle,
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Icon(
                              Icons.photo_camera_rounded,
                              color: Colors.white,
                              size: 22.0,
                            ),
                          ),
                        ),
                        Text(
                          'Share Your Photo',
                          style:
                              FlutterFlowTheme.of(context).titleLarge.override(
                                    font: GoogleFonts.readexPro(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontStyle,
                                    ),
                                    color: Colors.white,
                                    fontSize: 19.0,
                                    letterSpacing: 0.5,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .fontStyle,
                                  ),
                        ),
                      ].divide(SizedBox(width: 16.0)),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(28.0, 0.0, 28.0, 0.0),
                  child: Container(
                    width: 260.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 15.0,
                          color: Color(0x40667EEA),
                          offset: Offset(
                            0.0,
                            5.0,
                          ),
                        )
                      ],
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFF07B49C),
                          FlutterFlowTheme.of(context).success
                        ],
                        stops: [0.0, 1.0],
                        begin: AlignmentDirectional(1.0, 1.0),
                        end: AlignmentDirectional(-1.0, -1.0),
                      ),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add_a_photo_rounded,
                          color: Colors.white,
                          size: 22.0,
                        ),
                        Text(
                          'Share Your Photo',
                          style:
                              FlutterFlowTheme.of(context).titleMedium.override(
                                    font: GoogleFonts.readexPro(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontStyle,
                                    ),
                                    color: Colors.white,
                                    fontSize: 17.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontStyle,
                                  ),
                        ),
                      ].divide(SizedBox(width: 10.0)),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(28.0, 32.0, 28.0, 0.0),
                  child: Text(
                    'Tap any button to see the premium animation effect',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodySmall.override(
                          font: GoogleFonts.inter(
                            fontWeight: FontWeight.normal,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodySmall
                                .fontStyle,
                          ),
                          color: Color(0xFF5A5C60),
                          fontSize: 12.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.normal,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodySmall.fontStyle,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
