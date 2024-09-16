import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'backtoprow_model.dart';
export 'backtoprow_model.dart';

class BacktoprowWidget extends StatefulWidget {
  const BacktoprowWidget({super.key});

  @override
  State<BacktoprowWidget> createState() => _BacktoprowWidgetState();
}

class _BacktoprowWidgetState extends State<BacktoprowWidget> {
  late BacktoprowModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BacktoprowModel());

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
        logFirebaseEvent('BACKTOPROW_COMP_Row_g3jsahik_ON_TAP');
        logFirebaseEvent('Row_navigate_back');
        context.safePop();
      },
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 0.0, 0.0),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                logFirebaseEvent('BACKTOPROW_COMP_Icon_w40gzyuq_ON_TAP');
                logFirebaseEvent('Icon_navigate_back');
                context.safePop();
              },
              child: Icon(
                Icons.chevron_left,
                color: FlutterFlowTheme.of(context).secondaryText,
                size: 40.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
