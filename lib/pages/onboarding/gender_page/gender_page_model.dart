import '/components/onboarding/gender/gender_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'gender_page_widget.dart' show GenderPageWidget;
import 'package:flutter/material.dart';

class GenderPageModel extends FlutterFlowModel<GenderPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Gender component.
  late GenderModel genderModel;

  @override
  void initState(BuildContext context) {
    genderModel = createModel(context, () => GenderModel());
  }

  @override
  void dispose() {
    genderModel.dispose();
  }
}
