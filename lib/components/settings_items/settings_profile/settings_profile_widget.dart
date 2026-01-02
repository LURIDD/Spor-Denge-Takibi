import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'settings_profile_model.dart';
export 'settings_profile_model.dart';

/// Profil Ayarlari Kisisel ve Fiziksel Ozellikler
class SettingsProfileWidget extends StatefulWidget {
  const SettingsProfileWidget({super.key});

  @override
  State<SettingsProfileWidget> createState() => _SettingsProfileWidgetState();
}

class _SettingsProfileWidgetState extends State<SettingsProfileWidget> {
  late SettingsProfileModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SettingsProfileModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return
        // Profil ayarlari, kisisel ve fiziksel ozelliklerinin girildigi alan
        Container(
      width: double.infinity,
      height: 100.0,
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
      ),
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            AuthUserStreamWidget(
              builder: (context) => Container(
                width: 75.0,
                height: 75.0,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Builder(
                  builder: (context) {
                    if (currentUserPhoto.startsWith('http')) {
                      return Image.network(
                        valueOrDefault<String>(
                          currentUserPhoto,
                          'https://cdn-icons-png.flaticon.com/512/3135/3135715.png',
                        ),
                        fit: BoxFit.cover,
                      );
                    } else {
                      return Image.asset(
                        valueOrDefault<String>(
                          currentUserPhoto,
                          (currentUserDocument?.gender == 'Erkek')
                              ? 'assets/images/erkek1.png'
                              : 'assets/images/kz1.png',
                        ),
                        fit: BoxFit.cover,
                      );
                    }
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AuthUserStreamWidget(
                    builder: (context) => Text(
                      valueOrDefault(currentUserDocument?.userName, ''),
                      style: FlutterFlowTheme.of(context).titleMedium.override(
                            font: GoogleFonts.interTight(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .fontStyle,
                            ),
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .titleMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleMedium
                                .fontStyle,
                          ),
                    ),
                  ),
                  AuthUserStreamWidget(
                    builder: (context) => Text(
                      '${valueOrDefault(currentUserDocument?.userAge, 0).toString()} yaş  • ${valueOrDefault(currentUserDocument?.userWeight, 0.0).toString()} kilo  • ${valueOrDefault(currentUserDocument?.userHeight, 0.0).toString()} boy',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                  AuthUserStreamWidget(
                    builder: (context) => Text(
                      '${valueOrDefault(currentUserDocument?.currentStreak, 0).toString()} Günlük Aktif Seri 🔥',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.inter(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            color: FlutterFlowTheme.of(context).secondary,
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
                ].divide(SizedBox(height: 5.0)),
              ),
            ),
            FlutterFlowIconButton(
              borderRadius: 25.0,
              buttonSize: 40.0,
              fillColor: FlutterFlowTheme.of(context).customGrey,
              icon: Icon(
                Icons.edit,
                color: FlutterFlowTheme.of(context).primary,
                size: 24.0,
              ),
              onPressed: () async {
                context.pushNamed(EditProfileWidget.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
