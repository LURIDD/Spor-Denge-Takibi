import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/dashboard_u_i/home_page_daily_progress_bar/home_page_daily_progress_bar_widget.dart';
import '/components/dashboard_u_i/home_page_daily_summary/home_page_daily_summary_widget.dart';
import '/components/dashboard_u_i/home_page_greeter/home_page_greeter_widget.dart';
import '/components/dashboard_u_i/home_page_today_goals/home_page_today_goals_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

/// Ana Sayfa
class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  static String routeName = 'HomePage';
  static String routePath = '/homePage';

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if ((currentUserDocument?.lastResetDate != null) &&
          (currentUserDocument?.lastResetDate == getCurrentTimestamp)) {
        await actions.checkDailyStreak();
      }
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<UserGoalsRecord>>(
      stream: queryUserGoalsRecord(
        parent: currentUserReference,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<UserGoalsRecord> homePageUserGoalsRecordList = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: PopScope(
            canPop: false,
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              body: SafeArea(
                top: true,
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 100.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 10.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Kullaniciyi karsilayan ana baslik metni
                              AuthUserStreamWidget(
                                builder: (context) => Text(
                                  'Hazır mısın, ${currentUserDisplayName} ?',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .override(
                                        font: GoogleFonts.interTight(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .headlineMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .headlineMedium
                                                  .fontStyle,
                                        ),
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .headlineMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .headlineMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),

                              // Kullaniciyi motive eden alt bilgi veya aciklama metni
                              Text(
                                'Bugün de hedeflerine odaklan 🎯',
                                style: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontStyle,
                                      ),
                                      fontSize: 15.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontStyle,
                                    ),
                              ),
                            ].divide(SizedBox(height: 8.0)),
                          ),
                        ),
                        wrapWithModel(
                          model: _model.homePageGreeterModel,
                          updateCallback: () => safeSetState(() {}),
                          child: HomePageGreeterWidget(),
                        ),

                        // Gunluk ilerleme durumunu gosteren progress bar bilesenini modele baglayarak cagiriyoruz
                        wrapWithModel(
                          model: _model.homePageDailyProgressBarModel,
                          updateCallback: () => safeSetState(() {}),
                          child: HomePageDailyProgressBarWidget(),
                        ),

                        // Kullanicinin gunluk hedeflerini listeleyen bileseni (Widget) sayfaya dahil ediyoruz
                        wrapWithModel(
                          model: _model.homePageTodayGoalsModel,
                          updateCallback: () => safeSetState(() {}),
                          child: HomePageTodayGoalsWidget(
                            goalsList: homePageUserGoalsRecordList,
                          ),
                        ),

                        // Kullanicinin gun icindeki aktivitelerinin ozetini gösteren bileseni (Widget) yukluyoruz
                        wrapWithModel(
                          model: _model.homePageDailySummaryModel,
                          updateCallback: () => safeSetState(() {}),
                          child: HomePageDailySummaryWidget(
                            tamamlananAdet: homePageUserGoalsRecordList
                                .where((e) => e.isCompleted == true)
                                .toList()
                                .length,
                            kalanAdet: homePageUserGoalsRecordList
                                .where((e) => !e.isCompleted)
                                .toList()
                                .length,
                          ),
                        ),
                      ]
                          .divide(SizedBox(height: 16.0))
                          .addToEnd(SizedBox(height: 16.0)),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
