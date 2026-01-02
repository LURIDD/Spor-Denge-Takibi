import '/flutter_flow/flutter_flow_util.dart';
import 'ask_step_goal_widget.dart' show AskStepGoalWidget;
import 'package:flutter/material.dart';

class AskStepGoalModel extends FlutterFlowModel<AskStepGoalWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
