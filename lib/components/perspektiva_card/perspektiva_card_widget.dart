import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'perspektiva_card_model.dart';
export 'perspektiva_card_model.dart';

class PerspektivaCardWidget extends StatefulWidget {
  const PerspektivaCardWidget({
    super.key,
    required this.perspektivaRef,
  });

  final PerspektivasRecord? perspektivaRef;

  @override
  State<PerspektivaCardWidget> createState() => _PerspektivaCardWidgetState();
}

class _PerspektivaCardWidgetState extends State<PerspektivaCardWidget> {
  late PerspektivaCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PerspektivaCardModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('PERSPEKTIVA_CARD_perspektivaCard_ON_INIT');
      logFirebaseEvent('perspektivaCard_custom_action');
      _model.isPerspektivaGuessedByUser =
          await actions.perspektivaIsGuessedByThisUser(
        currentUserUid,
        widget.perspektivaRef?.perspektivaUuid,
      );
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        logFirebaseEvent('PERSPEKTIVA_CARD_Column_7nse8gf3_ON_TAP');
        logFirebaseEvent('Column_haptic_feedback');
        HapticFeedback.lightImpact();
        logFirebaseEvent('Column_navigate_to');

        context.pushNamed(
          'Details',
          queryParameters: {
            'perspektivaUUID': serializeParam(
              valueOrDefault<String>(
                widget.perspektivaRef?.perspektivaUuid,
                '0',
              ),
              ParamType.String,
            ),
            'perspektivaIsAlreadyGuessedByUser': serializeParam(
              _model.isPerspektivaGuessedByUser,
              ParamType.bool,
            ),
            'postBack': serializeParam(
              false,
              ParamType.bool,
            ),
          }.withoutNulls,
        );
      },
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width * 0.48,
            height: 150.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: CachedNetworkImageProvider(
                  valueOrDefault<String>(
                    widget.perspektivaRef?.perspektivaPicture,
                    'empty',
                  ),
                ),
              ),
              borderRadius: BorderRadius.circular(10.0),
              shape: BoxShape.rectangle,
              border: Border.all(
                width: 5.0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(5.0, 10.0, 0.0, 0.0),
            child: Text(
              valueOrDefault<String>(
                widget.perspektivaRef?.name,
                'nulltext',
              ).maybeHandleOverflow(
                maxChars: 36,
                replacement: '…',
              ),
              maxLines: 2,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Manrope',
                    letterSpacing: 0.0,
                  ),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if (widget.perspektivaRef?.hasDifficulty() != null)
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(5.0, 6.0, 0.0, 0.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).accent1,
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(8.0, 6.0, 8.0, 6.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Text(
                              valueOrDefault<String>(
                                widget.perspektivaRef?.difficulty.toString(),
                                '0',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Manrope',
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontSize: 10.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    lineHeight: 1.0,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              if (_model.isPerspektivaGuessedByUser ?? true)
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(70.0, 0.0, 0.0, 0.0),
                  child: Text(
                    'Guessed!',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Manrope',
                          color: FlutterFlowTheme.of(context).secondary,
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
