import '/components/onboarding/ask_step_goal/ask_step_goal_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'step_goal_page_widget.dart' show StepGoalPageWidget;
import 'package:flutter/material.dart';

class StepGoalPageModel extends FlutterFlowModel<StepGoalPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for AskStepGoalWidget component.
  late AskStepGoalModel askStepGoalModel;

  @override
  void initState(BuildContext context) {
    askStepGoalModel = createModel(context, () => AskStepGoalModel());
  }

  @override
  void dispose() {
    askStepGoalModel.dispose();
  }
}
