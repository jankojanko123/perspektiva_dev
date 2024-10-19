import 'package:perspektiva/backend/schema/perspektiva_user_guess_record.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'town_list2_widget.dart' show TownList2Widget;
import 'package:flutter/material.dart';

class TownList2Model extends FlutterFlowModel<TownList2Widget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<PerspektivaUserGuessRecord>? perspektivaGuessesByUser;
  int? perspektivasGuessesByUserLenght;
  LatLng? currentUserLocationValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
