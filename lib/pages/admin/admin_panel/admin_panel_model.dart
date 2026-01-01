import '/components/gamification/badges/fitness_hero/fitness_hero_widget.dart';
import '/components/gamification/badges/meditation_guru/meditation_guru_widget.dart';
import '/components/gamification/badges/water_sensei/water_sensei_widget.dart';
import '/components/gamification/earned_badges/earned_badges_widget.dart';
import '/components/gamification/total_streak/total_streak_widget.dart';
import '/components/settings_items/admin_settings_items/add_new_badge/add_new_badge_widget.dart';
import '/components/settings_items/admin_settings_items/app_statics/app_statics_widget.dart';
import '/components/user_management/list_of_users/list_of_users_widget.dart';
import '/components/user_management/online_user/online_user_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'admin_panel_widget.dart' show AdminPanelWidget;
import 'package:flutter/material.dart';

class AdminPanelModel extends FlutterFlowModel<AdminPanelWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for OnlineUser component.
  late OnlineUserModel onlineUserModel;
  // Model for TotalStreak component.
  late TotalStreakModel totalStreakModel;
  // Model for EarnedBadges component.
  late EarnedBadgesModel earnedBadgesModel;
  // Model for AddNewBadge component.
  late AddNewBadgeModel addNewBadgeModel;
  // Model for ListOfUsers component.
  late ListOfUsersModel listOfUsersModel;
  // Model for WaterSensei component.
  late WaterSenseiModel waterSenseiModel;
  // Model for FitnessHero component.
  late FitnessHeroModel fitnessHeroModel;
  // Model for MeditationGuru component.
  late MeditationGuruModel meditationGuruModel;
  // Model for AppStatics component.
  late AppStaticsModel appStaticsModel;

  @override
  void initState(BuildContext context) {
    onlineUserModel = createModel(context, () => OnlineUserModel());
    totalStreakModel = createModel(context, () => TotalStreakModel());
    earnedBadgesModel = createModel(context, () => EarnedBadgesModel());
    addNewBadgeModel = createModel(context, () => AddNewBadgeModel());
    listOfUsersModel = createModel(context, () => ListOfUsersModel());
    waterSenseiModel = createModel(context, () => WaterSenseiModel());
    fitnessHeroModel = createModel(context, () => FitnessHeroModel());
    meditationGuruModel = createModel(context, () => MeditationGuruModel());
    appStaticsModel = createModel(context, () => AppStaticsModel());
  }

  @override
  void dispose() {
    onlineUserModel.dispose();
    totalStreakModel.dispose();
    earnedBadgesModel.dispose();
    addNewBadgeModel.dispose();
    listOfUsersModel.dispose();
    waterSenseiModel.dispose();
    fitnessHeroModel.dispose();
    meditationGuruModel.dispose();
    appStaticsModel.dispose();
  }
}
