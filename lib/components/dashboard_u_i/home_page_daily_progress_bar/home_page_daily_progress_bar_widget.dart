import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';
import 'home_page_daily_progress_bar_model.dart';
export 'home_page_daily_progress_bar_model.dart';

/// Ana Sayfadaki Gunluk Ilerleme Cubugu
class HomePageDailyProgressBarWidget extends StatefulWidget {
  const HomePageDailyProgressBarWidget({super.key});

  @override
  State<HomePageDailyProgressBarWidget> createState() =>
      _HomePageDailyProgressBarWidgetState();
}

class _HomePageDailyProgressBarWidgetState
    extends State<HomePageDailyProgressBarWidget> {
  late HomePageDailyProgressBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageDailyProgressBarModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: [
            BoxShadow(
              blurRadius: 10.0,
              color: Color(0x33000000),
              offset: Offset(
                0.0,
                4.0,
              ),
            )
          ],
          borderRadius: BorderRadius.circular(18.0),
        ),
        child:
            // anasayfadaki gunluk ilerlemenin gosterildigi alan
            // Ana içerik ve düzenleme butonunu üst üste bindirmek için Stack kullanıyoruz.
            Stack(
          children: [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: AuthUserStreamWidget(
                      builder: (context) => CircularPercentIndicator(
                        percent: (int current, int goal) {
                          return goal > 0
                              ? ((current / goal) > 1.0
                                  ? 1.0
                                  : (current / goal))
                              : 0.0;
                        }(
                            FFAppState().liveSteps,
                            valueOrDefault(
                                currentUserDocument?.dailyStepGoal, 0)),
                        radius: 60.0,
                        lineWidth: 12.0,
                        animation: true,
                        animateFromLastPercent: true,
                        progressColor: Color(0xFF195BC4),
                        backgroundColor: Color(0xFFF1F4F8),
                        center: Text(
                          valueOrDefault<String>(
                            (int current, int goal) {
                              return goal > 0
                                  ? ((current / goal) >= 1.0
                                      ? "100%"
                                      : ((current / goal) * 100)
                                              .toInt()
                                              .toString() +
                                          "%")
                                  : "0%";
                            }(
                                FFAppState().liveSteps,
                                valueOrDefault(
                                    currentUserDocument?.dailyStepGoal, 0)),
                            '0%',
                          ),
                          style: FlutterFlowTheme.of(context)
                              .headlineSmall
                              .override(
                                font: GoogleFonts.interTight(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .fontStyle,
                                ),
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .fontStyle,
                              ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: Text(
                      'Günlük Adım',
                      style: FlutterFlowTheme.of(context).titleLarge.override(
                            font: GoogleFonts.interTight(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .fontStyle,
                            ),
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .titleLarge
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleLarge
                                .fontStyle,
                          ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        width: 100.0,
                        height: 20.0,
                        child: custom_widgets.LiveStepCounter(
                          width: 100.0,
                          height: 20.0,
                          textColor: FlutterFlowTheme.of(context).primaryText,
                          textSize: 14.0,
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                        child: AuthUserStreamWidget(
                          builder: (context) => Text(
                            ' / ${valueOrDefault(currentUserDocument?.dailyStepGoal, 10000)} Adım',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Günlük adım hedefini düzenlemek için sağ üst köşeye yerleştirilmiş buton.
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 10.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    await showDialog(
                      context: context,
                      builder: (alertDialogContext) {
                        TextEditingController _goalController =
                            TextEditingController(
                                text: valueOrDefault(
                                        currentUserDocument?.dailyStepGoal,
                                        10000)
                                    .toString());
                        return AlertDialog(
                          title: Text('Günlük Adım Hedefi'),
                          content: Container(
                            height: 150,
                            child: Column(
                              children: [
                                Text(
                                    'Lütfen yeni günlük adım hedefini giriniz:'),
                                SizedBox(height: 10),
                                TextField(
                                  controller: _goalController,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    hintText: 'Örn: 10000',
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () =>
                                  Navigator.pop(alertDialogContext),
                              child: Text('İptal'),
                            ),
                            TextButton(
                              onPressed: () async {
                                if (_goalController.text.isNotEmpty) {
                                  int? newGoal =
                                      int.tryParse(_goalController.text);
                                  if (newGoal != null && newGoal > 0) {
                                    await currentUserReference!.update(
                                        createUsersRecordData(
                                            dailyStepGoal: newGoal));
                                    Navigator.pop(alertDialogContext);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                            'Hedef başarıyla güncellendi!'),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                      ),
                                    );
                                  }
                                }
                              },
                              child: Text('Kaydet'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Icon(
                    Icons.more_vert,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 24.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
