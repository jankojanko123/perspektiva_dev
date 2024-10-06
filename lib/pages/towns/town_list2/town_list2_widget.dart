import 'package:flutter_animate/flutter_animate.dart';

import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:percent_indicator/percent_indicator.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:flutter/material.dart';
import 'town_list2_model.dart';
export 'town_list2_model.dart';

class TownList2Widget extends StatefulWidget {
  const TownList2Widget({super.key});

  @override
  State<TownList2Widget> createState() => _TownList2WidgetState();
}

class _TownList2WidgetState extends State<TownList2Widget> {
  late TownList2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TownList2Model());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'TownList2'});
    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 36, 16, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Hello,',
                        style: FlutterFlowTheme.of(context).displaySmall.override(
                              fontFamily: 'Urbanist',
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.normal,
                            ),
                      ), /*
                      Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).accent1,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).primary,
                            width: 2,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(2),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent('HEADER02_BUSINESS_SUMMARY_userAvatar_ON_');
                              logFirebaseEvent('userAvatar_drawer');
                              Scaffold.of(context).openDrawer();
                            },
                            child: Container(
                              width: 40,
                              height: 40,
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
                        ),
                      ),*/
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(2, 0, 0, 0),
                        child: Text(
                          currentUserDisplayName,
                          style: FlutterFlowTheme.of(context).displaySmall.override(
                                fontFamily: 'Urbanist',
                                color: FlutterFlowTheme.of(context).secondary,
                                letterSpacing: 0.0,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(1, 1, 1, 0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).secondaryBackground,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 0,
                                color: Color(0xFFE0E3E7),
                                offset: Offset(
                                  0,
                                  1,
                                ),
                              )
                            ],
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(0),
                              bottomRight: Radius.circular(0),
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(24, 24, 24, 0),
                          child: CircularPercentIndicator(
                            percent: 0.05,
                            radius: 100,
                            lineWidth: 20,
                            animation: true,
                            animateFromLastPercent: true,
                            animationDuration: 1000,
                            progressColor: FlutterFlowTheme.of(context).secondary,
                            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
                            center: Animate(
                              effects: [
                                ScaleEffect(
                                  duration: 500.ms,
                                ),
                                ShakeEffect(duration: 700.ms, delay: 600.ms, hz: 3),
                                ShimmerEffect(delay: 600.ms, duration: 1000.ms, color: FlutterFlowTheme.of(context).tertiary)
                              ],
                              child: Text(
                                '5',
                                style: FlutterFlowTheme.of(context).displaySmall.override(
                                      fontFamily: 'Urbanist',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(24, 36, 24, 0),
                        child: Text(
                          'Gotta find them all!',
                          style: FlutterFlowTheme.of(context).bodyLarge.override(
                                fontFamily: 'Manrope',
                                letterSpacing: 0.0,
                              ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(24, 4, 24, 8),
                      ),
                    ],
                  ),
                ),
                StickyHeader(
                  overlapHeaders: false,
                  header: Container(
                    width: double.infinity,
                    height: 0.0,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [FlutterFlowTheme.of(context).secondaryBackground, FlutterFlowTheme.of(context).accent4],
                        stops: const [0.0, 1.0],
                        begin: const AlignmentDirectional(0.0, -1.0),
                        end: const AlignmentDirectional(0, 1.0),
                      ),
                    ),
                  ),
                  content: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                        child: Text(
                          'Recently searched in',
                          style: FlutterFlowTheme.of(context).labelMedium.override(
                                fontFamily: 'Manrope',
                                letterSpacing: 0.0,
                              ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                        child: Container(
                          width: double.infinity,
                          height: 270.0,
                          decoration: const BoxDecoration(),
                          child: StreamBuilder<List<TownsRecord>>(
                            stream: queryTownsRecord(),
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
                              List<TownsRecord> listViewTownsRecordList = snapshot.data!;

                              return ListView.separated(
                                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                scrollDirection: Axis.horizontal,
                                itemCount: listViewTownsRecordList.length,
                                separatorBuilder: (_, __) => const SizedBox(width: 16.0),
                                itemBuilder: (context, listViewIndex) {
                                  final listViewTownsRecord = listViewTownsRecordList[listViewIndex];
                                  return Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent('TOWN_LIST2_Container_91l5vx1o_ON_TAP');
                                        logFirebaseEvent('Container_navigate_to');

                                        context.pushNamed(
                                          'Dashboard_2',
                                          queryParameters: {
                                            'townZip': serializeParam(
                                              listViewTownsRecord.townZip,
                                              ParamType.int,
                                            ),
                                            'townName': serializeParam(
                                              listViewTownsRecord.townName,
                                              ParamType.String,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                      child: Container(
                                        width: 220.0,
                                        height: 100.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                          borderRadius: BorderRadius.circular(12.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context).alternate,
                                            width: 2.0,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: Stack(
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius: BorderRadius.circular(8.0),
                                                      child: Image.network(
                                                        listViewTownsRecord.townPicture,
                                                        width: double.infinity,
                                                        height: double.infinity,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment: const AlignmentDirectional(1.0, -1.0),
                                                      child: Padding(
                                                        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 8.0, 0.0),
                                                        child: ClipRRect(
                                                          borderRadius: BorderRadius.circular(12.0),
                                                          child: BackdropFilter(
                                                            filter: ImageFilter.blur(
                                                              sigmaX: 5.0,
                                                              sigmaY: 2.0,
                                                            ),
                                                            child: Row(
                                                              mainAxisSize: MainAxisSize.min,
                                                              children: [
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                                                                  child: Container(
                                                                    width: 36.0,
                                                                    height: 36.0,
                                                                    decoration: BoxDecoration(
                                                                      color: FlutterFlowTheme.of(context).accent4,
                                                                      borderRadius: BorderRadius.circular(12.0),
                                                                      border: Border.all(
                                                                        color: FlutterFlowTheme.of(context).alternate,
                                                                        width: 2.0,
                                                                      ),
                                                                    ),
                                                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                                                    child: Padding(
                                                                      padding: const EdgeInsets.all(2.0),
                                                                      child: Icon(
                                                                        Icons.favorite_border,
                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                        size: 20.0,
                                                                      ),
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
                                              Padding(
                                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                child: Text(
                                                  listViewTownsRecord.townName,
                                                  style: FlutterFlowTheme.of(context).titleLarge.override(
                                                        fontFamily: 'Manrope',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
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
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 0.0, 12.0),
                              child: Text(
                                'Town List',
                                style: FlutterFlowTheme.of(context).labelMedium.override(
                                      fontFamily: 'Manrope',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 44.0),
                              child: StreamBuilder<List<TownsRecord>>(
                                stream: queryTownsRecord(),
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
                                  List<TownsRecord> listViewTownsRecordList = snapshot.data!;

                                  return ListView.separated(
                                    padding: EdgeInsets.zero,
                                    primary: false,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: listViewTownsRecordList.length,
                                    separatorBuilder: (_, __) => const SizedBox(height: 12.0),
                                    itemBuilder: (context, listViewIndex) {
                                      final listViewTownsRecord = listViewTownsRecordList[listViewIndex];
                                      return Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent('TOWN_LIST2_Container_v04pt3jg_ON_TAP');
                                            logFirebaseEvent('Container_navigate_to');

                                            context.pushNamed(
                                              'Dashboard_2',
                                              queryParameters: {
                                                'townZip': serializeParam(
                                                  listViewTownsRecord.townZip,
                                                  ParamType.int,
                                                ),
                                                'townName': serializeParam(
                                                  listViewTownsRecord.townName,
                                                  ParamType.String,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          child: Container(
                                            width: 220.0,
                                            height: 240.0,
                                            decoration: BoxDecoration(
                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                              boxShadow: const [
                                                BoxShadow(
                                                  blurRadius: 4.0,
                                                  color: Color(0x33000000),
                                                  offset: Offset(
                                                    0.0,
                                                    2.0,
                                                  ),
                                                )
                                              ],
                                              borderRadius: BorderRadius.circular(12.0),
                                              border: Border.all(
                                                color: FlutterFlowTheme.of(context).alternate,
                                                width: 1.0,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Expanded(
                                                    child: Stack(
                                                      children: [
                                                        ClipRRect(
                                                          borderRadius: BorderRadius.circular(8.0),
                                                          child: Image.network(
                                                            listViewTownsRecord.townPicture,
                                                            width: double.infinity,
                                                            height: double.infinity,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment: const AlignmentDirectional(1.0, -1.0),
                                                          child: Padding(
                                                            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 8.0, 0.0),
                                                            child: ClipRRect(
                                                              borderRadius: BorderRadius.circular(12.0),
                                                              child: BackdropFilter(
                                                                filter: ImageFilter.blur(
                                                                  sigmaX: 5.0,
                                                                  sigmaY: 2.0,
                                                                ),
                                                                child: Row(
                                                                  mainAxisSize: MainAxisSize.min,
                                                                  children: [
                                                                    Container(
                                                                      height: 32.0,
                                                                      decoration: BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context).accent4,
                                                                        borderRadius: BorderRadius.circular(12.0),
                                                                        border: Border.all(
                                                                          color: FlutterFlowTheme.of(context).alternate,
                                                                          width: 2.0,
                                                                        ),
                                                                      ),
                                                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                                                      child: Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                        child: FutureBuilder<int>(
                                                                          future: queryPerspektivasRecordCount(
                                                                            queryBuilder: (perspektivasRecord) => perspektivasRecord.where(
                                                                              'town_zip',
                                                                              isEqualTo: listViewTownsRecord.townZip,
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
                                                                                    valueColor: AlwaysStoppedAnimation<Color>(
                                                                                      FlutterFlowTheme.of(context).primary,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            }
                                                                            int textCount = snapshot.data!;

                                                                            return Text(
                                                                              textCount.toString(),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Manrope',
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                            );
                                                                          },
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
                                                  Padding(
                                                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                    child: Text(
                                                      listViewTownsRecord.townName,
                                                      style: FlutterFlowTheme.of(context).titleLarge.override(
                                                            fontFamily: 'Manrope',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisSize: MainAxisSize.max,
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Padding(
                                                        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 8.0),
                                                        child: RichText(
                                                          textScaler: MediaQuery.of(context).textScaler,
                                                          text: TextSpan(
                                                            children: [
                                                              TextSpan(
                                                                text: listViewTownsRecord.townCountry,
                                                                style: const TextStyle(),
                                                              )
                                                            ],
                                                            style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                  fontFamily: 'Manrope',
                                                                  letterSpacing: 0.0,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
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
      ),
    );
  }
}
