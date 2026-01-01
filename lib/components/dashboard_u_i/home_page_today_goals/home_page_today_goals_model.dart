import '/components/goal_item_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'home_page_today_goals_widget.dart' show HomePageTodayGoalsWidget;
import 'package:flutter/material.dart';

class HomePageTodayGoalsModel
    extends FlutterFlowModel<HomePageTodayGoalsWidget> {
  ///  Local state fields for this component.

  double offsetX = 0.0;

  ///  State fields for stateful widgets in this component.

  // Models for goalItem dynamic component.
  late FlutterFlowDynamicModels<GoalItemModel> goalItemModels;

  @override
  void initState(BuildContext context) {
    goalItemModels = FlutterFlowDynamicModels(() => GoalItemModel());
  }

  @override
  void dispose() {
    goalItemModels.dispose();
  }
}
