import '/components/settings_items/privacy_policy_and_terms_of_service/privacy_policy_and_terms_of_service_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'p_p_and_t_o_s_model.dart';
export 'p_p_and_t_o_s_model.dart';

/// Gizlilik Politikası ve Kullanım Şartları
class PPAndTOSWidget extends StatefulWidget {
  const PPAndTOSWidget({super.key});

  static String routeName = 'PPAndTOS';
  static String routePath = '/pPAndTOS';

  @override
  State<PPAndTOSWidget> createState() => _PPAndTOSWidgetState();
}

class _PPAndTOSWidgetState extends State<PPAndTOSWidget> {
  late PPAndTOSModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PPAndTOSModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
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
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      FlutterFlowIconButton(
                        borderRadius: 20.0,
                        buttonSize: 40.0,
                        fillColor: FlutterFlowTheme.of(context).customGrey,
                        icon: Icon(
                          Icons.arrow_back,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 20.0,
                        ),
                        onPressed: () async {
                          context.safePop();
                        },
                      ),
                      Text(
                        'Gizlilik',
                        style:
                            FlutterFlowTheme.of(context).headlineSmall.override(
                                  font: GoogleFonts.interTight(
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .fontStyle,
                                  ),
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .fontStyle,
                                ),
                      ),
                    ].divide(SizedBox(width: 15.0)),
                  ),
                ),

                // Gizlilik Politikası ve Kullanım Şartlarını içeren yasal bilgilendirme bölümü
                // Expanded: Metnin uzunluğuna göre ekranın kalan tüm boş alanını kaplamasını sağlar
                Expanded(
                  child: wrapWithModel(
                    model: _model.privacyPolicyAndTermsOfServiceModel,
                    updateCallback: () => safeSetState(() {}),
                    child: PrivacyPolicyAndTermsOfServiceWidget(),
                  ),
                ),
              ].divide(SizedBox(height: 20.0)),
            ),
          ),
        ),
      ),
    );
  }
}
