import '/components/onboarding/ask_user_name_and_nick_name/ask_user_name_and_nick_name_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'user_name_page_widget.dart' show UserNamePageWidget;
import 'package:flutter/material.dart';

class UserNamePageModel extends FlutterFlowModel<UserNamePageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for AskUserNameAndNickName component.
  late AskUserNameAndNickNameModel askUserNameAndNickNameModel;

  @override
  void initState(BuildContext context) {
    askUserNameAndNickNameModel =
        createModel(context, () => AskUserNameAndNickNameModel());
  }

  @override
  void dispose() {
    askUserNameAndNickNameModel.dispose();
  }
}
