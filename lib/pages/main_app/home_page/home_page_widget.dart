import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/dashboard_u_i/home_page_daily_progress_bar/home_page_daily_progress_bar_widget.dart';
import '/components/dashboard_u_i/home_page_daily_summary/home_page_daily_summary_widget.dart';
import '/components/dashboard_u_i/home_page_greeter/home_page_greeter_widget.dart';
import '/components/dashboard_u_i/home_page_today_goals/home_page_today_goals_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter/services.dart';
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
  // Konfeti efektini kontrol etmek için kullanılan controller.
  final ConfettiController _confettiController =
      ConfettiController(duration: const Duration(seconds: 3));

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    // Sayfa yüklendiğinde çalışacak eylem.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.checkDailyStreak();
    });
  }

  @override
  void dispose() {
    _model.dispose();
    _confettiController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Kullanıcının hedeflerini (UserGoals) veritabanından stream olarak dinliyoruz.
    return StreamBuilder<List<UserGoalsRecord>>(
      stream: queryUserGoalsRecord(
        parent: currentUserReference,
      ),
      builder: (context, snapshot) {
        // Widget yüklenirken görünümünü özelleştirin.
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

        // Klavyeyi kapatmak için ekranın boş bir yerine tıklanmasını sağlayan yapı.
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: PopScope(
            canPop: false,
            onPopInvokedWithResult: (bool didPop, dynamic result) async {
              if (didPop) {
                return;
              }
              final now = DateTime.now();
              if (_model.lastBackPressedTime == null ||
                  now.difference(_model.lastBackPressedTime!) >
                      const Duration(seconds: 2)) {
                _model.lastBackPressedTime = now;
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Çıkmak için tekrar dokunun'),
                    duration: Duration(seconds: 2),
                  ),
                );
              } else {
                SystemNavigator.pop();
              }
            },
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              body: Stack(
                children: [
                  SafeArea(
                    top: true,
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
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
                                  // Kullanıcıyı karşılayan ana başlık metni
                                  // Kullanıcıyı karşılayan ana başlık metni
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      AuthUserStreamWidget(
                                        builder: (context) => Text(
                                          'Hazır mısın, ${currentUserDisplayName} ?',
                                          style: FlutterFlowTheme.of(context)
                                              .headlineMedium
                                              .override(
                                                font: GoogleFonts.interTight(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .headlineMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .headlineMedium
                                                          .fontStyle,
                                                ),
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () async {
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            context: context,
                                            builder: (context) {
                                              return Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(20),
                                                    topRight:
                                                        Radius.circular(20),
                                                  ),
                                                ),
                                                padding: EdgeInsets.all(20),
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.6,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Bildirimler',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineSmall,
                                                    ),
                                                    Divider(),
                                                    Expanded(
                                                      child: StreamBuilder<
                                                          List<
                                                              NotificationsRecord>>(
                                                        stream:
                                                            queryNotificationsRecord(
                                                          queryBuilder: (notificationsRecord) =>
                                                              notificationsRecord
                                                                  .where(
                                                                      'user_ref',
                                                                      isEqualTo:
                                                                          currentUserReference),
                                                        ),
                                                        builder: (context,
                                                            snapshot) {
                                                          if (snapshot
                                                              .hasError) {
                                                            return Center(
                                                                child: Text(
                                                                    'Hata oluştu.'));
                                                          }
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                                child:
                                                                    CircularProgressIndicator());
                                                          }
                                                          final notifications =
                                                              snapshot.data!;
                                                          notifications.sort((a,
                                                                  b) =>
                                                              (b.createdTime ??
                                                                      DateTime(
                                                                          0))
                                                                  .compareTo(a
                                                                          .createdTime ??
                                                                      DateTime(
                                                                          0)));

                                                          if (notifications
                                                              .isEmpty) {
                                                            return Center(
                                                                child: Text(
                                                                    'Bildiriminiz yok.'));
                                                          }
                                                          return ListView
                                                              .separated(
                                                            itemCount:
                                                                notifications
                                                                    .length,
                                                            separatorBuilder:
                                                                (_, __) =>
                                                                    Divider(),
                                                            itemBuilder:
                                                                (context,
                                                                    index) {
                                                              final notification =
                                                                  notifications[
                                                                      index];
                                                              return ListTile(
                                                                title: Text(
                                                                    notification
                                                                        .title,
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.bold)),
                                                                subtitle: Text(
                                                                    notification
                                                                        .message),
                                                                trailing: Text(
                                                                  DateFormat(
                                                                          'dd/MM HH:mm')
                                                                      .format(notification
                                                                              .createdTime ??
                                                                          DateTime
                                                                              .now()),
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          12,
                                                                      color: Colors
                                                                          .grey),
                                                                ),
                                                                leading: Icon(
                                                                    Icons
                                                                        .notifications,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary),
                                                              );
                                                            },
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          );
                                        },
                                        child: Icon(
                                          Icons.notifications_none,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 30,
                                        ),
                                      ),
                                    ],
                                  ),

                                  // Kullanıcıyı motive eden alt bilgi veya açıklama metni
                                  Text(
                                    'Bugün de hedeflerine odaklan 🎯',
                                    style: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontStyle,
                                          ),
                                          fontSize: 15.0,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontStyle,
                                        ),
                                  ).animate().fade(delay: 200.ms),
                                ].divide(SizedBox(height: 8.0)),
                              ),
                            ),
                            wrapWithModel(
                              model: _model.homePageGreeterModel,
                              updateCallback: () => safeSetState(() {}),
                              child: HomePageGreeterWidget(),
                            ),

                            // Günlük ilerleme durumunu gösteren ilerleme çubuğu bileşenini modele bağlayarak çağırıyoruz
                            wrapWithModel(
                              model: _model.homePageDailyProgressBarModel,
                              updateCallback: () => safeSetState(() {}),
                              child: HomePageDailyProgressBarWidget(),
                            ),

                            // Kullanıcının günlük hedeflerini listeleyen bileşeni (Widget) sayfaya dahil ediyoruz
                            wrapWithModel(
                              model: _model.homePageTodayGoalsModel,
                              updateCallback: () => safeSetState(() {}),
                              child: HomePageTodayGoalsWidget(
                                goalsList: homePageUserGoalsRecordList,
                                onGoalCompleted: () {
                                  final uncompletedCount =
                                      homePageUserGoalsRecordList
                                          .where((e) => !e.isCompleted)
                                          .length;
                                  if (uncompletedCount <= 1) {
                                    _confettiController.play();
                                  }
                                },
                              ),
                            )
                                .animate()
                                .fade(duration: 600.ms)
                                .slideY(begin: 0.2, end: 0),

                            // Kullanıcının gün içindeki aktivitelerinin özetini gösteren bileşeni (Widget) yüklüyoruz
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
                            )
                                .animate()
                                .fade(duration: 800.ms)
                                .slideY(begin: 0.1, end: 0),
                          ]
                              .divide(SizedBox(height: 16.0))
                              .addToEnd(SizedBox(height: 16.0)),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: ConfettiWidget(
                      confettiController: _confettiController,
                      blastDirectionality: BlastDirectionality.explosive,
                      shouldLoop: false,
                      colors: const [
                        Colors.green,
                        Colors.blue,
                        Colors.pink,
                        Colors.orange,
                        Colors.purple
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
