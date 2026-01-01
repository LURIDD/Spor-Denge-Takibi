import '/components/gamification/badges/fitness_hero/fitness_hero_widget.dart';
import '/components/gamification/badges/meditation_guru/meditation_guru_widget.dart';
import '/components/gamification/badges/water_sensei/water_sensei_widget.dart';
import '/components/gamification/earned_badges/earned_badges_widget.dart';
import '/components/gamification/total_streak/total_streak_widget.dart';
import '/components/settings_items/admin_settings_items/add_new_badge/add_new_badge_widget.dart';
import '/components/settings_items/admin_settings_items/app_statics/app_statics_widget.dart';
import '/components/user_management/list_of_users/list_of_users_widget.dart';
import '/components/user_management/online_user/online_user_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'admin_panel_model.dart';
export 'admin_panel_model.dart';

/// Yönetici Sayfasi
class AdminPanelWidget extends StatefulWidget {
  const AdminPanelWidget({super.key});

  static String routeName = 'AdminPanel';
  static String routePath = '/adminPanel';

  @override
  State<AdminPanelWidget> createState() => _AdminPanelWidgetState();
}

class _AdminPanelWidgetState extends State<AdminPanelWidget> {
  late AdminPanelModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdminPanelModel());
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
          child:
              // Admin Panel alani
              Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10.0, 20.0, 10.0, 100.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.safePop();
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.arrow_back,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          ),
                          Text(
                            'Geri',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                        ].divide(SizedBox(width: 10.0)),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 20.0, 0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Yönetim Paneli',
                          style: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .override(
                                font: GoogleFonts.interTight(
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .fontStyle,
                                ),
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.bold,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .fontStyle,
                              ),
                        ),
                        Text(
                          'Uygulama metriklerini ve rozetleri yönetin 📊',
                          style:
                              FlutterFlowTheme.of(context).labelLarge.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelLarge
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelLarge
                                        .fontStyle,
                                  ),
                        ),
                      ].divide(SizedBox(height: 10.0)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        // Uygulamadaki aktif/cevrimici kullanicilari gosteren bileseni modele bagliyoruz
                        wrapWithModel(
                          model: _model.onlineUserModel,
                          updateCallback: () => safeSetState(() {}),
                          child: OnlineUserWidget(),
                        ),

                        // Kullanicinin toplam devamlilik (streak) sayisini gosteren bileseni modele bagliyoruz
                        wrapWithModel(
                          model: _model.totalStreakModel,
                          updateCallback: () => safeSetState(() {}),
                          child: TotalStreakWidget(),
                        ),

                        // Kullanicinin basariyla kazandigi (kilidini actigi) rozetlerin listesini yukluyoruz
                        wrapWithModel(
                          model: _model.earnedBadgesModel,
                          updateCallback: () => safeSetState(() {}),
                          child: EarnedBadgesWidget(),
                        ),
                      ].divide(SizedBox(height: 16.0)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        // Yeni rozet ekleme bilesenini, ekranin kalan bos alanini dolduracak sekilde yerlestiriyoruz.
                        // Expanded: Bu widget'in icinde bulundugu satir (Row) veya sutun (Column) icindeki
                        // kullanilabilir tum bos alani kaplamasini saglar.
                        Expanded(
                          child: wrapWithModel(
                            model: _model.addNewBadgeModel,
                            updateCallback: () => safeSetState(() {}),
                            child: AddNewBadgeWidget(),
                          ),
                        ),

                        // Tum kullanicilarin listelendigi ana bolumu ekranin kalanina yayiyoruz
                        // Expanded:Listenin ekranin alt kismina kadar uzanmasini ve esnek bir yapida olmasini saglar.
                        Expanded(
                          child: wrapWithModel(
                            model: _model.listOfUsersModel,
                            updateCallback: () => safeSetState(() {}),
                            child: ListOfUsersWidget(),
                          ),
                        ),
                      ].divide(SizedBox(width: 16.0)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Rozet Kriterleri',
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
                            Text(
                              'Kullanıcıların kazanabileceği rozetleri düzenleyin',
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
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontStyle,
                                  ),
                            ),
                          ].divide(SizedBox(height: 3.0)),
                        ),

                        // Su tuketimini takip eden ve kullaniciya rehberlik eden 'Sensei' bilesenini yukluyoruz
                        wrapWithModel(
                          model: _model.waterSenseiModel,
                          updateCallback: () => safeSetState(() {}),
                          child: WaterSenseiWidget(),
                        ),

                        // Kullaiıcinin spor aktivitelerini ve fitness hedeflerini yoneten 'Fitness Hero' bileseni
                        wrapWithModel(
                          model: _model.fitnessHeroModel,
                          updateCallback: () => safeSetState(() {}),
                          child: FitnessHeroWidget(),
                        ),

                        // Kullanicinin meditasyon seanslarini ve zihinsel saglık verilerini yoneten 'Meditation Guru' bileseni
                        wrapWithModel(
                          model: _model.meditationGuruModel,
                          updateCallback: () => safeSetState(() {}),
                          child: MeditationGuruWidget(),
                        ),
                      ].divide(SizedBox(height: 16.0)),
                    ),
                  ),

                  // Uygulama genelindeki istatistikleri gosteren bileseni (Widget) sayfaya dahil ediyoruz
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: wrapWithModel(
                      model: _model.appStaticsModel,
                      updateCallback: () => safeSetState(() {}),
                      child: AppStaticsWidget(),
                    ),
                  ),
                ].divide(SizedBox(height: 10.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
