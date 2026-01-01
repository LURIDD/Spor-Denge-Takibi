import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'add_new_goal_page_new_widget.dart' show AddNewGoalPageNewWidget;
import 'package:flutter/material.dart';

class AddNewGoalPageNewModel extends FlutterFlowModel<AddNewGoalPageNewWidget> {
  ///  Local state fields for this page.

  String? selectedGoalType;

  String? selectedGoalUnitMsr;

  ///  State fields for stateful widgets in this page.

  // State field(s) for HedefMiktariText widget.
  FocusNode? hedefMiktariTextFocusNode;
  TextEditingController? hedefMiktariTextTextController;
  String? Function(BuildContext, String?)?
      hedefMiktariTextTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    hedefMiktariTextFocusNode?.dispose();
    hedefMiktariTextTextController?.dispose();
  }
}
