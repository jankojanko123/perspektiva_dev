import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dashboard2_widget.dart' show Dashboard2Widget;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class Dashboard2Model extends FlutterFlowModel<Dashboard2Widget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in Dashboard_2 widget.
  List<PerspektivaUserGuessRecord>? perspektivaGuessesByUser;
  // Stores action output result for [Firestore Query - Query a collection] action in Dashboard_2 widget.
  List<PerspektivasRecord>? allGuessedByUserPerTown;
  // Stores action output result for [Firestore Query - Query a collection] action in Dashboard_2 widget.
  List<PerspektivasRecord>? allNotGuessedByUserPerTown;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
