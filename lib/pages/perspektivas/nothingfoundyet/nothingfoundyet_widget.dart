import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'nothingfoundyet_model.dart';
export 'nothingfoundyet_model.dart';

class NothingfoundyetWidget extends StatefulWidget {
  const NothingfoundyetWidget({super.key});

  @override
  State<NothingfoundyetWidget> createState() => _NothingfoundyetWidgetState();
}

class _NothingfoundyetWidgetState extends State<NothingfoundyetWidget> {
  late NothingfoundyetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NothingfoundyetModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Container(
        width: 370.0,
        height: 108.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
              child: Text(
                'Its a bit empty here...',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Urbanist',
                      letterSpacing: 0.0,
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(5.0, 4.0, 5.0, 0.0),
              child: Text(
                'It seems that you don\'t have any found perspektivas for this town yet. Give it a try!',
                style: FlutterFlowTheme.of(context).labelMedium.override(
                      fontFamily: 'Manrope',
                      letterSpacing: 0.0,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
