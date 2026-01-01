import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'settings_all_user_options_model.dart';
export 'settings_all_user_options_model.dart';

/// Tum Kullanici Ayarlari
class SettingsAllUserOptionsWidget extends StatefulWidget {
  const SettingsAllUserOptionsWidget({super.key});

  @override
  State<SettingsAllUserOptionsWidget> createState() =>
      _SettingsAllUserOptionsWidgetState();
}

class _SettingsAllUserOptionsWidgetState
    extends State<SettingsAllUserOptionsWidget> {
  late SettingsAllUserOptionsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SettingsAllUserOptionsModel());

    _model.switchValue1 = true;
    _model.switchValue2 = FFAppState().isDarkMode;
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        boxShadow: [
          BoxShadow(
            blurRadius: 4.0,
            color: Color(0x33000000),
            offset: Offset(
              0.0,
              2.0,
            ),
          )
        ],
        borderRadius: BorderRadius.circular(18.0),
        shape: BoxShape.rectangle,
      ),
      child: Padding(
        padding: EdgeInsets.all(14.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            // Kullanicinin uygulama ici bildirimleri onayladıgi ya da onaylamadigi alan
            Padding(
              padding: EdgeInsets.all(4.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: 50.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).customGrey,
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: FaIcon(
                          FontAwesomeIcons.solidBell,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24.0,
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Bildirimler',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                          Text(
                            'Hatırlatma ve başarı bildirimleri',
                            style: FlutterFlowTheme.of(context)
                                .labelSmall
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .labelSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelSmall
                                      .fontStyle,
                                ),
                          ),
                        ].divide(SizedBox(height: 5.0)),
                      ),
                    ].divide(SizedBox(width: 16.0)),
                  ),
                  Switch.adaptive(
                    value: _model.switchValue1!,
                    onChanged: (newValue) async {
                      safeSetState(() => _model.switchValue1 = newValue);
                    },
                    activeColor: Colors.white,
                    activeTrackColor: FlutterFlowTheme.of(context).primary,
                    inactiveTrackColor: FlutterFlowTheme.of(context).trackColor,
                    inactiveThumbColor: Colors.white,
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 2.0,
              color: FlutterFlowTheme.of(context).alternate,
            ),

            // Uygulama temasinin ayarlandigi alan
            Padding(
              padding: EdgeInsets.all(4.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: 50.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).customGrey,
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: FaIcon(
                          FontAwesomeIcons.solidMoon,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24.0,
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Gece Modu',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                          Text(
                            'Koyu Tema Kullan',
                            style: FlutterFlowTheme.of(context)
                                .labelSmall
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .labelSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelSmall
                                      .fontStyle,
                                ),
                          ),
                        ].divide(SizedBox(height: 5.0)),
                      ),
                    ].divide(SizedBox(width: 16.0)),
                  ),
                  Switch.adaptive(
                    value: _model.switchValue2!,
                    onChanged: (newValue) async {
                      safeSetState(() => _model.switchValue2 = newValue);
                      if (newValue) {
                        FFAppState().isDarkMode = true;
                        safeSetState(() {});
                        setDarkModeSetting(context, ThemeMode.dark);
                      } else {
                        FFAppState().isDarkMode = false;
                        safeSetState(() {});
                        setDarkModeSetting(context, ThemeMode.light);
                      }
                    },
                    activeColor: Colors.white,
                    activeTrackColor: FlutterFlowTheme.of(context).primary,
                    inactiveTrackColor: FlutterFlowTheme.of(context).trackColor,
                    inactiveThumbColor: Colors.white,
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 2.0,
              color: FlutterFlowTheme.of(context).alternate,
            ),
            if (valueOrDefault<bool>(
              valueOrDefault(currentUserDocument?.userRole, '') == 'admin',
              false,
            ))
              Padding(
                padding: EdgeInsets.all(4.0),
                child: AuthUserStreamWidget(
                  builder: (context) => Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Yoneticinin uygulama yonetimini yaptigi alan alan
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: 50.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).customGrey,
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Icon(
                              Icons.verified_user_outlined,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 24.0,
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Yönetici Paneli',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                              Text(
                                'Uygulama yönetimi ve rozetler',
                                style: FlutterFlowTheme.of(context)
                                    .labelSmall
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .labelSmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelSmall
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .fontStyle,
                                    ),
                              ),
                            ].divide(SizedBox(height: 5.0)),
                          ),
                        ].divide(SizedBox(width: 16.0)),
                      ),
                      FlutterFlowIconButton(
                        borderRadius: 18.0,
                        buttonSize: 40.0,
                        fillColor: FlutterFlowTheme.of(context).customGrey,
                        icon: FaIcon(
                          FontAwesomeIcons.angleRight,
                          color: FlutterFlowTheme.of(context).iconColor,
                          size: 24.0,
                        ),
                        onPressed: () async {
                          context.pushNamed(AdminPanelWidget.routeName);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            if (valueOrDefault<bool>(
              valueOrDefault(currentUserDocument?.userRole, '') == 'admin',
              false,
            ))
              AuthUserStreamWidget(
                builder: (context) => Divider(
                  thickness: 2.0,
                  color: FlutterFlowTheme.of(context).alternate,
                ),
              ),
            Padding(
              padding: EdgeInsets.all(4.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Veri koruma ve guvenlik alani
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: 50.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).customGrey,
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Icon(
                          Icons.keyboard_control_sharp,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24.0,
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Gizlilik',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                          Text(
                            'Veri koruma ve güvenlik',
                            style: FlutterFlowTheme.of(context)
                                .labelSmall
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .labelSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelSmall
                                      .fontStyle,
                                ),
                          ),
                        ].divide(SizedBox(height: 5.0)),
                      ),
                    ].divide(SizedBox(width: 16.0)),
                  ),
                  FlutterFlowIconButton(
                    borderRadius: 18.0,
                    buttonSize: 40.0,
                    fillColor: FlutterFlowTheme.of(context).customGrey,
                    icon: FaIcon(
                      FontAwesomeIcons.angleRight,
                      color: FlutterFlowTheme.of(context).iconColor,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      context.pushNamed(
                        PPAndTOSWidget.routeName,
                        extra: <String, dynamic>{
                          kTransitionInfoKey: TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.rightToLeft,
                          ),
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 2.0,
              color: FlutterFlowTheme.of(context).alternate,
            ),

            // Yardım ve Destek alani
            Padding(
              padding: EdgeInsets.all(4.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: 50.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).customGrey,
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: FaIcon(
                          FontAwesomeIcons.questionCircle,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24.0,
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Yardım & Destek',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                          Text(
                            'SSS ve iletişim',
                            style: FlutterFlowTheme.of(context)
                                .labelSmall
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .labelSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelSmall
                                      .fontStyle,
                                ),
                          ),
                        ].divide(SizedBox(height: 5.0)),
                      ),
                    ].divide(SizedBox(width: 16.0)),
                  ),
                  FlutterFlowIconButton(
                    borderRadius: 18.0,
                    buttonSize: 40.0,
                    fillColor: FlutterFlowTheme.of(context).customGrey,
                    icon: FaIcon(
                      FontAwesomeIcons.angleRight,
                      color: FlutterFlowTheme.of(context).iconColor,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      context.pushNamed(HelpSupportWidget.routeName);
                    },
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 2.0,
              color: FlutterFlowTheme.of(context).alternate,
            ),

            // Uygulamadan cikis alani
            Padding(
              padding: EdgeInsets.all(4.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: 50.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).customGrey,
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Icon(
                          Icons.logout,
                          color: FlutterFlowTheme.of(context).customColor1,
                          size: 24.0,
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Çıkış Yap',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color:
                                      FlutterFlowTheme.of(context).customColor1,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                        ].divide(SizedBox(height: 5.0)),
                      ),
                    ].divide(SizedBox(width: 16.0)),
                  ),
                  FlutterFlowIconButton(
                    borderRadius: 18.0,
                    buttonSize: 40.0,
                    fillColor: FlutterFlowTheme.of(context).customGrey,
                    icon: FaIcon(
                      FontAwesomeIcons.angleRight,
                      color: FlutterFlowTheme.of(context).customColor1,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      GoRouter.of(context).prepareAuthEvent();
                      await authManager.signOut();
                      GoRouter.of(context).clearRedirectLocation();

                      context.goNamedAuth(
                          FirstLaunchPageWidget.routeName, context.mounted);
                    },
                  ),
                ],
              ),
            ),
          ].divide(SizedBox(height: 5.0)).around(SizedBox(height: 5.0)),
        ),
      ),
    );
  }
}
