import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'add_new_badge_model.dart';
export 'add_new_badge_model.dart';

/// Yeni Rozet Ekle
class AddNewBadgeWidget extends StatefulWidget {
  const AddNewBadgeWidget({super.key});

  @override
  State<AddNewBadgeWidget> createState() => _AddNewBadgeWidgetState();
}

class _AddNewBadgeWidgetState extends State<AddNewBadgeWidget> {
  late AddNewBadgeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddNewBadgeModel());
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
      height: 100.0,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            FlutterFlowTheme.of(context).primary,
            FlutterFlowTheme.of(context).secondary
          ],
          stops: [0.0, 1.0],
          begin: AlignmentDirectional(-1.0, 0.0),
          end: AlignmentDirectional(1.0, 0),
        ),
        borderRadius: BorderRadius.circular(18.0),
      ),
      child:
          // Yeni rozet ekleme alani
          Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            Icons.add,
            color: FlutterFlowTheme.of(context).secondaryBackground,
            size: 24.0,
          ),
          Text(
            'Yeni Rozet Ekle',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  font: GoogleFonts.inter(
                    fontWeight:
                        FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  letterSpacing: 0.0,
                  fontWeight:
                      FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                ),
          ),
        ],
      ),
    );
  }
}
