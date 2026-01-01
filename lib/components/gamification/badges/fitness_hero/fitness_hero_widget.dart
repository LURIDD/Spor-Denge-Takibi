import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'fitness_hero_model.dart';
export 'fitness_hero_model.dart';

/// Fitness Kahramani Rozeti
class FitnessHeroWidget extends StatefulWidget {
  const FitnessHeroWidget({super.key});

  @override
  State<FitnessHeroWidget> createState() => _FitnessHeroWidgetState();
}

class _FitnessHeroWidgetState extends State<FitnessHeroWidget> {
  late FitnessHeroModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FitnessHeroModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return
        // Fitness Kahramani Rozeti
        Container(
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
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
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
                    gradient: LinearGradient(
                      colors: [Color(0xFFFC4133), Color(0xFFFF7B19)],
                      stops: [0.0, 1.0],
                      begin: AlignmentDirectional(1.0, 1.0),
                      end: AlignmentDirectional(-1.0, -1.0),
                    ),
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      'assets/images/training.png',
                      width: 30.0,
                      height: 30.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Fitness \nKahramanı',
                          style:
                              FlutterFlowTheme.of(context).titleMedium.override(
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
                        Container(
                          width: 50.0,
                          height: 20.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).customGrey,
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            '50 Gün',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodySmall
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .fontStyle,
                                  ),
                                  color: FlutterFlowTheme.of(context).primary,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .fontStyle,
                                ),
                          ),
                        ),
                      ].divide(SizedBox(width: 10.0)),
                    ),
                    Text(
                      'Kriter: 50 gün egzersiz',
                      style: FlutterFlowTheme.of(context).labelMedium.override(
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
                  ],
                ),
              ].divide(SizedBox(width: 10.0)),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                FlutterFlowIconButton(
                  borderRadius: 8.0,
                  buttonSize: 34.0,
                  fillColor: FlutterFlowTheme.of(context).customGrey,
                  icon: Icon(
                    Icons.edit_outlined,
                    color: FlutterFlowTheme.of(context).primary,
                    size: 18.0,
                  ),
                  onPressed: () {
                    print('IconButton pressed ...');
                  },
                ),
                FlutterFlowIconButton(
                  borderRadius: 8.0,
                  buttonSize: 34.0,
                  fillColor: FlutterFlowTheme.of(context).trashcanbackground,
                  icon: FaIcon(
                    FontAwesomeIcons.trashAlt,
                    color: FlutterFlowTheme.of(context).dustbin,
                    size: 18.0,
                  ),
                  onPressed: () {
                    print('IconButton pressed ...');
                  },
                ),
              ].divide(SizedBox(width: 10.0)),
            ),
          ],
        ),
      ),
    );
  }
}
