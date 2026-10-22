import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'create_post_copy_model.dart';
export 'create_post_copy_model.dart';

/// Create a “Create Post” page for a community app.
///
/// Page title: New Post
///
/// Layout:
/// - Use a ScrollView → Column (padding 16, spacing 12)
/// - Clean, minimal, social-media style design
///
/// Content:
/// 1. Row (User Header)
///    - Circle Avatar (48px) for current user image
///    - Column with:
///      - Text: user display name (bold)
///      - Text: @username · Today (gray small)
///
/// 2. Container (Post Input)
///    - Multiline TextField
///    - Hint text: “Write something…”
///    - Rounded corners (16px)
///    - Light border
///
/// 3. Container (Media Preview)
///    - 2-column grid placeholders for images/videos
///    - Below it: Row with
///      - IconButton: photo (label “Add Photo”)
///      - IconButton: video (label “Add Video”)
///
/// 4. Divider (thin gray)
///
/// 5. Row (Meta)
///    - Chip: community name
///    - Chip: privacy (Public)
///
/// 6. Button (primary, full width)
///    - Text: “Post”
///
/// Style:
/// - Neutral background
/// - Rounded corners 16px
/// - Soft shadows under cards and buttons
/// - Modern and clean look
class CreatePostCopyWidget extends StatefulWidget {
  const CreatePostCopyWidget({
    super.key,
    required this.community,
    this.commentRef,
  });

  final DocumentReference? community;
  final CommentRecord? commentRef;

  static String routeName = 'CreatePostCopy';
  static String routePath = '/createPostCopy';

  @override
  State<CreatePostCopyWidget> createState() => _CreatePostCopyWidgetState();
}

class _CreatePostCopyWidgetState extends State<CreatePostCopyWidget> {
  late CreatePostCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreatePostCopyModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
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
            leading: FlutterFlowIconButton(
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
            actions: [],
            flexibleSpace: FlexibleSpaceBar(
              title: Align(
                alignment: AlignmentDirectional(-1.0, 1.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(25.0, 0.0, 0.0, 0.0),
                  child: Text(
                    'New Post',
                    style: FlutterFlowTheme.of(context).titleLarge.override(
                          font: GoogleFonts.interTight(
                            fontWeight: FontWeight.bold,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleLarge
                                .fontStyle,
                          ),
                          fontSize: 35.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleLarge.fontStyle,
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
            padding: EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4.0,
                            color: Color(0x1A000000),
                            offset: Offset(
                              0.0,
                              2.0,
                            ),
                          )
                        ],
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                AuthUserStreamWidget(
                                  builder: (context) => Container(
                                    width: 48.0,
                                    height: 48.0,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.network(
                                      currentUserPhoto,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AuthUserStreamWidget(
                                        builder: (context) => Text(
                                          currentUserDisplayName,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                      ),
                                      Text(
                                        'Today',
                                        style: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .fontStyle,
                                            ),
                                      ),
                                    ].divide(SizedBox(height: 2.0)),
                                  ),
                                ),
                              ].divide(SizedBox(width: 12.0)),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xFF9EEBE2),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 6.0, 12.0, 6.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          Icons.group_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 16.0,
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  4.0, 0.0, 4.0, 0.0),
                                          child: Text(
                                            valueOrDefault<String>(
                                              widget!.community?.id,
                                              'hi',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodySmall
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodySmall
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodySmall
                                                          .fontStyle,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ].divide(SizedBox(width: 8.0)),
                            ),
                            Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(16.0),
                                  border: Border.all(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    width: 1.0,
                                  ),
                                ),
                                child: TextFormField(
                                  controller: _model.textController,
                                  focusNode: _model.textFieldFocusNode,
                                  autofocus: false,
                                  textCapitalization:
                                      TextCapitalization.sentences,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    hintText: '  Write something…',
                                    hintStyle: FlutterFlowTheme.of(context)
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
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 16.0,
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
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    focusedErrorBorder: InputBorder.none,
                                  ),
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
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                  maxLines: 6,
                                  minLines: 3,
                                  maxLength: 250,
                                  keyboardType: TextInputType.multiline,
                                  cursorColor:
                                      FlutterFlowTheme.of(context).success,
                                  validator: _model.textControllerValidator
                                      .asValidator(context),
                                  inputFormatters: [
                                    if (!isAndroid && !isiOS)
                                      TextInputFormatter.withFunction(
                                          (oldValue, newValue) {
                                        return TextEditingValue(
                                          selection: newValue.selection,
                                          text: newValue.text.toCapitalization(
                                              TextCapitalization.sentences),
                                        );
                                      }),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(16.0),
                                  border: Border.all(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    width: 1.0,
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(16.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.memory(
                                                        _model.uploadedLocalFile_uploadDataEv
                                                                .bytes ??
                                                            Uint8List.fromList(
                                                                []),
                                                        width: 420.0,
                                                        height: 200.0,
                                                        fit: BoxFit.cover,
                                                        errorBuilder: (context,
                                                                error,
                                                                stackTrace) =>
                                                            Image.asset(
                                                          'assets/images/error_image.png',
                                                          width: 420.0,
                                                          height: 200.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child:
                                                            FlutterFlowIconButton(
                                                          borderRadius: 12.0,
                                                          buttonSize: 48.0,
                                                          fillColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .success,
                                                          icon: Icon(
                                                            Icons
                                                                .photo_camera_outlined,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                            size: 24.0,
                                                          ),
                                                          onPressed: () async {
                                                            final selectedMedia =
                                                                await selectMediaWithSourceBottomSheet(
                                                              context: context,
                                                              allowPhoto: true,
                                                            );
                                                            if (selectedMedia !=
                                                                    null &&
                                                                selectedMedia.every((m) =>
                                                                    validateFileFormat(
                                                                        m.storagePath,
                                                                        context))) {
                                                              safeSetState(() =>
                                                                  _model.isDataUploading_uploadDataEv =
                                                                      true);
                                                              var selectedUploadedFiles =
                                                                  <FFUploadedFile>[];

                                                              try {
                                                                selectedUploadedFiles =
                                                                    selectedMedia
                                                                        .map((m) =>
                                                                            FFUploadedFile(
                                                                              name: m.storagePath.split('/').last,
                                                                              bytes: m.bytes,
                                                                              height: m.dimensions?.height,
                                                                              width: m.dimensions?.width,
                                                                              blurHash: m.blurHash,
                                                                              originalFilename: m.originalFilename,
                                                                            ))
                                                                        .toList();
                                                              } finally {
                                                                _model.isDataUploading_uploadDataEv =
                                                                    false;
                                                              }
                                                              if (selectedUploadedFiles
                                                                      .length ==
                                                                  selectedMedia
                                                                      .length) {
                                                                safeSetState(
                                                                    () {
                                                                  _model.uploadedLocalFile_uploadDataEv =
                                                                      selectedUploadedFiles
                                                                          .first;
                                                                });
                                                              } else {
                                                                safeSetState(
                                                                    () {});
                                                                return;
                                                              }
                                                            }
                                                          },
                                                        ),
                                                      ),
                                                      if (_model.uploadedLocalFile_uploadDataEv !=
                                                              null &&
                                                          (_model
                                                                  .uploadedLocalFile_uploadDataEv
                                                                  .bytes
                                                                  ?.isNotEmpty ??
                                                              false))
                                                        FlutterFlowIconButton(
                                                          borderRadius: 8.0,
                                                          buttonSize: 48.0,
                                                          fillColor:
                                                              Color(0xFFEF3939),
                                                          icon: Icon(
                                                            Icons
                                                                .delete_outline_outlined,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .info,
                                                            size: 24.0,
                                                          ),
                                                          onPressed: () async {
                                                            safeSetState(() {
                                                              _model.isDataUploading_uploadDataEv =
                                                                  false;
                                                              _model.uploadedLocalFile_uploadDataEv =
                                                                  FFUploadedFile(
                                                                      bytes: Uint8List
                                                                          .fromList(
                                                                              []),
                                                                      originalFilename:
                                                                          '');
                                                            });
                                                          },
                                                        ),
                                                    ]
                                                        .divide(SizedBox(
                                                            width: 20.0))
                                                        .addToStart(SizedBox(
                                                            width: 60.0)),
                                                  ),
                                                ].divide(SizedBox(height: 4.0)),
                                              ),
                                            ],
                                          ),
                                        ].divide(SizedBox(height: 12.0)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Divider(
                              height: 1.0,
                              thickness: 1.0,
                              color: FlutterFlowTheme.of(context).alternate,
                            ),
                          ].divide(SizedBox(height: 16.0)),
                        ),
                      ),
                    ),
                  ),
                  FFButtonWidget(
                    onPressed: ((_model.uploadedLocalFile_uploadDataEv ==
                                    null ||
                                (_model.uploadedLocalFile_uploadDataEv.bytes
                                        ?.isEmpty ??
                                    true)) &&
                            (_model.textController.text == null ||
                                _model.textController.text == ''))
                        ? null
                        : () async {
                            if (_model.uploadedLocalFile_uploadDataEv != null &&
                                (_model.uploadedLocalFile_uploadDataEv.bytes
                                        ?.isNotEmpty ??
                                    false)) {
                              {
                                safeSetState(() => _model
                                    .isDataUploading_uploadData42h = true);
                                var selectedUploadedFiles = <FFUploadedFile>[];
                                var selectedMedia = <SelectedFile>[];
                                var downloadUrls = <String>[];
                                try {
                                  selectedUploadedFiles = _model
                                          .uploadedLocalFile_uploadDataEv
                                          .bytes!
                                          .isNotEmpty
                                      ? [_model.uploadedLocalFile_uploadDataEv]
                                      : <FFUploadedFile>[];
                                  selectedMedia =
                                      selectedFilesFromUploadedFiles(
                                    selectedUploadedFiles,
                                  );
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
                                  _model.isDataUploading_uploadData42h = false;
                                }
                                if (selectedUploadedFiles.length ==
                                        selectedMedia.length &&
                                    downloadUrls.length ==
                                        selectedMedia.length) {
                                  safeSetState(() {
                                    _model.uploadedLocalFile_uploadData42h =
                                        selectedUploadedFiles.first;
                                    _model.uploadedFileUrl_uploadData42h =
                                        downloadUrls.first;
                                  });
                                } else {
                                  safeSetState(() {});
                                  return;
                                }
                              }

                              await PostRecord.collection.doc().set({
                                ...createPostRecordData(
                                  postDescription: _model.textController.text,
                                  postUser: currentUserReference,
                                  postCommunity: widget!.community,
                                  postPhoto:
                                      _model.uploadedFileUrl_uploadData42h,
                                  isPinned: false,
                                  reportCount: 0,
                                ),
                                ...mapToFirestore(
                                  {
                                    'time_posted': FieldValue.serverTimestamp(),
                                  },
                                ),
                              });
                            } else {
                              await PostRecord.collection.doc().set({
                                ...createPostRecordData(
                                  postDescription: _model.textController.text,
                                  postUser: currentUserReference,
                                  postCommunity: widget!.community,
                                  isPinned: false,
                                  postPhoto: '',
                                  reportCount: 0,
                                ),
                                ...mapToFirestore(
                                  {
                                    'time_posted': FieldValue.serverTimestamp(),
                                  },
                                ),
                              });
                            }

                            context.safePop();
                          },
                    text: 'Post',
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 50.0,
                      padding: EdgeInsets.all(8.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).success,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                font: GoogleFonts.interTight(
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                                color: Colors.white,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .fontStyle,
                              ),
                      elevation: 2.0,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(16.0),
                      disabledColor: Color(0x637E878D),
                    ),
                  ),
                ].divide(SizedBox(height: 12.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
