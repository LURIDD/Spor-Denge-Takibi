import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/onboarding/step_goal_page/step_goal_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'gender_model.dart';
export 'gender_model.dart';

/// Cinsiyet
class GenderWidget extends StatefulWidget {
  const GenderWidget({super.key});

  @override
  State<GenderWidget> createState() => _GenderWidgetState();
}

class _GenderWidgetState extends State<GenderWidget> {
  late GenderModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GenderModel());
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
      padding: EdgeInsets.all(12.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: [
            BoxShadow(
              blurRadius: 4.0,
              color: Color(0x33767575),
              offset: Offset(
                0.0,
                8.0,
              ),
              spreadRadius: 0.0,
            )
          ],
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child:
            // Kullanıcının cinsiyetini seçtiği bölüm
            Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                '👤',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.inter(
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                      fontSize: 50.0,
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
              ),
              Text(
                'Cinsiyetiniz?',
                style: FlutterFlowTheme.of(context).headlineSmall.override(
                      font: GoogleFonts.interTight(
                        fontWeight: FlutterFlowTheme.of(context)
                            .headlineSmall
                            .fontWeight,
                        fontStyle: FlutterFlowTheme.of(context)
                            .headlineSmall
                            .fontStyle,
                      ),
                      fontSize: 22.0,
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).headlineSmall.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).headlineSmall.fontStyle,
                    ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        FFAppState().TempGender = 'Erkek';
                        safeSetState(() {});
                        _model.showErrors = false;
                        safeSetState(() {});
                      },
                      child: Container(
                        width: 125.0,
                        height: 120.0,
                        decoration: BoxDecoration(
                          color: FFAppState().TempGender == 'Erkek'
                              ? FlutterFlowTheme.of(context)
                                  .addNewGoalPageSelectedFillColor
                              : FlutterFlowTheme.of(context).primaryBackground,
                          borderRadius: BorderRadius.circular(18.0),
                          border: Border.all(
                            color: () {
                              if (FFAppState().TempGender == 'Erkek') {
                                return FlutterFlowTheme.of(context)
                                    .addNewGoalPageSelectedBorderColor;
                              } else if (_model.showErrors) {
                                return Color(0xFFB26868);
                              } else {
                                return FlutterFlowTheme.of(context).alternate;
                              }
                            }(),
                            width: 1.0,
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                'assets/images/erkek.png',
                                width: 90.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(
                              'Erkek',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
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
                          ].divide(SizedBox(height: 10.0)),
                        ),
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        FFAppState().TempGender = 'Kadın';
                        safeSetState(() {});
                        _model.showErrors = false;
                        safeSetState(() {});
                      },
                      child: Container(
                        width: 125.0,
                        height: 120.0,
                        decoration: BoxDecoration(
                          color: FFAppState().TempGender == 'Kadın'
                              ? FlutterFlowTheme.of(context)
                                  .addNewGoalPageSelectedFillColor
                              : FlutterFlowTheme.of(context).primaryBackground,
                          borderRadius: BorderRadius.circular(18.0),
                          border: Border.all(
                            color: () {
                              if (FFAppState().TempGender == 'Kadın') {
                                return FlutterFlowTheme.of(context)
                                    .addNewGoalPageSelectedBorderColor;
                              } else if (_model.showErrors) {
                                return Color(0xFFB26868);
                              } else {
                                return FlutterFlowTheme.of(context).alternate;
                              }
                            }(),
                            width: 1.0,
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                'assets/images/kz.png',
                                width: 90.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(
                              'Kadın',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
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
                          ].divide(SizedBox(height: 10.0)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Opacity(
                opacity: FFAppState().TempGender != '' ? 1.0 : 0.5,
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      Function() _navigate = () {};
                      if (FFAppState().TempGender != '') {
                        _model.showErrors = false;
                        safeSetState(() {});
                        FFAppState().TempGender =
                            valueOrDefault(currentUserDocument?.gender, '');
                        safeSetState(() {});
                        GoRouter.of(context).prepareAuthEvent();
                        if (FFAppState().tempPassword !=
                            FFAppState().tempPassword) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Passwords don\'t match!',
                              ),
                            ),
                          );
                          return;
                        }

                        final user = await authManager.createAccountWithEmail(
                          context,
                          FFAppState().tempEmail,
                          FFAppState().tempPassword,
                        );
                        if (user == null) {
                          return;
                        }

                        await UsersRecord.collection.doc(user.uid).update({
                          ...createUsersRecordData(
                            userAge: valueOrDefault<int>(
                              int.parse(dateTimeFormat(
                                    "y",
                                    getCurrentTimestamp,
                                    locale: FFLocalizations.of(context)
                                        .languageCode,
                                  )) -
                                  int.parse(dateTimeFormat(
                                    "y",
                                    FFAppState().TempBirthDate,
                                    locale: FFLocalizations.of(context)
                                        .languageCode,
                                  )),
                              0,
                            ),
                            userName: FFAppState().TempUsername,
                            displayName: FFAppState().tempRealname,
                            userHeight: FFAppState().TempUserHeight,
                            userWeight: FFAppState().TempUserWeight,
                            gender: FFAppState().TempGender,
                            dailyStepGoal: 10000,
                            userRole: 'User',
                            photoUrl: 'assets/images/erkek1.png',
                          ),
                          ...mapToFirestore(
                            {
                              'created_time': FieldValue.serverTimestamp(),
                            },
                          ),
                        });

                        _navigate = () =>
                            context.pushNamed(StepGoalPageWidget.routeName);
                      } else {
                        _model.showErrors = true;
                        safeSetState(() {});
                      }

                      _navigate();
                    },
                    child: Container(
                      width: double.infinity,
                      height: 50.0,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            FlutterFlowTheme.of(context).primary,
                            FlutterFlowTheme.of(context).secondary
                          ],
                          stops: [0.0, 1.0],
                          begin: AlignmentDirectional(1.0, 0.0),
                          end: AlignmentDirectional(-1.0, 0),
                        ),
                        borderRadius: BorderRadius.circular(14.0),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Devam Et',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: FlutterFlowTheme.of(context)
                                      .lightTextAndIconColor,
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                        ].divide(SizedBox(width: 10.0)),
                      ),
                    ),
                  ),
                ),
              ),
            ]
                .divide(SizedBox(height: 10.0))
                .addToStart(SizedBox(height: 30.0))
                .addToEnd(SizedBox(height: 20.0)),
          ),
        ),
      ),
    );
  }
}
