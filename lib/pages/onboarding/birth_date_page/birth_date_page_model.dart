import '/components/onboarding/birth_date/birth_date_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'birth_date_page_widget.dart' show BirthDatePageWidget;
import 'package:flutter/material.dart';

class BirthDatePageModel extends FlutterFlowModel<BirthDatePageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for BirthDate component.
  late BirthDateModel birthDateModel;

  @override
  void initState(BuildContext context) {
    birthDateModel = createModel(context, () => BirthDateModel());
  }

  @override
  void dispose() {
    birthDateModel.dispose();
  }
}
