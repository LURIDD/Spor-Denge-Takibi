import '/auth/firebase_auth/auth_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'achievement_badges_model.dart';
export 'achievement_badges_model.dart';

/// Basari Rozetleri
class AchievementBadgesWidget extends StatefulWidget {
  const AchievementBadgesWidget({super.key});

  @override
  State<AchievementBadgesWidget> createState() =>
      _AchievementBadgesWidgetState();
}

class _AchievementBadgesWidgetState extends State<AchievementBadgesWidget> {
  late AchievementBadgesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AchievementBadgesModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).customGrey,
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
        padding: EdgeInsets.all(18.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                FaIcon(
                  FontAwesomeIcons.award,
                  color: FlutterFlowTheme.of(context).primary,
                  size: 24.0,
                ),
                Text(
                  'Başarı Rozetleri',
                  style: FlutterFlowTheme.of(context).titleLarge,
                ),
              ].divide(SizedBox(width: 10.0)),
            ),
            SizedBox(height: 15),
            StreamBuilder<List<BadgesRecord>>(
              stream: queryBadgesRecord(
                queryBuilder: (badgesRecord) =>
                    badgesRecord.orderBy('created_time'),
              ),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }
                final badgesList = snapshot.data!;

                return StreamBuilder<List<UserBadgesRecord>>(
                  stream: queryUserBadgesRecord(
                    parent: currentUserReference,
                  ),
                  builder: (context, userBadgesSnapshot) {
                    if (!userBadgesSnapshot.hasData) {
                      return Center(child: CircularProgressIndicator());
                    }
                    final userBadges = userBadgesSnapshot.data!;

                    return StreamBuilder<List<UserGoalsRecord>>(
                      stream: queryUserGoalsRecord(
                        parent: currentUserReference,
                      ),
                      builder: (context, userGoalsSnapshot) {
                        if (!userGoalsSnapshot.hasData) {
                          return Center(child: CircularProgressIndicator());
                        }
                        final userGoals = userGoalsSnapshot.data!;

                        return ListView.separated(
                          padding: EdgeInsets.zero,
                          primary: false,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: badgesList.length,
                          separatorBuilder: (_, __) => SizedBox(height: 15),
                          itemBuilder: (context, index) {
                            final badge = badgesList[index];
                            final userBadge = userBadges.firstWhereOrNull(
                                (e) => e.badgeRef == badge.reference);
                            final isUnlocked = userBadge?.status == 'unlocked';

                            // --- DİNAMİK İLERLEME HESAPLAMASI ---
                            int target = badge.target;
                            // Hedef 0 ise metinden ayrıştırmayı dene (Action ile tutarlılık)
                            if (target == 0) {
                              final RegExp numRegExp = RegExp(r'(\d+)');
                              final match =
                                  numRegExp.firstMatch(badge.criteria);
                              if (match != null) {
                                target = int.tryParse(match.group(1)!) ?? 15;
                              } else {
                                target = 15; // Varsayılan geri dönüş
                              }
                            }

                            int currentProgress = 0;

                            if (isUnlocked) {
                              // Eğer kilit açılmışsa, maksimum say veya saklanan ilerlemeyi kullan
                              currentProgress = target;
                            } else {
                              // Kilitli Rozetler İçin Canlı İlerleme Hesapla
                              String name = badge.name.toLowerCase();
                              String criteria = badge.criteria.toLowerCase();

                              // 1. Küresel Seri (Streak) Kontrolü
                              if (name.contains('seri') ||
                                  name.contains('streak') ||
                                  criteria.contains('seri') ||
                                  criteria.contains('streak')) {
                                // Küresel Kullanıcı Serisini Kullan - KALICILIK DÜZELTMESİ
                                // Varsa highestStreak, yoksa current veya streak'in maksimumunu al
                                int bestStreak =
                                    currentUserDocument?.highestStreak ?? 0;
                                int current =
                                    currentUserDocument?.currentStreak ?? 0;
                                int streak = currentUserDocument?.streak ?? 0;

                                if (current > bestStreak) bestStreak = current;
                                if (streak > bestStreak) bestStreak = streak;

                                currentProgress = bestStreak;
                              }
                              // 2. Dinamik Hedef Eşleştirme
                              else {
                                final matchingGoal =
                                    userGoals.firstWhereOrNull((goal) {
                                  final goalName = goal.goalName.toLowerCase();

                                  // Sağlamlık için Özel Anahtar Kelime Eşleşmesi
                                  if (name.contains('su') &&
                                      goalName.contains('su')) return true;
                                  if ((name.contains('egzersiz') ||
                                          name.contains('spor')) &&
                                      (goalName.contains('egzersiz') ||
                                          goalName.contains('spor')))
                                    return true;
                                  if (name.contains('kitap') &&
                                      goalName.contains('kitap')) return true;
                                  if (name.contains('meditasyon') &&
                                      goalName.contains('meditasyon'))
                                    return true;
                                  if (name.contains('uyku') &&
                                      goalName.contains('uyku')) return true;

                                  // Genel içerik eşleşmesine geri dönüş
                                  return goalName.contains(name) ||
                                      name.contains(goalName);
                                });

                                if (matchingGoal != null) {
                                  // currentStreak mi longestStreak mi kullanılmalı?
                                  // "Hedefi Tamamla" genellikle mevcut seriyi veya sadece o anki tamamlamayı ima eder.
                                  // Eğer rozet tutarlılık (seri) içinse, longestStreak (en iyi kayıt) kullanılır.
                                  // "15 Gün Su" için longestStreak adildir.
                                  // Ancak kullanıcı "No progress" hatasından şikayetçi olabilir.
                                  // İkisini de kontrol edip maksimum olanı almak en cömert/sağlam yoldur.
                                  currentProgress = matchingGoal.longestStreak;
                                  if (matchingGoal.currentStreak >
                                      currentProgress) {
                                    currentProgress =
                                        matchingGoal.currentStreak;
                                  }
                                }
                              }
                            }

                            // İlerlemeyi sınırla (Clamp)
                            if (currentProgress > target) {
                              currentProgress = target;
                            }

                            // GÖRSEL KİLİT AÇMA MANTIĞI:
                            // userBadges kaydı henüz olmasa bile, eğer ilerleme >= hedef ise kilit açık gibi göster.
                            bool isVisuallyUnlocked = isUnlocked;
                            if (!isVisuallyUnlocked &&
                                currentProgress >= target &&
                                target > 0) {
                              isVisuallyUnlocked = true;
                            }

                            final double percent = target > 0
                                ? (currentProgress / target).clamp(0.0, 1.0)
                                : 0.0;

                            return Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                borderRadius: BorderRadius.circular(18.0),
                                border: Border.all(
                                  color: isVisuallyUnlocked
                                      ? FlutterFlowTheme.of(context).secondary
                                      : Color(0xFFE5E5E5),
                                  width: 3.0,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 20.0, 12.0, 20.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                width: 50.0,
                                                height: 50.0,
                                                decoration: BoxDecoration(
                                                  color: isVisuallyUnlocked
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .secondary
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .customGrey,
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
                                                          return CachedNetworkImage(
                                                            imageUrl:
                                                                badge.image,
                                                            width: 36.0,
                                                            height: 36.0,
                                                            fit: BoxFit.cover,
                                                            placeholder: (_, __) => Icon(
                                                                Icons.shield,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText),
                                                            errorWidget: (_, __,
                                                                    ___) =>
                                                                Icon(
                                                                    Icons
                                                                        .shield,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .error),
                                                          );
                                                        } else if (badge.image
                                                            .startsWith(
                                                                'assets/')) {
                                                          return Image.asset(
                                                            badge.image,
                                                            width: 36.0,
                                                            height: 36.0,
                                                            fit: BoxFit.cover,
                                                            errorBuilder: (context,
                                                                    error,
                                                                    stackTrace) =>
                                                                Icon(Icons
                                                                    .shield),
                                                          );
                                                        }
                                                      }

                                                      // Fallback logic
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
                                                        width: 36.0,
                                                        height: 36.0,
                                                        fit: BoxFit.cover,
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                              SizedBox(width: 10),
                                              Expanded(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      badge.name,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleMedium,
                                                    ),
                                                    Text(
                                                      badge.description,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium,
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 5.0),
                                                      child: Text(
                                                        isVisuallyUnlocked
                                                            ? 'Tamamlandı! ($target/$target)'
                                                            : 'İlerleme: $currentProgress/$target',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              font: GoogleFonts
                                                                  .inter(),
                                                              color: isVisuallyUnlocked
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                              fontSize: 12.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        if (isVisuallyUnlocked)
                                          Container(
                                            width: 30.0,
                                            height: 30.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              borderRadius:
                                                  BorderRadius.circular(24.0),
                                            ),
                                            child: Icon(
                                              Icons.check,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              size: 18.0,
                                            ),
                                          ),
                                      ],
                                    ),
                                    if (target > 0)
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 10.0, 0.0, 0.0),
                                        child: LinearPercentIndicator(
                                          percent: percent,
                                          lineHeight: 12.0,
                                          animation: true,
                                          animateFromLastPercent: true,
                                          progressColor: isVisuallyUnlocked
                                              ? FlutterFlowTheme.of(context)
                                                  .secondary
                                              : FlutterFlowTheme.of(context)
                                                  .primary,
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .customGrey,
                                          barRadius: Radius.circular(25.0),
                                          padding: EdgeInsets.zero,
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
