import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'goal_item_model.dart';
export 'goal_item_model.dart';

class GoalItemWidget extends StatefulWidget {
  GoalItemWidget({
    super.key,
    required this.goalRecord,
    this.onGoalCompleted,
  });

  final UserGoalsRecord? goalRecord;
  final VoidCallback? onGoalCompleted;

  @override
  State<GoalItemWidget> createState() => _GoalItemWidgetState();
}

class _GoalItemWidgetState extends State<GoalItemWidget>
    with TickerProviderStateMixin {
  late GoalItemModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GoalItemModel());

    animationsMap.addAll({
      'containerOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: null,
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Dismissible(
      key: Key(widget.goalRecord!.reference.id),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        color: Colors.red,
        padding: EdgeInsets.only(right: 20.0),
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 30.0,
        ),
      ),
      confirmDismiss: (direction) async {
        return await showDialog<bool>(
              context: context,
              builder: (alertDialogContext) {
                return AlertDialog(
                  title: Text('Uyarı'),
                  content: Text('Bu hedefi silmek istediğine emin misin?'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(alertDialogContext, false),
                      child: Text('İptal'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(alertDialogContext, true),
                      child: Text('Sil'),
                    ),
                  ],
                );
              },
            ) ??
            false;
      },
      onDismissed: (direction) async {
        await widget.goalRecord!.reference.delete();
        safeSetState(() {});
      },
      child: GestureDetector(
        onTap: () async {
          if (widget.goalRecord!.isCompleted) {
            await widget.goalRecord!.reference.update(createUserGoalsRecordData(
              isCompleted: false,
            ));
          } else {
            await HapticFeedback.mediumImpact();

            // --- GOAL STREAK LOGIC ---
            final now = DateTime.now();
            final today = DateTime(now.year, now.month, now.day);

            int currentStreak = widget.goalRecord!.currentStreak; // default 0
            int longestStreak = widget.goalRecord!.longestStreak; // default 0
            DateTime? lastDate = widget.goalRecord!.lastCompletedDate;
            DateTime? lastDateMidnight;
            if (lastDate != null) {
              lastDateMidnight =
                  DateTime(lastDate.year, lastDate.month, lastDate.day);
            }

            // Check difference in days
            if (lastDateMidnight != null) {
              final diff = today.difference(lastDateMidnight).inDays;
              if (diff == 1) {
                // Consecutive day
                currentStreak += 1;
              } else if (diff > 1) {
                // Broken streak
                currentStreak = 1;
              } else {
                // Same day (diff == 0), don't increment, just keep
                // Logic: usually shouldn't happen if isCompleted was false, unless unchecked today and rechecked
                if (currentStreak == 0) currentStreak = 1;
              }
            } else {
              // First time
              currentStreak = 1;
            }

            // Update Longest
            if (currentStreak > longestStreak) {
              longestStreak = currentStreak;
            }

            if (widget.onGoalCompleted != null) {
              widget.onGoalCompleted!();
            }
            await widget.goalRecord!.reference.update(createUserGoalsRecordData(
              isCompleted: true,
              currentStreak: currentStreak,
              longestStreak: longestStreak,
              lastCompletedDate: now,
            ));
          }
          await actions.checkDailyStreak();
        },
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).customGrey,
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(
              color: widget.goalRecord?.isCompleted == true
                  ? FlutterFlowTheme.of(context).secondary
                  : Color(0xFF626262),
              width: 2.0,
            ),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 40.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).customGrey,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Builder(
                    builder: (context) {
                      if (widget.goalRecord?.iconPath != null &&
                          widget.goalRecord!.iconPath.isNotEmpty) {
                        return Container(
                          width: 200.0,
                          height: 200.0,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(
                            widget.goalRecord!.iconPath,
                            fit: BoxFit.cover,
                          ),
                        );
                      } else if (widget.goalRecord?.goalName == 'Su İçme') {
                        return Container(
                          width: 200.0,
                          height: 200.0,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(
                            'assets/images/water.png',
                            fit: BoxFit.cover,
                          ),
                        );
                      } else if (widget.goalRecord?.goalName == 'Egzersiz') {
                        return Container(
                          width: 200.0,
                          height: 200.0,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(
                            'assets/images/training.png',
                            fit: BoxFit.cover,
                          ),
                        );
                      } else if (widget.goalRecord?.goalName == 'Meditasyon') {
                        return Container(
                          width: 200.0,
                          height: 200.0,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(
                            'assets/images/meditation.png',
                            fit: BoxFit.cover,
                          ),
                        );
                      } else if (widget.goalRecord?.goalName == 'Kitap Okuma') {
                        return Container(
                          width: 200.0,
                          height: 200.0,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(
                            'assets/images/stack-of-books.png',
                            fit: BoxFit.cover,
                          ),
                        );
                      } else if (widget.goalRecord?.goalName == 'Uyku') {
                        return Container(
                          width: 200.0,
                          height: 200.0,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(
                            'assets/images/sleeping.png',
                            fit: BoxFit.cover,
                          ),
                        );
                      } else {
                        return Icon(
                          Icons
                              .star, // Changed default fallback to Star if no icon
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24.0,
                        );
                      }
                    },
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        valueOrDefault<String>(
                          widget.goalRecord?.goalName,
                          'goalName',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.inter(
                                fontWeight: FontWeight.w500,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                      ),
                      Text(
                        '${widget.goalRecord?.goalAmount.toString()} ${widget.goalRecord?.goalUnitMeasurement} / gün',
                        style: FlutterFlowTheme.of(context).labelSmall.override(
                              font: GoogleFonts.inter(
                                fontWeight: FontWeight
                                    .w500, // Replaced explicit theme weight access with constant as it was causing issues or to simplify
                                fontStyle: FlutterFlowTheme.of(context)
                                    .labelSmall
                                    .fontStyle,
                              ),
                              color: FlutterFlowTheme.of(context).secondaryText,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .labelSmall
                                  .fontStyle,
                            ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 24.0,
                  height: 24.0,
                  decoration: BoxDecoration(
                    color: widget.goalRecord?.isCompleted == true
                        ? FlutterFlowTheme.of(context).secondary
                        : FlutterFlowTheme.of(context).secondaryBackground,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Color(0xFF626262),
                      width: 1.0,
                    ),
                  ),
                  child: Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Icon(
                      Icons.check,
                      color: FlutterFlowTheme.of(context).customGrey,
                      size: 16.0,
                    ),
                  ),
                ),
              ].divide(SizedBox(width: 12.0)),
            ),
          ),
        ),
      ),
    );
  }
}
