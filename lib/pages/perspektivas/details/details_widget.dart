import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/modals/congrats_modal/congrats_modal_widget.dart';
import '/components/modals/failed_modal/failed_modal_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shake/shake.dart';
import 'details_model.dart';
export 'details_model.dart';

class DetailsWidget extends StatefulWidget {
  const DetailsWidget({
    super.key,
    required this.perspektivaUUID,
    bool? perspektivaIsAlreadyGuessedByUser,
    bool? correctGuessOnBack,
    bool? postBack,
    required this.townZip,
    required this.townName,
    this.photoCompareResult,
  })  : perspektivaIsAlreadyGuessedByUser =
            perspektivaIsAlreadyGuessedByUser ?? false,
        correctGuessOnBack = correctGuessOnBack ?? false,
        postBack = postBack ?? false;

  final String? perspektivaUUID;
  final bool perspektivaIsAlreadyGuessedByUser;
  final bool correctGuessOnBack;
  final int? townZip;
  final String? townName;
  final bool postBack;
  final double? photoCompareResult;

  @override
  State<DetailsWidget> createState() => _DetailsWidgetState();
}

class _DetailsWidgetState extends State<DetailsWidget>
    with TickerProviderStateMixin {
  late DetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  // late ShakeDetector shakeDetector;
  var shakeActionInProgress = false;
  var hasImageTriggered = false;
  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DetailsModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Details'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('DETAILS_PAGE_Details_ON_INIT_STATE');
      if (!widget.postBack) {
        return;
      }
      if (widget.correctGuessOnBack) {
        logFirebaseEvent('Details_alert_dialog');
        await showDialog(
          context: context,
          builder: (dialogContext) {
            return Dialog(
              elevation: 0,
              insetPadding: EdgeInsets.zero,
              backgroundColor: Colors.transparent,
              alignment: const AlignmentDirectional(0.0, 0.0)
                  .resolve(Directionality.of(context)),
              child: GestureDetector(
                onTap: () => FocusScope.of(dialogContext).unfocus(),
                child: const CongratsModalWidget(),
              ),
            );
          },
        );
      } else {
        logFirebaseEvent('Details_alert_dialog');
        await showDialog(
          context: context,
          builder: (dialogContext) {
            return Dialog(
              elevation: 0,
              insetPadding: EdgeInsets.zero,
              backgroundColor: Colors.transparent,
              alignment: const AlignmentDirectional(0.0, 0.0)
                  .resolve(Directionality.of(context)),
              child: GestureDetector(
                onTap: () => FocusScope.of(dialogContext).unfocus(),
                child: const FailedModalWidget(),
              ),
            );
          },
        );
      }
    });
/*
    // On shake action.
    shakeDetector = ShakeDetector.autoStart(
      onPhoneShake: () async {
        if (shakeActionInProgress) {
          return;
        }
        shakeActionInProgress = true;
        try {
          logFirebaseEvent('DETAILS_PAGE_Details_ON_PHONE_SHAKE');
          logFirebaseEvent('Details_navigate_to');

          context.pushNamed(
            'Details',
            queryParameters: {
              'perspektivaUUID': serializeParam(
                widget.perspektivaUUID,
                ParamType.String,
              ),
            }.withoutNulls,
            extra: <String, dynamic>{
              kTransitionInfoKey: const TransitionInfo(
                hasTransition: true,
                transitionType: PageTransitionType.fade,
              ),
            },
          );
        } finally {
          shakeActionInProgress = false;
        }
      },
      shakeThresholdGravity: 1.5,
    );
*/
    animationsMap.addAll({
      'imageOnPageLoadAnimation': AnimationInfo(
        loop: true,
        reverse: true,
        trigger: AnimationTrigger.onPageLoad,
        applyInitialState: false,
        effectsBuilder: () => [
          TiltEffect(
            curve: Curves.elasticOut,
            delay: 1000.0.ms,
            duration: 1260.0.ms,
            begin: const Offset(0, 0),
            end: const Offset(-0.087, 0.175),
          ),
        ],
      ),
      'imageOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: false,
        effectsBuilder: () => [
          RotateEffect(
            curve: Curves.easeInOut,
            delay: 150.0.ms,
            duration: 530.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'textOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 60.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'rowOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 80.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'rowOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 80.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'textOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 100.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'textOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 120.0),
            end: const Offset(0.0, 0.0),
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

    SchedulerBinding.instance.addPostFrameCallback((_) {
      // animationsMap['imageOnPageLoadAnimation']!.controller.forward(from: 0.0);
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    //shakeDetector.stopListening();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => StreamBuilder<List<PerspektivasRecord>>(
        stream: queryPerspektivasRecord(
          queryBuilder: (perspektivasRecord) => perspektivasRecord.where(
            'perspektiva_uuid',
            isEqualTo: widget.perspektivaUUID,
          ),
          singleRecord: true,
        ),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Scaffold(
              backgroundColor: FlutterFlowTheme.of(context).accent1,
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
          List<PerspektivasRecord> detailsPerspektivasRecordList =
              snapshot.data!;
          // Return an empty Container when the item does not exist.
          if (snapshot.data!.isEmpty) {
            return Container();
          }
          final detailsPerspektivasRecord =
              detailsPerspektivasRecordList.isNotEmpty
                  ? detailsPerspektivasRecordList.first
                  : null;

          return GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).accent1,
              body: Builder(
                builder: (context) => InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent('DETAILS_PAGE_Container_w04s1qm4_ON_TAP');
                    logFirebaseEvent('Container_alert_dialog');
                    /*await showDialog(
                      context: context,
                      builder: (dialogContext) {

                        return Dialog(
                          elevation: 0,
                          insetPadding: EdgeInsets.zero,
                          backgroundColor: Colors.transparent,
                          alignment: const AlignmentDirectional(0.0, 0.0)
                              .resolve(Directionality.of(context)),
                          child: GestureDetector(
                            onTap: () => FocusScope.of(dialogContext).unfocus(),
                            child: const CongratsModalWidget(),
                          ),
                        );

                      },
                    );*/
                  },
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFF5706FB), Color(0xFF39B4D2)],
                        stops: [0.0, 1.0],
                        begin: AlignmentDirectional(0.0, -1.0),
                        end: AlignmentDirectional(0, 1.0),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              20.0, 20.0, 20.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.settings_outlined,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'DETAILS_PAGE_Icon_86l0iw8h_ON_TAP');
                                  logFirebaseEvent('Icon_navigate_back');
                                  //context.safePop();
                                  /*context.pushNamedAuth(
                                    'Dashboard',
                                    true, // 'mounted' parameter
                                    pathParameters: {
                                      'townZip':
                                          '1000', // Replace '12345' with the actual town zip value
                                      'townName':
                                          'Ljubljanaaa', // Replace 'SampleTown' with the actual town name
                                    },
                                  );*/
                                  // Example of navigating to the '/dashboard' route with the 'townZip' parameter
                                  context.pushNamedAuth(
                                    'Dashboard_2', // Route name
                                    true, // Mounted
                                    queryParameters: {
                                      'townZip': serializeParam(
                                        widget.townZip,
                                        ParamType.int,
                                      ),
                                      'townName': serializeParam(
                                        widget.townName,
                                        ParamType.String,
                                      ),
                                    }.withoutNulls,
                                  );
/*
                                  context.goNamedAuth(
                                    'Dashboard_2', // Route name
                                    context.mounted, // Mounted
                                    pathParameters: {
                                      'townZip':
                                          '1000', // Ensure this matches the expected type
                                      'townName':
                                          'ExampleTown', // Ensure this matches the expected type
                                    },
                                  );*/
                                },
                                child: Icon(
                                  Icons.chevron_left_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 24.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 50.0, 0.0, 0.0),
                          child: Stack(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            children: [
                              Align(
                                alignment:
                                    const AlignmentDirectional(0.09, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'DETAILS_PAGE_Image_yatw0pc6_ON_TAP');
                                    logFirebaseEvent('Image_expand_image');
                                    await Navigator.push(
                                      context,
                                      PageTransition(
                                        type: PageTransitionType.fade,
                                        child: FlutterFlowExpandedImageView(
                                          image: Image.network(
                                            detailsPerspektivasRecord
                                                .perspektivaPicture,
                                            fit: BoxFit.contain,
                                            alignment:
                                                const Alignment(0.0, 0.0),
                                          ),
                                          allowRotation: false,
                                          tag: detailsPerspektivasRecord
                                              .perspektivaPicture,
                                          useHeroAnimation: true,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Hero(
                                    tag: detailsPerspektivasRecord!
                                        .perspektivaPicture,
                                    transitionOnUserGestures: true,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.network(
                                        detailsPerspektivasRecord
                                            .perspektivaPicture,
                                        width: 300.0,
                                        height: 300.0,
                                        fit: BoxFit.cover,
                                        alignment: const Alignment(0.0, 0.0),
                                      ),
                                    ),
                                  ),
                                )
                                    .animateOnPageLoad(animationsMap[
                                        'imageOnPageLoadAnimation']!)
                                    .animateOnActionTrigger(
                                        animationsMap[
                                            'imageOnActionTriggerAnimation']!,
                                        hasBeenTriggered: hasImageTriggered),
                              ),
                              if (widget.correctGuessOnBack)
                                const Align(
                                  alignment: AlignmentDirectional(0.09, 0.0),
                                  child: SizedBox(
                                    width: 300.0,
                                    height: 310.0,
                                    child: custom_widgets.ConfettiOverlay(
                                      width: 300.0,
                                      height: 310.0,
                                      loop: true,
                                      particleCount: 30,
                                      gravity: 10.0,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'The objective:',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Manrope',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  Text(
                                    'Be within ',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Manrope',
                                          fontSize: 9.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w200,
                                        ),
                                  ),
                                  RichText(
                                    textScaler:
                                        MediaQuery.of(context).textScaler,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: functions
                                              .getRadiusBasedOnDifficulty(
                                                  detailsPerspektivasRecord
                                                      .difficulty)
                                              .toString(),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Manrope',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 12.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                        const TextSpan(
                                          text: '  meters',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w200,
                                            fontSize: 9.0,
                                          ),
                                        )
                                      ],
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Manrope',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: double.infinity,
                          height: MediaQuery.sizeOf(context).height * 0.32,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0x00090F13), Color(0x991D2429)],
                              stops: [0.0, 0.5],
                              begin: AlignmentDirectional(0.0, -1.0),
                              end: AlignmentDirectional(0, 1.0),
                            ),
                          ),
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        valueOrDefault<String>(
                                          detailsPerspektivasRecord.name,
                                          'null_name',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .displaySmall
                                            .override(
                                              fontFamily: 'Urbanist',
                                              color: Colors.white,
                                              fontSize: 32.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ).animateOnPageLoad(animationsMap[
                                          'textOnPageLoadAnimation1']!),
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(0.0, 12.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          0.0, 8.0, 0.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      RatingBarIndicator(
                                                        itemBuilder:
                                                            (context, index) =>
                                                                Icon(
                                                          Icons.bolt,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondary,
                                                        ),
                                                        direction:
                                                            Axis.horizontal,
                                                        rating:
                                                            detailsPerspektivasRecord
                                                                .difficulty
                                                                .toDouble(),
                                                        unratedColor:
                                                            const Color(
                                                                0x9AFFFFFF),
                                                        itemCount: 5,
                                                        itemSize: 16.0,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(8.0,
                                                                0.0, 0.0, 0.0),
                                                        child: Text(
                                                          valueOrDefault<
                                                              String>(
                                                            detailsPerspektivasRecord
                                                                .difficulty
                                                                .toString(),
                                                            '1',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodySmall
                                                              .override(
                                                                fontFamily:
                                                                    'Manrope',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ).animateOnPageLoad(animationsMap[
                                            'rowOnPageLoadAnimation1']!),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(0.0, 0.0, 0.0, 12.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(0.0,
                                                              8.0, 0.0, 0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          RatingBarIndicator(
                                                            itemBuilder:
                                                                (context,
                                                                        index) =>
                                                                    FaIcon(
                                                              FontAwesomeIcons
                                                                  .mountain,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondary,
                                                            ),
                                                            direction:
                                                                Axis.horizontal,
                                                            rating: detailsPerspektivasRecord
                                                                .difficultyTerrain
                                                                .toDouble(),
                                                            unratedColor:
                                                                const Color(
                                                                    0x9AFFFFFF),
                                                            itemCount: 5,
                                                            itemSize: 16.0,
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                    8.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                            child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                detailsPerspektivasRecord
                                                                    .difficultyTerrain
                                                                    .toString(),
                                                                '1',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodySmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'Manrope',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ).animateOnPageLoad(animationsMap[
                                                'rowOnPageLoadAnimation2']!),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(0.0, 5.0, 0.0, 4.0),
                                        child: Text(
                                          'Description',
                                          style: FlutterFlowTheme.of(context)
                                              .bodySmall
                                              .override(
                                                fontFamily: 'Urbanist',
                                                color: Colors.white,
                                                letterSpacing: 0.0,
                                              ),
                                        ).animateOnPageLoad(animationsMap[
                                            'textOnPageLoadAnimation2']!),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(0.0, 0.0, 0.0, 65.0),
                                        child: Text(
                                          valueOrDefault<String>(
                                            detailsPerspektivasRecord
                                                .description,
                                            'null_desc',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .titleSmall
                                              .override(
                                                fontFamily: 'Manrope',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                letterSpacing: 0.0,
                                              ),
                                        ).animateOnPageLoad(animationsMap[
                                            'textOnPageLoadAnimation3']!),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Align(
                                alignment:
                                    const AlignmentDirectional(0.02, 1.06),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 40.0),
                                  child: FFButtonWidget(
                                    onPressed: widget
                                            .perspektivaIsAlreadyGuessedByUser
                                        ? null
                                        : () async {
                                            logFirebaseEvent(
                                                'DETAILS_I_KNOW_WHERE_THIS_IS_BTN_ON_TAP');
                                            logFirebaseEvent(
                                                'Button_haptic_feedback');
                                            HapticFeedback.selectionClick();
                                            logFirebaseEvent(
                                                'Button_upload_media_to_firebase');
                                            final selectedMedia =
                                                await selectMedia(
                                              multiImage: false,
                                            );
                                            if (selectedMedia != null &&
                                                selectedMedia.every((m) =>
                                                    validateFileFormat(
                                                        m.storagePath,
                                                        context))) {
                                              setState(() => _model
                                                  .isDataUploading = true);
                                              var selectedUploadedFiles =
                                                  <FFUploadedFile>[];

                                              var downloadUrls = <String>[];
                                              try {
                                                selectedUploadedFiles =
                                                    selectedMedia
                                                        .map((m) =>
                                                            FFUploadedFile(
                                                              name: m
                                                                  .storagePath
                                                                  .split('/')
                                                                  .last,
                                                              bytes: m.bytes,
                                                              height: m
                                                                  .dimensions
                                                                  ?.height,
                                                              width: m
                                                                  .dimensions
                                                                  ?.width,
                                                              blurHash:
                                                                  m.blurHash,
                                                            ))
                                                        .toList();

                                                downloadUrls =
                                                    (await Future.wait(
                                                  selectedMedia.map(
                                                    (m) async =>
                                                        await uploadData(
                                                            m.storagePath,
                                                            m.bytes),
                                                  ),
                                                ))
                                                        .where((u) => u != null)
                                                        .map((u) => u!)
                                                        .toList();
                                              } finally {
                                                _model.isDataUploading = false;
                                              }
                                              if (selectedUploadedFiles
                                                          .length ==
                                                      selectedMedia.length &&
                                                  downloadUrls.length ==
                                                      selectedMedia.length) {
                                                setState(() {
                                                  _model.uploadedLocalFile =
                                                      selectedUploadedFiles
                                                          .first;
                                                  _model.uploadedFileUrl =
                                                      downloadUrls.first;
                                                });
                                              } else {
                                                setState(() {});
                                                return;
                                              }
                                            }

                                            logFirebaseEvent(
                                                'Button_navigate_to');

                                            context.pushNamed(
                                              'SubmitGuess_2',
                                              queryParameters: {
                                                'perspektivaGuessURL':
                                                    serializeParam(
                                                  _model.uploadedFileUrl,
                                                  ParamType.String,
                                                ),
                                                'perspektivaLocation':
                                                    serializeParam(
                                                  detailsPerspektivasRecord
                                                      .location,
                                                  ParamType.LatLng,
                                                ),
                                                'perspektivaID': serializeParam(
                                                  detailsPerspektivasRecord
                                                      .perspektivaUuid,
                                                  ParamType.String,
                                                ),
                                                'isCorrectGuess':
                                                    serializeParam(
                                                  false,
                                                  ParamType.bool,
                                                ),
                                                'perspektivaDocRef':
                                                    serializeParam(
                                                  detailsPerspektivasRecord,
                                                  ParamType.Document,
                                                ),
                                                'townZip': serializeParam(
                                                  widget.townZip,
                                                  ParamType.int,
                                                ),
                                                'townName': serializeParam(
                                                  widget.townName,
                                                  ParamType.String,
                                                ),
                                              }.withoutNulls,
                                              extra: <String, dynamic>{
                                                'perspektivaDocRef':
                                                    detailsPerspektivasRecord,
                                              },
                                            );
                                          },
                                    text:
                                        widget.perspektivaIsAlreadyGuessedByUser
                                            ? 'You guessed it!'
                                            : 'I know where this is!',
                                    options: FFButtonOptions(
                                      width: 250.0,
                                      height: 40.0,
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              24.0, 0.0, 24.0, 0.0),
                                      iconPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Manrope',
                                            color: Colors.white,
                                            letterSpacing: 0.0,
                                          ),
                                      elevation: 3.0,
                                      borderSide: const BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                      disabledColor:
                                          FlutterFlowTheme.of(context).tertiary,
                                      hoverColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      hoverBorderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        width: 1.0,
                                      ),
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
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
