import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/poinerarn_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'sharepic_model.dart';
export 'sharepic_model.dart';

/// Create a component *Design a modern, clean, and friendly UI component for
/// submitting challenge photos.
///
/// The component should let users upload or capture an image to prove they
/// completed the challenge (e.g., “Drink Water Challenge”).
///
/// The style should be playful, motivating, and community-driven.
///
/// Requirements:*
/// – A header with the challenge title (e.g., “Share Your Proof”).
/// – A large image upload area with a dashed border, camera icon, and short
/// text like “Upload your photo” or “Take a picture”.
/// – When the user uploads an image, display a preview with rounded corners
/// and a remove button.
/// – Add a short motivational line like “Show the community your progress!”.
/// – Include a primary button: “Submit Photo”.
/// – Use soft colors, rounded shapes, and subtle shadows.
/// – Make the component card-like with spacing and padding that feels light
/// and elegant.
/// – Ensure it works for both light and dark mode.
/// – Make the layout responsive for mobile screens.
/// –
class SharepicWidget extends StatefulWidget {
  const SharepicWidget({
    super.key,
    this.challengref,
  });

  final DocumentReference? challengref;

  @override
  State<SharepicWidget> createState() => _SharepicWidgetState();
}

class _SharepicWidgetState extends State<SharepicWidget> {
  late SharepicModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SharepicModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
        child: Container(
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            boxShadow: [
              BoxShadow(
                blurRadius: 8.0,
                color: Color(0x1A000000),
                offset: Offset(
                  0.0,
                  2.0,
                ),
                spreadRadius: 0.0,
              )
            ],
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Share Your photo',
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .override(
                                font: GoogleFonts.interTight(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .fontStyle,
                                ),
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .fontStyle,
                              ),
                        ),
                        Text(
                          'Show the community your progress!',
                          textAlign: TextAlign.center,
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
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                        ),
                      ].divide(SizedBox(height: 8.0)),
                    ),
                    Container(
                      width: double.infinity,
                      height: 200.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(12.0),
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).alternate,
                          width: 2.0,
                        ),
                      ),
                      child: Stack(
                        children: [
                          if (_model.uploadedFileUrl_uploadedFileUrlphoto8 !=
                                  null &&
                              _model.uploadedFileUrl_uploadedFileUrlphoto8 !=
                                  '')
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.network(
                                valueOrDefault<String>(
                                  _model.uploadedFileUrl_uploadedFileUrlphoto8,
                                  'https://www.google.com/imgres?q=upload%20image&imgurl=https%3A%2F%2Fwww.lifewire.com%2Fthmb%2FTRGYpWa4KzxUt1Fkgr3FqjOd6VQ%3D%2F1500x0%2Ffilters%3Ano_upscale()%3Amax_bytes(150000)%3Astrip_icc()%2Fcloud-upload-a30f385a928e44e199a62210d578375a.jpg&imgrefurl=https%3A%2F%2Fwww.lifewire.com%2Fuploading-and-downloading-online-3985950&docid=JDNJ3sAPp2ILgM&tbnid=SE6Qb1IUAnOJRM&vet=12ahUKEwjw-Z3Aq5GRAxWrVKQEHfRAJDcQM3oECBsQAA..i&w=1500&h=1036&hcb=2&ved=2ahUKEwjw-Z3Aq5GRAxWrVKQEHfRAJDcQM3oECBsQAA',
                                ),
                                width: 517.5,
                                height: 200.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          if (_model.uploadedFileUrl_uploadedFileUrlphoto8 ==
                                  null ||
                              _model.uploadedFileUrl_uploadedFileUrlphoto8 ==
                                  '')
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Icon(
                                Icons.no_photography_sharp,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                            ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            safeSetState(() {
                              _model.isDataUploading_uploadedFileUrlphoto8 =
                                  false;
                              _model.uploadedLocalFile_uploadedFileUrlphoto8 =
                                  FFUploadedFile(
                                      bytes: Uint8List.fromList([]),
                                      originalFilename: '');
                              _model.uploadedFileUrl_uploadedFileUrlphoto8 = '';
                            });
                          },
                          child: Container(
                            width: 140.0,
                            height: 120.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).alternate,
                                width: 1.0,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 12.0, 12.0, 12.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  safeSetState(() {
                                    _model.isDataUploading_uploadedFileUrlphoto8 =
                                        false;
                                    _model.uploadedLocalFile_uploadedFileUrlphoto8 =
                                        FFUploadedFile(
                                            bytes: Uint8List.fromList([]),
                                            originalFilename: '');
                                    _model.uploadedFileUrl_uploadedFileUrlphoto8 =
                                        '';
                                  });
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.delete_outline,
                                      color: FlutterFlowTheme.of(context).error,
                                      size: 32.0,
                                    ),
                                    Text(
                                      'Delete photo',
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
                                  ].divide(SizedBox(height: 8.0)),
                                ),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            final selectedMedia = await selectMedia(
                              mediaSource: MediaSource.photoGallery,
                              multiImage: false,
                            );
                            if (selectedMedia != null &&
                                selectedMedia.every((m) => validateFileFormat(
                                    m.storagePath, context))) {
                              safeSetState(() =>
                                  _model.isDataUploading_uploadedFileUrlphoto8 =
                                      true);
                              var selectedUploadedFiles = <FFUploadedFile>[];

                              var downloadUrls = <String>[];
                              try {
                                selectedUploadedFiles = selectedMedia
                                    .map((m) => FFUploadedFile(
                                          name: m.storagePath.split('/').last,
                                          bytes: m.bytes,
                                          height: m.dimensions?.height,
                                          width: m.dimensions?.width,
                                          blurHash: m.blurHash,
                                          originalFilename: m.originalFilename,
                                        ))
                                    .toList();

                                downloadUrls = (await Future.wait(
                                  selectedMedia.map(
                                    (m) async => await uploadData(
                                        m.storagePath, m.bytes),
                                  ),
                                ))
                                    .where((u) => u != null)
                                    .map((u) => u!)
                                    .toList();
                              } finally {
                                _model.isDataUploading_uploadedFileUrlphoto8 =
                                    false;
                              }
                              if (selectedUploadedFiles.length ==
                                      selectedMedia.length &&
                                  downloadUrls.length == selectedMedia.length) {
                                safeSetState(() {
                                  _model.uploadedLocalFile_uploadedFileUrlphoto8 =
                                      selectedUploadedFiles.first;
                                  _model.uploadedFileUrl_uploadedFileUrlphoto8 =
                                      downloadUrls.first;
                                });
                              } else {
                                safeSetState(() {});
                                return;
                              }
                            }
                          },
                          child: Container(
                            width: 140.0,
                            height: 120.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).alternate,
                                width: 1.0,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 12.0, 12.0, 12.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.upload,
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 32.0,
                                  ),
                                  Text(
                                    'Upload photo',
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
                                ].divide(SizedBox(height: 8.0)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional(-1.0, 0.0),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).accent2,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(12.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      Icons.error_outline_rounded,
                                      color:
                                          FlutterFlowTheme.of(context).success,
                                      size: 18.0,
                                    ),
                                    Expanded(
                                      child: Text(
                                        'You can upload only one photo for this challenge. Please choose your best shot!',
                                        style: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight: FontWeight.bold,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .success,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .fontStyle,
                                              lineHeight: 1.3,
                                            ),
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 8.0)),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Builder(
                      builder: (context) => FFButtonWidget(
                        onPressed: (_model
                                        .uploadedFileUrl_uploadedFileUrlphoto8 ==
                                    null ||
                                _model.uploadedFileUrl_uploadedFileUrlphoto8 ==
                                    '')
                            ? null
                            : () async {
                                if (_model.uploadedFileUrl_uploadedFileUrlphoto8 !=
                                        null &&
                                    _model.uploadedFileUrl_uploadedFileUrlphoto8 !=
                                        '') {
                                  await ChallengeProofsRecord.collection
                                      .doc()
                                      .set(createChallengeProofsRecordData(
                                        challengeRef: widget!.challengref,
                                        userRef: currentUserReference,
                                        photo: _model
                                            .uploadedFileUrl_uploadedFileUrlphoto8,
                                        isPointAwarded: true,
                                        ttiimee: getCurrentTimestamp,
                                      ));

                                  await currentUserReference!.update({
                                    ...createUsersRecordData(
                                      getreward: true,
                                    ),
                                    ...mapToFirestore(
                                      {
                                        'Points': FieldValue.increment(10),
                                      },
                                    ),
                                  });
                                  context.safePop();
                                  await showDialog(
                                    context: context,
                                    builder: (dialogContext) {
                                      return Dialog(
                                        elevation: 0,
                                        insetPadding: EdgeInsets.zero,
                                        backgroundColor: Colors.transparent,
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                        child: PoinerarnWidget(),
                                      );
                                    },
                                  );
                                }
                              },
                        text: 'Submit Photo',
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 50.0,
                          padding: EdgeInsets.all(8.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).success,
                          textStyle:
                              FlutterFlowTheme.of(context).titleMedium.override(
                                    font: GoogleFonts.interTight(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context).info,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontStyle,
                                  ),
                          elevation: 0.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(25.0),
                          disabledColor:
                              FlutterFlowTheme.of(context).secondaryText,
                        ),
                      ),
                    ),
                  ].divide(SizedBox(height: 20.0)),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 0.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.safePop();
                  },
                  child: Icon(
                    Icons.clear,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 24.0,
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
