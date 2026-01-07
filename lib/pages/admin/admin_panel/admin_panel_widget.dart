import '/backend/backend.dart';
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

/// Yönetici Sayfası
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
              // Admin Panel alanı
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
                        // Uygulamadaki aktif/çevrimiçi kullanıcıları gösteren bileşeni modele bağlıyoruz
                        wrapWithModel(
                          model: _model.onlineUserModel,
                          updateCallback: () => safeSetState(() {}),
                          child: OnlineUserWidget(),
                        ),

                        // Kullanıcının toplam devamlılık (streak) sayısını gösteren bileşeni modele bağlıyoruz
                        wrapWithModel(
                          model: _model.totalStreakModel,
                          updateCallback: () => safeSetState(() {}),
                          child: TotalStreakWidget(),
                        ),

                        // Kullanıcının başarıyla kazandığı (kilidini açtığı) rozetlerin listesini yüklüyoruz
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
                        // Yeni rozet ekleme bileşenini, ekranın kalan boş alanını dolduracak şekilde yerleştiriyoruz.
                        // Expanded: Bu widget'ın içinde bulunduğu satır (Row) veya sütun (Column) içindeki
                        // kullanılabilir tüm boş alanı kaplamasını sağlar.
                        Expanded(
                          child: wrapWithModel(
                            model: _model.addNewBadgeModel,
                            updateCallback: () => safeSetState(() {}),
                            child: AddNewBadgeWidget(),
                          ),
                        ),

                        // Tüm kullanıcıların listelendiği ana bölümü ekranın kalanına yayıyoruz
                        // Expanded: Listenin ekranın alt kısmına kadar uzanmasını ve esnek bir yapıda olmasını sağlar.
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
                        StreamBuilder<List<BadgesRecord>>(
                          stream: queryBadgesRecord(
                            queryBuilder: (badgesRecord) => badgesRecord
                                .orderBy('created_time', descending: true),
                          ),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                ),
                              );
                            }
                            List<BadgesRecord> badgeList = snapshot.data!;
                            if (badgeList.isEmpty) {
                              return Center(
                                  child: Text('Henüz rozet eklenmemiş.'));
                            }
                            return ListView.separated(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: badgeList.length,
                              separatorBuilder: (_, __) =>
                                  SizedBox(height: 16.0),
                              itemBuilder: (context, index) {
                                final badge = badgeList[index];
                                return Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 4.0,
                                        color: Color(0x33000000),
                                        offset: Offset(0.0, 2.0),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(18.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Row(
                                            children: [
                                              Container(
                                                width: 50.0,
                                                height: 50.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary
                                                      .withOpacity(0.1),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          18.0),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.all(8.0),
                                                  child: Builder(
                                                    builder: (context) {
                                                      if (badge
                                                          .image.isNotEmpty) {
                                                        if (badge.image
                                                            .startsWith(
                                                                'http')) {
                                                          return Image.network(
                                                            badge.image,
                                                            fit: BoxFit.cover,
                                                            errorBuilder: (_,
                                                                    __, ___) =>
                                                                Icon(Icons
                                                                    .shield),
                                                          );
                                                        } else if (badge.image
                                                            .startsWith(
                                                                'assets/')) {
                                                          return Image.asset(
                                                            badge.image,
                                                            fit: BoxFit.cover,
                                                            errorBuilder: (_,
                                                                    __, ___) =>
                                                                Icon(Icons
                                                                    .shield),
                                                          );
                                                        }
                                                      }

                                                      // Smart Fallback logic
                                                      String assetPath =
                                                          'assets/images/star.png';
                                                      if (badge.name
                                                          .contains('Su')) {
                                                        assetPath =
                                                            'assets/images/water.png';
                                                      } else if (badge.name
                                                              .contains(
                                                                  'Egzersiz') ||
                                                          badge.name.contains(
                                                              'Spor')) {
                                                        assetPath =
                                                            'assets/images/training.png';
                                                      } else if (badge.name
                                                          .contains(
                                                              'Meditasyon')) {
                                                        assetPath =
                                                            'assets/images/meditation.png';
                                                      } else if (badge.name
                                                          .contains('Kitap')) {
                                                        assetPath =
                                                            'assets/images/stack-of-books.png';
                                                      } else if (badge.name
                                                          .contains('Uyku')) {
                                                        assetPath =
                                                            'assets/images/sleeping.png';
                                                      }

                                                      return Image.asset(
                                                        assetPath,
                                                        fit: BoxFit.cover,
                                                        errorBuilder: (_, __,
                                                                ___) =>
                                                            Icon(Icons.shield,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                              SizedBox(width: 10),
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Wrap(
                                                      crossAxisAlignment:
                                                          WrapCrossAlignment
                                                              .center,
                                                      spacing: 8.0,
                                                      runSpacing: 4.0,
                                                      children: [
                                                        Text(
                                                          badge.name,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleMedium,
                                                        ),
                                                        Container(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal: 8,
                                                                  vertical: 2),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .customGrey,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12),
                                                          ),
                                                          child: Text(
                                                            badge.criteria,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodySmall
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .inter(),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Text(
                                                      badge.description
                                                              .isNotEmpty
                                                          ? badge.description
                                                          : 'Açıklama yok',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(width: 8),
                                        Row(
                                          children: [
                                            IconButton(
                                              icon: Icon(Icons.edit_outlined,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary),
                                              onPressed: () async {
                                                await showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  context: context,
                                                  builder: (context) {
                                                    return Padding(
                                                      padding: MediaQuery
                                                          .viewInsetsOf(
                                                              context),
                                                      child: AddBadgeForm(
                                                          badgeToEdit: badge),
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                            IconButton(
                                              icon: Icon(Icons.delete_outline,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error),
                                              onPressed: () async {
                                                final confirm =
                                                    await showDialog<bool>(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      title: const Text(
                                                          'Rozeti Sil'),
                                                      content: const Text(
                                                          'Bu rozeti silmek istediğinizden emin misiniz? Bu işlem geri alınamaz.'),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  alertDialogContext,
                                                                  false),
                                                          child: const Text(
                                                              'İptal'),
                                                        ),
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  alertDialogContext,
                                                                  true),
                                                          child: Text(
                                                            'Sil',
                                                            style: TextStyle(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                );

                                                if (confirm == true) {
                                                  await badge.reference
                                                      .delete();
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(SnackBar(
                                                          content: Text(
                                                              'Rozet silindi')));
                                                }
                                              },
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ].divide(SizedBox(height: 16.0)),
                    ),
                  ),

                  // Uygulama genelindeki istatistikleri gösteren bileşeni (Widget) sayfaya dahil ediyoruz
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
