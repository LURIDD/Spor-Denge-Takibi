import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'privacy_policy_and_terms_of_service_model.dart';
export 'privacy_policy_and_terms_of_service_model.dart';

/// Gizlilik Politikası Ve Hizmet Şartları
class PrivacyPolicyAndTermsOfServiceWidget extends StatefulWidget {
  const PrivacyPolicyAndTermsOfServiceWidget({super.key});

  @override
  State<PrivacyPolicyAndTermsOfServiceWidget> createState() =>
      _PrivacyPolicyAndTermsOfServiceWidgetState();
}

class _PrivacyPolicyAndTermsOfServiceWidgetState
    extends State<PrivacyPolicyAndTermsOfServiceWidget> {
  late PrivacyPolicyAndTermsOfServiceModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PrivacyPolicyAndTermsOfServiceModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        // Gizlilik politikası bilgisi alanı
        Padding(
          padding: EdgeInsets.all(4.0),
          child: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              context.pushNamed(PrivacyPolicyWidget.routeName);
            },
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
                        Icons.shield_outlined,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 24.0,
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Gizlilik Politikası',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
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
                    context.pushNamed(PrivacyPolicyWidget.routeName);
                  },
                ),
              ],
            ),
          ),
        ),
        Divider(
          thickness: 2.0,
          color: FlutterFlowTheme.of(context).alternate,
        ),

        // Kullanım şartları bilgisi alanı
        Padding(
          padding: EdgeInsets.all(4.0),
          child: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              context.pushNamed(TermsOfServiceWidget.routeName);
            },
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
                        Icons.newspaper_sharp,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 24.0,
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Kullanım Şartları',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
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
                    context.pushNamed(TermsOfServiceWidget.routeName);
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
