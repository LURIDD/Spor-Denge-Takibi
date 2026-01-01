import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'privacy_policy_model.dart';
export 'privacy_policy_model.dart';

/// Gizlilik Politikasi
class PrivacyPolicyWidget extends StatefulWidget {
  const PrivacyPolicyWidget({super.key});

  static String routeName = 'PrivacyPolicy';
  static String routePath = '/privacyPolicy';

  @override
  State<PrivacyPolicyWidget> createState() => _PrivacyPolicyWidgetState();
}

class _PrivacyPolicyWidgetState extends State<PrivacyPolicyWidget> {
  late PrivacyPolicyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PrivacyPolicyModel());
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
              // Gizlilik politikasi alani
              Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 16.0, 24.0, 0.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Gizlilik Politikası',
                          style: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .override(
                                font: GoogleFonts.interTight(
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .fontStyle,
                                ),
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .fontStyle,
                              ),
                        ),
                        FlutterFlowIconButton(
                          borderColor: FlutterFlowTheme.of(context).customGrey,
                          borderRadius: 20.0,
                          borderWidth: 1.0,
                          buttonSize: 40.0,
                          icon: Icon(
                            Icons.close_rounded,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                          onPressed: () async {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 16.0, 24.0, 0.0),
                child: Container(
                  width: double.infinity,
                  height: 1.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).alternate,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          textScaler: MediaQuery.of(context).textScaler,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Son Güncelleme Tarihi: 14 Aralık 2025',
                                style: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      font: GoogleFonts.interTight(
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontStyle,
                                    ),
                              )
                            ],
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
                                  lineHeight: 1.6,
                                ),
                          ),
                          textAlign: TextAlign.start,
                        ),
                        RichText(
                          textScaler: MediaQuery.of(context).textScaler,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    'Bu Gizlilik Politikası, Dengele mobil uygulamasının (bundan sonra \"Uygulama\" olarak anılacaktır) kullanıcı verilerini nasıl topladığını, kullandığını, sakladığını ve koruduğunu açıklamaktadır.',
                                style: TextStyle(),
                              )
                            ],
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
                                  lineHeight: 1.6,
                                ),
                          ),
                          textAlign: TextAlign.start,
                        ),
                        RichText(
                          textScaler: MediaQuery.of(context).textScaler,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: '1. Toplanan Bilgiler\n\n',
                                style: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      font: GoogleFonts.interTight(
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontStyle,
                                      ),
                                      fontSize: 18.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                              ),
                              TextSpan(
                                text:
                                    'Uygulama, temel işlevlerini yerine getirmek ve kullanıcı deneyimini kişiselleştirmek amacıyla iki ana kategoride bilgi toplar:\n\n',
                                style: TextStyle(),
                              ),
                              TextSpan(
                                text:
                                    'A. Kullanıcı Tarafından Sağlanan Bilgiler\n\n',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: '• Kimlik Bilgileri: ',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              TextSpan(
                                text:
                                    'Kullanıcının Uygulamaya kayıt olurken sağladığı e-posta adresi ve şifre (Firebase Authentication ile güvenli bir şekilde saklanır).\n\n',
                                style: TextStyle(),
                              ),
                              TextSpan(
                                text: '• Profil Bilgileri: ',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              TextSpan(
                                text:
                                    'Kullanıcının isteğe bağlı olarak sağladığı ad/soyad, boy, kilo, yaş bilgileri ve profil fotoğrafı.\n\n',
                                style: TextStyle(),
                              ),
                              TextSpan(
                                text: '• Hedef Bilgileri: ',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              TextSpan(
                                text:
                                    'Kullanıcının Uygulama içinde belirlediği günlük hedefler (su, adım, egzersiz vb.) ve bunların tamamlama durumları.\n\n',
                                style: TextStyle(),
                              ),
                              TextSpan(
                                text:
                                    'B. Otomatik Olarak Toplanan Bilgiler (Google Fit Entegrasyonu)\n\n',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text:
                                    'Uygulama, kullanıcının açık izniyle Google Fit API\'si aracılığıyla kullanıcının günlük adım sayısını ve aktivite verilerini okur (fitness.activity.read kapsamı).',
                                style: TextStyle(),
                              )
                            ],
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
                                  lineHeight: 1.4,
                                ),
                          ),
                          textAlign: TextAlign.start,
                        ),
                        RichText(
                          textScaler: MediaQuery.of(context).textScaler,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: '2. Bilgilerin Kullanım Amacı\n\n',
                                style: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      font: GoogleFonts.interTight(
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                              ),
                              TextSpan(
                                text:
                                    'Toplanan bilgiler, yalnızca aşağıdaki amaçlar için kullanılacaktır:\n\n',
                                style: TextStyle(),
                              ),
                              TextSpan(
                                text: '• Uygulama İşlevselliği: ',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              TextSpan(
                                text:
                                    'Kullanıcının günlük hedeflerine ulaşıp ulaşmadığını kontrol etmek ve Uygulamanın temel motivasyon mekanizması olan Seri Takibini (Streak) doğru bir şekilde hesaplamak.\n\n',
                                style: TextStyle(),
                              ),
                              TextSpan(
                                text: '• Kişiselleştirme: ',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              TextSpan(
                                text:
                                    'Kullanıcının profil bilgilerini kullanarak deneyimi kişiselleştirmek (Örn: İstatistikler, rozetler).\n\n',
                                style: TextStyle(),
                              ),
                              TextSpan(
                                text: '• İletişim:',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              TextSpan(
                                text:
                                    ' Kullanıcının bildirim izni vermesi durumunda, hedeflerini hatırlatmak ve serinin bozulmaması için uyarı göndermek.\n\n',
                                style: TextStyle(),
                              )
                            ],
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
                                  lineHeight: 1.6,
                                ),
                          ),
                          textAlign: TextAlign.start,
                        ),
                        RichText(
                          textScaler: MediaQuery.of(context).textScaler,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: '3. Veri Saklama ve Güvenlik\n\n',
                                style: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      font: GoogleFonts.interTight(
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                              ),
                              TextSpan(
                                text: '• Veritabanı: ',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              TextSpan(
                                text:
                                    'Tüm veriler (kimlik bilgileri, profil bilgileri, hedef verileri ve Google Fit verilerinin özetleri) güvenli bir Bulut Veritabanı olan Google Firebase Firestore üzerinde saklanmaktadır.\n\n',
                                style: TextStyle(),
                              ),
                              TextSpan(
                                text: '• Depolama: ',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              TextSpan(
                                text:
                                    'Kullanıcıların yüklediği profil fotoğrafları Firebase Cloud Storage üzerinde, güvenli erişim kurallarıyla (Security Rules) korunarak saklanmaktadır.\n\n',
                                style: TextStyle(),
                              ),
                              TextSpan(
                                text: '• Veri Koruması: ',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              TextSpan(
                                text:
                                    'Firebase tarafından sağlanan şifreleme ve güvenlik protokolleri kullanılmaktadır. Uygulama geliştiricisi, verilere yetkisiz erişimi engellemek için gerekli önlemleri almıştır.',
                                style: TextStyle(),
                              )
                            ],
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
                                  lineHeight: 1.6,
                                ),
                          ),
                          textAlign: TextAlign.start,
                        ),
                        RichText(
                          textScaler: MediaQuery.of(context).textScaler,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    '4. Verilerin Üçüncü Şahıslarla Paylaşılması\n\n',
                                style: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      font: GoogleFonts.interTight(
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                              ),
                              TextSpan(
                                text:
                                    'Dengele uygulaması, kullanıcı verilerini asla satmaz, kiralamaz veya reklam amaçlı olarak üçüncü şahıslarla paylaşmaz.\n\n',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              TextSpan(
                                text: '• Hukuki Gereklilikler: ',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              TextSpan(
                                text:
                                    'Yalnızca yasal zorunluluklar veya geçerli bir mahkeme kararı durumunda yetkili makamlarla paylaşılabilir.',
                                style: TextStyle(),
                              )
                            ],
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
                                  lineHeight: 1.6,
                                ),
                          ),
                          textAlign: TextAlign.start,
                        ),
                        RichText(
                          textScaler: MediaQuery.of(context).textScaler,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    '5. Google Fit Verilerine Yönelik Özel Hükümler\n\n',
                                style: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      font: GoogleFonts.interTight(
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                              ),
                              TextSpan(
                                text:
                                    'Uygulamamızın Google Fit API\'si aracılığıyla eriştiği veriler (adım sayısı gibi), ',
                                style: TextStyle(),
                              ),
                              TextSpan(
                                text: 'son derece hassas veri \n',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              TextSpan(
                                text: 'olarak kabul edilir.\n\n',
                                style: TextStyle(),
                              ),
                              TextSpan(
                                text: '• Bu veriler, yalnızca kullanıcının ',
                                style: TextStyle(),
                              ),
                              TextSpan(
                                text: '\"Dengele\" ',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              TextSpan(
                                text:
                                    'uygulamasındaki kişisel ilerlemesini takip etmek ve motivasyon sağlamak amacıyla kullanılır.\n\n',
                                style: TextStyle(),
                              ),
                              TextSpan(
                                text:
                                    '• Bu veriler cihazlar arası senkronizasyon haricinde, Google\'ın kısıtlı kullanım gerekliliklerine uygun olarak işlenir.',
                                style: TextStyle(),
                              )
                            ],
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
                                  lineHeight: 1.6,
                                ),
                          ),
                          textAlign: TextAlign.start,
                        ),
                        RichText(
                          textScaler: MediaQuery.of(context).textScaler,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: '6. Kullanıcı Hakları\n\n',
                                style: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      font: GoogleFonts.interTight(
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                              ),
                              TextSpan(
                                text:
                                    'Kullanıcılar, aşağıdaki haklara sahiptir:\n\n',
                                style: TextStyle(),
                              ),
                              TextSpan(
                                text:
                                    '• Uygulama içinde sağladıkları verileri her zaman gözden geçirme ve düzeltme.\n\n',
                                style: TextStyle(),
                              ),
                              TextSpan(
                                text:
                                    '• Hesaplarını ve tüm verilerini (Google Fit\'ten alınan özetler dahil) kalıcı olarak silme. Hesap silindiğinde, tüm veriler veritabanından ve depolama alanından (profil fotoğrafı) kaldırılır.',
                                style: TextStyle(),
                              )
                            ],
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
                                  lineHeight: 1.6,
                                ),
                          ),
                          textAlign: TextAlign.start,
                        ),
                        RichText(
                          textScaler: MediaQuery.of(context).textScaler,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: '7. Şartlarda Değişiklikler\n\n',
                                style: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      font: GoogleFonts.interTight(
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                              ),
                              TextSpan(
                                text:
                                    'Bu Şartları zaman zaman güncelleme hakkımız saklıdır. Önemli değişiklikler Uygulama içinde size bildirilecektir. Değişikliklerden sonra Uygulamayı kullanmaya devam etmeniz, yeni Şartları kabul ettiğiniz anlamına gelir.',
                                style: TextStyle(),
                              )
                            ],
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
                                  lineHeight: 1.6,
                                ),
                          ),
                          textAlign: TextAlign.start,
                        ),
                        RichText(
                          textScaler: MediaQuery.of(context).textScaler,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: '8. Bize Ulaşın\n\n',
                                style: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      font: GoogleFonts.interTight(
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                              ),
                              TextSpan(
                                text:
                                    'Bu Gizlilik Politikası ile ilgili herhangi bir sorunuz varsa, lütfen bizimle şu adresten iletişime geçin:\n\n',
                                style: TextStyle(),
                              ),
                              TextSpan(
                                text: 'Eposta: k4raman.furk4n@gmail.com\n',
                                style: TextStyle(),
                              ),
                              TextSpan(
                                text: 'Telefon: +90 (501) 236 55 73\n',
                                style: TextStyle(),
                              ),
                              TextSpan(
                                text: 'Adres:',
                                style: TextStyle(),
                              )
                            ],
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
                                  lineHeight: 1.6,
                                ),
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ]
                          .divide(SizedBox(height: 24.0))
                          .addToStart(SizedBox(height: 24.0))
                          .addToEnd(SizedBox(height: 120.0)),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(24.0, 20.0, 24.0, 32.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10.0,
                          color: Color(0x1A000000),
                          offset: Offset(
                            0.0,
                            -2.0,
                          ),
                        )
                      ],
                    ),
                    child: FFButtonWidget(
                      onPressed: () async {
                        Navigator.pop(context);
                      },
                      text: 'Kapat',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 52.0,
                        padding: EdgeInsets.all(8.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleMedium.override(
                                  font: GoogleFonts.interTight(
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontStyle,
                                  ),
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .fontStyle,
                                ),
                        elevation: 0.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
