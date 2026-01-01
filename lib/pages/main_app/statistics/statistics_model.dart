import '/components/stats_charts/achievement_badges/achievement_badges_widget.dart';
import '/components/stats_charts/streak_history/streak_history_widget.dart';
import '/components/stats_charts/weekly_summary/weekly_summary_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'statistics_widget.dart' show StatisticsWidget;
import 'package:flutter/material.dart';

class StatisticsModel extends FlutterFlowModel<StatisticsWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for WeeklySummary component.
  late WeeklySummaryModel weeklySummaryModel;
  // Model for StreakHistory component.
  late StreakHistoryModel streakHistoryModel;
  // Model for AchievementBadges component.
  late AchievementBadgesModel achievementBadgesModel;

  @override
  void initState(BuildContext context) {
    weeklySummaryModel = createModel(context, () => WeeklySummaryModel());
    streakHistoryModel = createModel(context, () => StreakHistoryModel());
    achievementBadgesModel =
        createModel(context, () => AchievementBadgesModel());
  }

  @override
  void dispose() {
    weeklySummaryModel.dispose();
    streakHistoryModel.dispose();
    achievementBadgesModel.dispose();
  }
}
