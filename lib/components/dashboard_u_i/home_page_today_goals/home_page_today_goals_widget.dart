import '/backend/backend.dart';
import '/components/goal_item_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_page_today_goals_model.dart';
export 'home_page_today_goals_model.dart';

/// Bugunku Hedefler
class HomePageTodayGoalsWidget extends StatefulWidget {
  const HomePageTodayGoalsWidget({
    super.key,
    required this.goalsList,
    this.onGoalCompleted,
  });

  final List<UserGoalsRecord>? goalsList;
  final VoidCallback? onGoalCompleted;

  @override
  State<HomePageTodayGoalsWidget> createState() =>
      _HomePageTodayGoalsWidgetState();
}

class _HomePageTodayGoalsWidgetState extends State<HomePageTodayGoalsWidget> {
  late HomePageTodayGoalsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageTodayGoalsModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return
        // anasayfadaki gunluk hedeflerin gosterildigi alan
        Padding(
      padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
      child: Container(
        decoration: BoxDecoration(),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Bugünkü Hedefler',
                    style: FlutterFlowTheme.of(context).headlineSmall.override(
                          font: GoogleFonts.interTight(
                            fontWeight: FontWeight.w600,
                            fontStyle: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .fontStyle,
                          ),
                          color: FlutterFlowTheme.of(context).primaryText,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                          fontStyle: FlutterFlowTheme.of(context)
                              .headlineSmall
                              .fontStyle,
                        ),
                  ),
                  FlutterFlowIconButton(
                    borderRadius: 14.0,
                    buttonSize: 40.0,
                    fillColor: FlutterFlowTheme.of(context).primary,
                    icon: Icon(
                      Icons.add,
                      color: FlutterFlowTheme.of(context).info,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      context.pushNamed(AddNewGoalPageNewWidget.routeName);
                    },
                  ),
                ].divide(SizedBox(width: 8.0)),
              ),
              Builder(
                builder: (context) {
                  final goalItem = widget.goalsList!.toList();

                  return ListView.separated(
                    padding: EdgeInsets.zero,
                    primary: false,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: goalItem.length,
                    separatorBuilder: (_, __) => SizedBox(height: 10.0),
                    itemBuilder: (context, goalItemIndex) {
                      final goalItemItem = goalItem[goalItemIndex];
                      return wrapWithModel(
                        model: _model.goalItemModels.getModel(
                          goalItemItem.reference.id,
                          goalItemIndex,
                        ),
                        updateCallback: () => safeSetState(() {}),
                        child: GoalItemWidget(
                          key: Key(
                            'Key84z_${goalItemItem.reference.id}',
                          ),
                          goalRecord: goalItemItem,
                          onGoalCompleted: widget.onGoalCompleted,
                        ),
                      );
                    },
                  );
                },
              ),
            ].divide(SizedBox(height: 16.0)),
          ),
        ),
      ),
    );
  }
}
