import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
//import '/flutter_flow/flutter_flow_google_map.dart' hide LatLng;
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart' hide LatLng;
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'package:provider/provider.dart';
import 'submit_guess2_model.dart';
export 'submit_guess2_model.dart';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:perspektiva/osm/open_street_map.dart';
import 'package:latlong2/latlong.dart' as latlong2;

class SubmitGuess2Widget extends StatefulWidget {
  const SubmitGuess2Widget({
    super.key,
    required this.perspektivaGuessURL,
    required this.perspektivaLocation,
    required this.perspektivaID,
    bool? isCorrectGuess,
    required this.perspektivaDocRef,
    required this.onMarkerLocationChanged,
    required this.townZip,
    required this.townName,
  }) : isCorrectGuess = isCorrectGuess ?? false;

  final String? perspektivaGuessURL;
  final latlong2.LatLng? perspektivaLocation;
  final String? perspektivaID;
  final bool isCorrectGuess;
  final int? townZip;
  final String? townName;
  final PerspektivasRecord? perspektivaDocRef;
  final void Function(latlong2.LatLng newLocation) onMarkerLocationChanged;

  @override
  State<SubmitGuess2Widget> createState() => _SubmitGuess2WidgetState();
}

class _SubmitGuess2WidgetState extends State<SubmitGuess2Widget> with TickerProviderStateMixin {
  late SubmitGuess2Model _model;

  latlong2.LatLng? markerLocation;

  void updateMarkerLocation(latlong2.LatLng newLocation) {
    setState(() {
      markerLocation = newLocation;
    });
  }

  @override
  final scaffoldKey = GlobalKey<ScaffoldState>();
  latlong2.LatLng currentUserLocationValue = latlong2.LatLng(0.0, 0.0);

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SubmitGuess2Model());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'SubmitGuess_2'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      currentUserLocationValue = await getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0));

      HapticFeedback.vibrate();

      if (functions.isPointInsideCircel(widget.perspektivaLocation!, FFAppState().LatLngList.first,
          functions.calculateRadius(widget.perspektivaDocRef!.difficulty, widget.perspektivaDocRef!.difficultyTerrain, true))) {
        _model.photoCompareResult =
            50; /*  await actions.comparePhotos( ---- TODO: Add a photo AI comparer!
          widget.perspektivaDocRef!.perspektivaPicture,
          widget.perspektivaGuessURL!,
        );*/
      } else {
        context.pushNamed(
          'Details',
          queryParameters: {
            'perspektivaUUID': serializeParam(
              widget.perspektivaID,
              ParamType.String,
            ),
            'correctGuessOnBack': serializeParam(
              widget.isCorrectGuess,
              ParamType.bool,
            ),
            'perspektivaIsAlreadyGuessedByUser': serializeParam(
              false,
              ParamType.bool,
            ),
            'postBack': serializeParam(
              true,
              ParamType.bool,
            ),
          }.withoutNulls,
        );

        return;
      }

      // CorrectGuessAdd

      await GuessRecord.collection.doc().set(createGuessRecordData(
            guessPicture: widget.perspektivaGuessURL,
            uid: currentUserUid,
            location: FFAppState().LatLngList.first,
            perspektivaId: widget.perspektivaID,
          ));
      // CorrectPerspektivaUserGuess

      await PerspektivaUserGuessRecord.collection.doc().set(createPerspektivaUserGuessRecordData(
            perspektivaUuid: widget.perspektivaID,
            userUid: currentUserUid,
            isCorrect: true,
            created: getCurrentTimestamp,
            guessId: '0',
          ));

      context.pushNamed(
        'Details',
        queryParameters: {
          'perspektivaUUID': serializeParam(
            widget.perspektivaID,
            ParamType.String,
          ),
          'correctGuessOnBack': serializeParam(
            true,
            ParamType.bool,
          ),
          'perspektivaIsAlreadyGuessedByUser': serializeParam(
            true,
            ParamType.bool,
          ),
          'postBack': serializeParam(
            true,
            ParamType.bool,
          ),
        }.withoutNulls,
      );
    });

    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true).then((loc) => setState(() => currentUserLocationValue = loc));
    animationsMap.addAll({
      'iconButtonOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ShakeEffect(
            curve: Curves.easeInOut,
            delay: 260.0.ms,
            duration: 2000.0.ms,
            hz: 2,
            offset: const Offset(10.000000000000014, 0.0),
            rotation: 0.524,
          ),
        ],
      ),
    });

    setupAnimations(
      animationsMap.values.where((anim) => anim.trigger == AnimationTrigger.onActionTrigger || !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    if (currentUserLocationValue == null) {
      return Container(
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: Center(
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

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        resizeToAvoidBottomInset: false,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          title: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Okay here we go!',
                style: FlutterFlowTheme.of(context).labelSmall.override(
                      fontFamily: 'Manrope',
                      letterSpacing: 0.0,
                    ),
              ),
              Text(
                'Select the precise location',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Urbanist',
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                  shadows: [
                    const Shadow(
                      color: Color(0xFF7E00FF),
                      offset: Offset(3.0, 3.0),
                      blurRadius: 2.0,
                    ),
                    const Shadow(
                      color: Color(0xFF0046FF),
                      offset: Offset(2.0, 2.0),
                      blurRadius: 2.0,
                    )
                  ],
                ),
              ),
            ].divide(const SizedBox(height: 4.0)),
          ),
          /*actions: [
            Padding(
              padding:
                  const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.safePop();
                },
                child: Icon(
                  Icons.chevron_left,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 24.0,
                ),
              ),
            ),
          ],
          */
          centerTitle: false,
          toolbarHeight: 72.0,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    child: Stack(
                      children: [
                        Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: MediaQuery.sizeOf(context).height * 0.75,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).secondaryBackground,
                          ),
                          child: Stack(
                            children: [
                              if (currentUserLocationValue.latitude != 0 && currentUserLocationValue.longitude != 0)
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20.0),
                                    child: OSMMap(
                                      initialLocation: currentUserLocationValue,
                                      perspektivaLocation: widget.perspektivaDocRef?.location,
                                      difficulty: widget.perspektivaDocRef?.difficulty,
                                      terrain_difficulty: widget.perspektivaDocRef?.difficultyTerrain,
                                      latlongMarkerList: FFAppState().LatLngList,
                                      onLocationChanged: (latlong2.LatLng newLocation) {
                                        setState(() {
                                          updateMarkerLocation(newLocation);
                                          //FFAppState().LatLngList = [newLocation];
                                        }); /*TODO: STUCK ON THIS add marker*/
                                      },

                                      /*
                                    markers:
                                        FFAppState().LatLngList.map((marker) {
                                      return OSMMarker(
                                        id: marker.serialize(),
                                        position: marker,
                                      );
                                    }).toList(),
                                    onLocationChanged: (latLng) {
                                      setState(() {
                                        _model.googleMapsCenter = latLng;
                                      });
                                    },
                                    showZoomControls:
                                        true, // Adjust based on your design requirements
                                    // Additional OSM map options can be set here
                                    */
                                    ),
                                  ),
                                ),
/*
GOOGLE MAPS --->
Align( 
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: FlutterFlowGoogleMap(
                                  controller: _model.googleMapsController,
                                  onCameraIdle: (latLng) => setState(
                                      () => _model.googleMapsCenter = latLng),
                                  initialLocation: _model.googleMapsCenter ??=
                                      currentUserLocationValue!,
                                  markers: FFAppState()
                                      .LatLngList
                                      .map(
                                        (marker) => FlutterFlowMarker(
                                          marker.serialize(),
                                          marker,
                                        ),
                                      )
                                      .toList(),
                                  markerColor: GoogleMarkerColor.orange,
                                  mapType: MapType.normal,
                                  style: GoogleMapStyle.aubergine,
                                  initialZoom: 16.0,
                                  allowInteraction: true,
                                  allowZoom: true,
                                  showZoomControls: false,
                                  showLocation: true,
                                  showCompass: false,
                                  showMapToolbar: false,
                                  showTraffic: false,
                                  centerMapOnMarkerTap: true,
                                  circles: {
                                    DrawCircle(),
                                  },
                                ),
                              ),

GOOGLE MAPS --->
*/

                              Align(
                                alignment: const AlignmentDirectional(0.0, -0.05),
                                child: PointerInterceptor(
                                  intercepting: isWeb,
                                  child: const Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 3.0),
                                  ),
                                ),
                              ),
                              if (FFAppState().LatLngList.length <= 5)
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 0.9),
                                  child: PointerInterceptor(
                                    intercepting: isWeb,
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          FlutterFlowIconButton(
                                            borderColor: FlutterFlowTheme.of(context).primaryBackground,
                                            borderRadius: 50.0,
                                            borderWidth: 5.0,
                                            buttonSize: 50.0,
                                            fillColor: FlutterFlowTheme.of(context).primary,
                                            icon: Icon(
                                              Icons.add_location_sharp,
                                              color: FlutterFlowTheme.of(context).info,
                                              size: 30.0,
                                            ),
                                            showLoadingIndicator: false,

                                            /*add BUTTON*/
                                            onPressed: () async {
                                              FFAppState().LatLngList = [];

                                              setState(() {});

                                              FFAppState().addToLatLngList(markerLocation!);

                                              /*else {OLD LOGIC - if the marker was outside the submit button would move a litle
                                                
                                                print('OUTSIDE');

                                                // Display the alert message
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'You can only add a guess if inside the circle',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Manrope',
                                                                color: const Color
                                                                    .fromARGB(
                                                                    255,
                                                                    255,
                                                                    255,
                                                                    255),
                                                              ),
                                                    ),
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    duration: const Duration(
                                                        seconds: 2),
                                                  ),
                                                );

                                                await animationsMap[
                                                        'iconButtonOnActionTriggerAnimation']!
                                                    .controller
                                                    .forward(from: 0.0);
                                              }
                                              */
                                              setState(() {});
                                            },
                                          ).animateOnActionTrigger(
                                            animationsMap['iconButtonOnActionTriggerAnimation']!,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [],
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                            child: Container(
                              decoration: const BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 7.0,
                                    color: Color(0xAB000000),
                                    offset: Offset(
                                      3.0,
                                      0.0,
                                    ),
                                    spreadRadius: 5.0,
                                  )
                                ],
                              ),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  await Navigator.push(
                                    context,
                                    PageTransition(
                                      type: PageTransitionType.fade,
                                      child: FlutterFlowExpandedImageView(
                                        image: Image.network(
                                          widget.perspektivaGuessURL!,
                                          fit: BoxFit.contain,
                                        ),
                                        allowRotation: false,
                                        tag: widget.perspektivaGuessURL!,
                                        useHeroAnimation: true,
                                      ),
                                    ),
                                  );
                                },
                                child: Hero(
                                  tag: widget.perspektivaGuessURL!,
                                  transitionOnUserGestures: true,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.network(
                                      widget.perspektivaGuessURL!,
                                      width: 300.0,
                                      height: 169.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
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
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(0.0, 1.0),
                      child: Animate(
                        effects: [
                          ShimmerEffect(
                            duration: FFAppState().LatLngList.isNotEmpty ? 1000.ms : 0.ms,
                          ),
                          ShakeEffect(
                            duration: FFAppState().LatLngList.isNotEmpty ? 1000.ms : 0.ms,
                            hz: FFAppState().LatLngList.isNotEmpty ? 3 : 0,
                          )
                        ],
                        child: FFButtonWidget(
                          onPressed: () async {
                            if (FFAppState().LatLngList.isNotEmpty) {
                              var shouldSetState = false;

                              //HapticFeedback.vibrate();
                              /*TODO: add animations
                              if (FFAppState().LatLngList.isEmpty) {
                                
                                if (animationsMap[
                                        'iconButtonOnActionTriggerAnimation'] !=
                                    null) {
                                  await animationsMap[
                                          'iconButtonOnActionTriggerAnimation']!
                                      .controller
                                      .forward(from: 0.0);
                                }
                                if (shouldSetState) setState(() {});
                                return;
                              }
                        */

                              if (functions.isPointInsideCircel(
                                  widget.perspektivaDocRef?.location,
                                  FFAppState().LatLngList.first,
                                  functions.calculateRadius(
                                      widget.perspektivaDocRef!.difficulty, widget.perspektivaDocRef!.difficultyTerrain, false))) {
                                /* logFirebaseEvent('Button_custom_action');
                                _model.photoCompareResultCopy =
                                    await actions.comparePhotos(
                                  widget.perspektivaDocRef!.perspektivaPicture,
                                  widget.perspektivaGuessURL!,
                                );*/

                                shouldSetState = true;
                              } else {
                                FFAppState().LatLngList = [];
                                setState(() {});

                                context.pushNamed(
                                  'Details',
                                  queryParameters: {
                                    'perspektivaUUID': serializeParam(
                                      widget.perspektivaID,
                                      ParamType.String,
                                    ),
                                    'correctGuessOnBack': serializeParam(
                                      widget.isCorrectGuess,
                                      ParamType.bool,
                                    ),
                                    'perspektivaIsAlreadyGuessedByUser': serializeParam(
                                      false,
                                      ParamType.bool,
                                    ),
                                    'postBack': serializeParam(
                                      true,
                                      ParamType.bool,
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
                                );

                                if (shouldSetState) setState(() {});
                                return;
                              }

                              // CorrectGuessAdd

                              await GuessRecord.collection.doc().set(createGuessRecordData(
                                    guessPicture: widget.perspektivaGuessURL,
                                    uid: currentUserUid,
                                    location: FFAppState().LatLngList.first,
                                    perspektivaId: widget.perspektivaID,
                                  ));
                              // CorrectPerspektivaUserGuess

                              await PerspektivaUserGuessRecord.collection.doc().set(createPerspektivaUserGuessRecordData(
                                    perspektivaUuid: widget.perspektivaID,
                                    userUid: currentUserUid,
                                    isCorrect: true,
                                    created: getCurrentTimestamp,
                                    guessId: '0',
                                  ));

                              FFAppState().LatLngList = [];
                              setState(() {});

                              context.pushNamed(
                                'Details',
                                queryParameters: {
                                  'perspektivaUUID': serializeParam(
                                    widget.perspektivaID,
                                    ParamType.String,
                                  ),
                                  'correctGuessOnBack': serializeParam(
                                    true,
                                    ParamType.bool,
                                  ),
                                  'perspektivaIsAlreadyGuessedByUser': serializeParam(
                                    true,
                                    ParamType.bool,
                                  ),
                                  'postBack': serializeParam(
                                    true,
                                    ParamType.bool,
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
                              );

                              if (shouldSetState) setState(() {});
                            }
                          },
                          text: 'Submit',
                          options: FFButtonOptions(
                            width: 130.0,
                            height: 40.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                            color: valueOrDefault<Color>(
                              FFAppState().LatLngList.isNotEmpty
                                  ? FlutterFlowTheme.of(context).secondary
                                  : FlutterFlowTheme.of(context).secondaryText,
                              FlutterFlowTheme.of(context).primary,
                            ),
                            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Manrope',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 2.0,
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
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
    );
  }

  Text alertBox(BuildContext context) {
    return Text(
      'GAYa!',
      style: FlutterFlowTheme.of(context).labelSmall.override(
            fontFamily: 'Manrope',
            letterSpacing: 0.0,
          ),
    );
  }
}
