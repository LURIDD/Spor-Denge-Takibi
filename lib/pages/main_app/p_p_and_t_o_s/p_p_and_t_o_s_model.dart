import '/components/settings_items/privacy_policy_and_terms_of_service/privacy_policy_and_terms_of_service_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'p_p_and_t_o_s_widget.dart' show PPAndTOSWidget;
import 'package:flutter/material.dart';

class PPAndTOSModel extends FlutterFlowModel<PPAndTOSWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for PrivacyPolicyAndTermsOfService component.
  late PrivacyPolicyAndTermsOfServiceModel privacyPolicyAndTermsOfServiceModel;

  @override
  void initState(BuildContext context) {
    privacyPolicyAndTermsOfServiceModel =
        createModel(context, () => PrivacyPolicyAndTermsOfServiceModel());
  }

  @override
  void dispose() {
    privacyPolicyAndTermsOfServiceModel.dispose();
  }
}
