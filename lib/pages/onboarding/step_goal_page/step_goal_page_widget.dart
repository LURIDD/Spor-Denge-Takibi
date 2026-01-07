import '/components/onboarding/ask_step_goal/ask_step_goal_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'step_goal_page_model.dart';
export 'step_goal_page_model.dart';

/// Adım Hedefi Sayfası
class StepGoalPageWidget extends StatefulWidget {
  const StepGoalPageWidget({super.key});

  static String routeName = 'StepGoalPage';
  static String routePath = '/stepGoalPage';

  @override
  State<StepGoalPageWidget> createState() => _StepGoalPageWidgetState();
}

class _StepGoalPageWidgetState extends State<StepGoalPageWidget> {
  late StepGoalPageModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  /// Başlangıç durumu
  void initState() {
    super.initState();
    _model = createModel(context, () => StepGoalPageModel());
  }

  @override
  /// Kaynakları serbest bırak
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  /// Arayüzü oluştur
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Sana Özel Bir Deneyim için',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).displaySmall.override(
                          font: GoogleFonts.interTight(
                            fontWeight: FontWeight.bold,
                          ),
                          fontSize: 36.0,
                        ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Text(
                      'Son bir adım kaldı',
                      style: FlutterFlowTheme.of(context).labelLarge,
                    ),
                  ),
                ].divide(SizedBox(height: 15.0)),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Adım 5/5',
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                        Text(
                          '%100',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.inter(),
                                    color: FlutterFlowTheme.of(context).primary,
                                  ),
                        ),
                      ],
                    ),
                    LinearPercentIndicator(
                      percent: 1.0,
                      lineHeight: 14.0,
                      animation: true,
                      animateFromLastPercent: true,
                      progressColor: FlutterFlowTheme.of(context).primary,
                      backgroundColor: FlutterFlowTheme.of(context).alternate,
                      barRadius: Radius.circular(25.0),
                      padding: EdgeInsets.zero,
                    ),
                  ].divide(SizedBox(height: 10.0)),
                ),
              ),
              // Adım Hedefi Seçim Bileşeni
              wrapWithModel(
                model: _model.askStepGoalModel,
                updateCallback: () => safeSetState(() {}),
                child: AskStepGoalWidget(),
              ),
            ].divide(SizedBox(height: 10.0)),
          ),
        ),
      ),
    );
  }
}
