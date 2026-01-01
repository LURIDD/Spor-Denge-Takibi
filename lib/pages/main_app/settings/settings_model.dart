import '/components/settings_items/settings_all_user_options/settings_all_user_options_widget.dart';
import '/components/settings_items/settings_profile/settings_profile_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'settings_widget.dart' show SettingsWidget;
import 'package:flutter/material.dart';

class SettingsModel extends FlutterFlowModel<SettingsWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for SettingsProfile component.
  late SettingsProfileModel settingsProfileModel;
  // Model for SettingsAllUserOptions component.
  late SettingsAllUserOptionsModel settingsAllUserOptionsModel;

  @override
  void initState(BuildContext context) {
    settingsProfileModel = createModel(context, () => SettingsProfileModel());
    settingsAllUserOptionsModel =
        createModel(context, () => SettingsAllUserOptionsModel());
  }

  @override
  void dispose() {
    settingsProfileModel.dispose();
    settingsAllUserOptionsModel.dispose();
  }
}
