import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/perspektivas/everythingfound/everythingfound_widget.dart';
import '/pages/perspektivas/nothingfoundyet/nothingfoundyet_widget.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'dashboard2_model.dart';
export 'dashboard2_model.dart';

class Dashboard2Widget extends StatefulWidget {
  /// A re design
  const Dashboard2Widget({
    super.key,
    required this.townZip,
    required this.townName,
  });

  final int? townZip;
  final String? townName;

  @override
  State<Dashboard2Widget> createState() => _Dashboard2WidgetState();
}

class _Dashboard2WidgetState extends State<Dashboard2Widget>
    with TickerProviderStateMixin {
  late Dashboard2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Dashboard2Model());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Dashboard_2'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('DASHBOARD_2_Dashboard_2_ON_INIT_STATE');
      logFirebaseEvent('Dashboard_2_firestore_query');
      _model.perspektivaGuessesByUser =
          await queryPerspektivaUserGuessRecordOnce(
        queryBuilder: (perspektivaUserGuessRecord) =>
            perspektivaUserGuessRecord.where(
          'user_uid',
          isEqualTo: currentUserUid,
        ),
      );
      logFirebaseEvent('Dashboard_2_firestore_query');
      if (_model.perspektivaGuessesByUser!.isNotEmpty) {
        _model.allGuessedByUserPerTown = await queryPerspektivasRecordOnce(
          queryBuilder: (perspektivasRecord) => perspektivasRecord
              .where(
                'town_zip',
                isEqualTo: widget.townZip,
              )
              .whereIn(
                  'perspektiva_uuid',
                  _model.perspektivaGuessesByUser
                      ?.map((e) => valueOrDefault<String>(
                            e.perspektivaUuid,
                            'a',
                          ))
                      .toList()),
        );
      }
      logFirebaseEvent('Dashboard_2_firestore_query');
      _model.allNotGuessedByUserPerTown = await queryPerspektivasRecordOnce(
        queryBuilder: (perspektivasRecord) => perspektivasRecord
            .where(
              'town_zip',
              isEqualTo: widget.townZip,
            )
            .whereNotIn(
                'perspektiva_uuid',
                _model.perspektivaGuessesByUser
                    ?.map((e) => e.perspektivaUuid)
                    .toList()),
      );
      logFirebaseEvent('Dashboard_2_update_app_state');

      setState(() {});
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
    _model.textFieldFocusNode!.addListener(() => setState(() {}));
    animationsMap.addAll({
      'columnOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            color: const Color(0x80FFFFFF),
            angle: 0.524,
          ),
        ],
      ),
      'containerOnPageLoadAnimation1': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShakeEffect(
            curve: Curves.easeInOut,
            delay: 2000.0.ms,
            duration: 2000.0.ms,
            hz: 3,
            offset: const Offset(0.0, 0.0),
            rotation: 0.017,
          ),
        ],
      ),
      'containerOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          SaturateEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 1250.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });

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

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          title: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hi, perspektiva finder!',
                style: FlutterFlowTheme.of(context).labelSmall.override(
                      fontFamily: 'Manrope',
                      letterSpacing: 0.0,
                    ),
              ),
              Text(
                valueOrDefault<String>(
                  widget.townName,
                  'Town',
                ),
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Urbanist',
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
          actions: [
            Padding(
              padding:
                  const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  context.pushNamed('TownList2');
                },

/*
                onTap: () async {
                  logFirebaseEvent('DASHBOARD_2_PAGE_Icon_k09v0drr_ON_TAP');
                  logFirebaseEvent('Icon_navigate_back');
                  context.safePop();
                },

                */
                child: Icon(
                  Icons.chevron_left,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 24.0,
                ),
              ),
            ),
          ],
          centerTitle: false,
          toolbarHeight: 72.0,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /* TODO: ADD SEARCH IF NECESARY 
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 12.0),
                  child: TextFormField(
                    controller: _model.textController,
                    focusNode: _model.textFieldFocusNode,
                    autofocus: false,
                    textCapitalization: TextCapitalization.sentences,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Search...',
                      labelStyle:
                          FlutterFlowTheme.of(context).labelMedium.override(
                                fontFamily: 'Manrope',
                                letterSpacing: 0.0,
                              ),
                      hintStyle:
                          FlutterFlowTheme.of(context).labelMedium.override(
                                fontFamily: 'Manrope',
                                letterSpacing: 0.0,
                              ),
                      errorStyle:
                          FlutterFlowTheme.of(context).bodyMedium.override(
                                fontFamily: 'Manrope',
                                color: FlutterFlowTheme.of(context).error,
                                fontSize: 12.0,
                                letterSpacing: 0.0,
                              ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).alternate,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).primary,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      filled: true,
                      fillColor: (_model.textFieldFocusNode?.hasFocus ?? false)
                          ? FlutterFlowTheme.of(context).accent1
                          : FlutterFlowTheme.of(context).secondaryBackground,
                      prefixIcon: Icon(
                        Icons.search_rounded,
                        color: (_model.textFieldFocusNode?.hasFocus ?? false)
                            ? FlutterFlowTheme.of(context).primary
                            : FlutterFlowTheme.of(context).secondaryText,
                        size: 24.0,
                      ),
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Manrope',
                          letterSpacing: 0.0,
                        ),
                    cursorColor: FlutterFlowTheme.of(context).primary,
                    validator:
                        _model.textControllerValidator.asValidator(context),
                  ),
                ),
                */
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 8.0),
                  child: Text(
                    'Your Collection',
                    style: FlutterFlowTheme.of(context).bodyLarge.override(
                          fontFamily: 'Manrope',
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
                /* TODO: ADD QUICK FILTER IF NEEDED
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 8.0, 0.0, 8.0),
                        child: FlutterFlowChoiceChips(
                          options: const [
                            ChipData('Filter One'),
                            ChipData('Filter Two'),
                            ChipData('Filter Three'),
                            ChipData('Filter Four')
                          ],
                          onChanged: (val) => setState(
                              () => _model.choiceChipsValue = val?.firstOrNull),
                          selectedChipStyle: ChipStyle(
                            backgroundColor:
                                FlutterFlowTheme.of(context).accent1,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Manrope',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  letterSpacing: 0.0,
                                ),
                            iconColor: FlutterFlowTheme.of(context).primaryText,
                            iconSize: 18.0,
                            elevation: 0.0,
                            borderColor: FlutterFlowTheme.of(context).primary,
                            borderWidth: 2.0,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          unselectedChipStyle: ChipStyle(
                            backgroundColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Manrope',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  letterSpacing: 0.0,
                                ),
                            iconColor:
                                FlutterFlowTheme.of(context).secondaryText,
                            iconSize: 18.0,
                            elevation: 0.0,
                            borderColor: FlutterFlowTheme.of(context).alternate,
                            borderWidth: 1.0,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          chipSpacing: 12.0,
                          rowSpacing: 12.0,
                          multiselect: false,
                          initialized: _model.choiceChipsValue != null,
                          alignment: WrapAlignment.start,
                          controller: _model.choiceChipsValueController ??=
                              FormFieldController<List<String>>(
                            ['Filter One'],
                          ),
                          wrapped: false,
                        ),
                      ),
                      
                    ]
                        .divide(const SizedBox(width: 8.0))
                        .addToStart(const SizedBox(width: 16.0))
                        .addToEnd(const SizedBox(width: 16.0)),
                  ),
                ),
                */
                Container(
                  width: double.infinity,
                  height: 200.0,
                  decoration: const BoxDecoration(),
                  child: Builder(
                    builder: (context) {
                      final allGuessed =
                          _model.allGuessedByUserPerTown?.toList() ?? [];
                      if (allGuessed.isEmpty) {
                        return const NothingfoundyetWidget();
                      }

                      return ListView.separated(
                        padding: const EdgeInsets.fromLTRB(
                          16.0,
                          0,
                          16.0,
                          0,
                        ),
                        primary: false,
                        scrollDirection: Axis.horizontal,
                        itemCount: allGuessed.length,
                        separatorBuilder: (_, __) => const SizedBox(width: 8.0),
                        itemBuilder: (context, allGuessedIndex) {
                          final allGuessedItem = allGuessed[allGuessedIndex];
                          return Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 4.0, 0.0, 12.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed(
                                  'Details',
                                  queryParameters: {
                                    'perspektivaUUID': serializeParam(
                                      allGuessedItem.perspektivaUuid,
                                      ParamType.String,
                                    ),
                                    'perspektivaIsAlreadyGuessedByUser':
                                        serializeParam(
                                      true,
                                      ParamType.bool,
                                    ),
                                    'postBack': serializeParam(
                                      false,
                                      ParamType.bool,
                                    ),
                                    'correctGuessOnBack': serializeParam(
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
                              },
                              child: Container(
                                width: 190.0,
                                height: 100.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    width: 1.0,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                          child: Image.network(
                                            allGuessedItem.perspektivaPicture,
                                            width: 300.0,
                                            height: 100.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(4.0, 0.0, 0.0, 4.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              allGuessedItem.difficulty
                                                  .toString(),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelSmall
                                                      .override(
                                                        fontFamily: 'Manrope',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            Text(
                                              allGuessedItem.name,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily: 'Manrope',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ].divide(const SizedBox(height: 4.0)),
                                        ),
                                      ),
                                    ].divide(const SizedBox(height: 8.0)),
                                  ).animateOnPageLoad(animationsMap[
                                      'columnOnPageLoadAnimation']!),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                Divider(
                  thickness: 1.0,
                  color: FlutterFlowTheme.of(context).accent4,
                ),
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                  child: Text(
                    'Come back when the secret is unlocked!',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Manrope',
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(
                      16.0, 4.0, 16.0, 12.0),
                  child: Container(
                    width: double.infinity,
                    height: 150.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).accent1,
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).primary,
                        width: 2.0,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              flex: 7,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Mistery perspektiva',
                                      style: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .override(
                                            fontFamily: 'Manrope',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    Text(
                                      '',
                                      style: FlutterFlowTheme.of(context)
                                          .headlineMedium
                                          .override(
                                            fontFamily: 'Urbanist',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    Text(
                                      '',
                                      style: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .override(
                                            fontFamily: 'Manrope',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ].divide(const SizedBox(height: 4.0)),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 4,
                              child: ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(0.0),
                                  bottomRight: Radius.circular(6.0),
                                  topLeft: Radius.circular(0.0),
                                  topRight: Radius.circular(6.0),
                                ),
                                child: Image.network(
                                  'https://images.unsplash.com/photo-1543385426-191664295b58?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw3fHxzb3V0aCUyMGFtZXJpY2F8ZW58MHx8fHwxNzA2NjI1NTY3fDA&ixlib=rb-4.0.3&q=80&w=400',
                                  width: 300.0,
                                  height: 200.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwallpaperaccess.com%2Ffull%2F3761912.jpg&f=1&nofb=1&ipt=2c0f6512fbafabc71d43f60c4e001c3edac8b798ff8506a6e9aa704e8e18fed1&ipo=images',
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ).animateOnPageLoad(
                      animationsMap['containerOnPageLoadAnimation1']!),
                ),
                Divider(
                  thickness: 1.0,
                  color: FlutterFlowTheme.of(context).accent4,
                ),
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                  child: Text(
                    'Yet to be found in this town',
                    style: FlutterFlowTheme.of(context).titleMedium.override(
                          fontFamily: 'Manrope',
                          letterSpacing: 0.0,
                        ),
                  ),
                ),

                // This list view is "shrink wrapped" this can affect your app performance, we would suggest limiting the number of items you query in this list view.
                //
                // The list view is shrink wrapped to prevent the page from having two scrollable elements. The parent column is the element that is scrollable and it provides a smooth user experience.
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                  child: Builder(
                    builder: (context) {
                      final allNotGuessed =
                          _model.allNotGuessedByUserPerTown?.toList() ?? [];
                      if (allNotGuessed.isEmpty) {
                        return const Center(
                          child: EverythingfoundWidget(),
                        );
                      }

                      return ListView.separated(
                        padding: const EdgeInsets.fromLTRB(
                          0,
                          0,
                          0,
                          44.0,
                        ),
                        primary: false,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: allNotGuessed.length,
                        separatorBuilder: (_, __) =>
                            const SizedBox(height: 8.0),
                        itemBuilder: (context, allNotGuessedIndex) {
                          final allNotGuessedItem =
                              allNotGuessed[allNotGuessedIndex];
                          return Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 4.0, 16.0, 0.0),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 1.0,
                                ),
                              ),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'DASHBOARD_2_PAGE_Column_icaq4ba8_ON_TAP');
                                  logFirebaseEvent('Column_navigate_to');

                                  context.pushNamed(
                                    'Details',
                                    queryParameters: {
                                      'perspektivaUUID': serializeParam(
                                        allNotGuessedItem.perspektivaUuid,
                                        ParamType.String,
                                      ),
                                      'perspektivaIsAlreadyGuessedByUser':
                                          serializeParam(
                                        false,
                                        ParamType.bool,
                                      ),
                                      'correctGuessOnBack': serializeParam(
                                        false,
                                        ParamType.bool,
                                      ),
                                      'postBack': serializeParam(
                                        false,
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
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(0.0),
                                        bottomRight: Radius.circular(0.0),
                                        topLeft: Radius.circular(8.0),
                                        topRight: Radius.circular(8.0),
                                      ),
                                      child: Image.network(
                                        allNotGuessedItem.perspektivaPicture,
                                        width: double.infinity,
                                        height: 200.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            allNotGuessedItem.difficulty
                                                .toString(),
                                            style: FlutterFlowTheme.of(context)
                                                .labelSmall
                                                .override(
                                                  fontFamily: 'Manrope',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          Text(
                                            allNotGuessedItem.name,
                                            style: FlutterFlowTheme.of(context)
                                                .headlineMedium
                                                .override(
                                                  fontFamily: 'Urbanist',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          Text(
                                            allNotGuessedItem.description
                                                .maybeHandleOverflow(
                                              maxChars: 100,
                                              replacement: '…',
                                            ),
                                            maxLines: 3,
                                            style: FlutterFlowTheme.of(context)
                                                .labelSmall
                                                .override(
                                                  fontFamily: 'Manrope',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ].divide(const SizedBox(height: 4.0)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ).animateOnPageLoad(animationsMap[
                                'containerOnPageLoadAnimation2']!),
                          );
                        },
                      );
                    },
                  ),
                ),
              ].addToEnd(const SizedBox(height: 32.0)),
            ),
          ),
        ),
      ),
    );
  }
}
