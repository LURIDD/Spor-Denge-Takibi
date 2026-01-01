import '/components/onboarding/height_and_weight/height_and_weight_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'height_and_weight_page_widget.dart' show HeightAndWeightPageWidget;
import 'package:flutter/material.dart';

class HeightAndWeightPageModel
    extends FlutterFlowModel<HeightAndWeightPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for HeightAndWeight component.
  late HeightAndWeightModel heightAndWeightModel;

  @override
  void initState(BuildContext context) {
    heightAndWeightModel = createModel(context, () => HeightAndWeightModel());
  }

  @override
  void dispose() {
    heightAndWeightModel.dispose();
  }
}
