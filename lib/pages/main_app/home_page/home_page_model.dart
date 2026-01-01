import '/components/dashboard_u_i/home_page_daily_progress_bar/home_page_daily_progress_bar_widget.dart';
import '/components/dashboard_u_i/home_page_daily_summary/home_page_daily_summary_widget.dart';
import '/components/dashboard_u_i/home_page_greeter/home_page_greeter_widget.dart';
import '/components/dashboard_u_i/home_page_today_goals/home_page_today_goals_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  Local state fields for this page.

  int tamamlananSayisi = 0;

  int kalanSayisi = 0;

  ///  State fields for stateful widgets in this page.

  // Model for HomePageGreeter component.
  late HomePageGreeterModel homePageGreeterModel;
  // Model for HomePageDailyProgressBar component.
  late HomePageDailyProgressBarModel homePageDailyProgressBarModel;
  // Model for HomePageTodayGoals component.
  late HomePageTodayGoalsModel homePageTodayGoalsModel;
  // Model for HomePageDailySummary component.
  late HomePageDailySummaryModel homePageDailySummaryModel;

  @override
  void initState(BuildContext context) {
    homePageGreeterModel = createModel(context, () => HomePageGreeterModel());
    homePageDailyProgressBarModel =
        createModel(context, () => HomePageDailyProgressBarModel());
    homePageTodayGoalsModel =
        createModel(context, () => HomePageTodayGoalsModel());
    homePageDailySummaryModel =
        createModel(context, () => HomePageDailySummaryModel());
  }

  @override
  void dispose() {
    homePageGreeterModel.dispose();
    homePageDailyProgressBarModel.dispose();
    homePageTodayGoalsModel.dispose();
    homePageDailySummaryModel.dispose();
  }
}
