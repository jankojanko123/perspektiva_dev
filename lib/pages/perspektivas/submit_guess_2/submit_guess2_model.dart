import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'submit_guess2_widget.dart' show SubmitGuess2Widget;
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart' as latlong2;

class SubmitGuess2Model extends FlutterFlowModel<SubmitGuess2Widget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - comparePhotos] action in SubmitGuess_2 widget.
  double? photoCompareResult;
  // State field(s) for GoogleMap widget.
  latlong2.LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // Stores action output result for [Custom Action - comparePhotos] action in Button widget.
  double? photoCompareResultCopy;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
