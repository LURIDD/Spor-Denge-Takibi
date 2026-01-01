import '/flutter_flow/flutter_flow_util.dart';
import 'ask_user_name_and_nick_name_widget.dart'
    show AskUserNameAndNickNameWidget;
import 'package:flutter/material.dart';

class AskUserNameAndNickNameModel
    extends FlutterFlowModel<AskUserNameAndNickNameWidget> {
  ///  Local state fields for this component.

  bool showErrors = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for AdTxt widget.
  FocusNode? adTxtFocusNode;
  TextEditingController? adTxtTextController;
  String? Function(BuildContext, String?)? adTxtTextControllerValidator;
  // State field(s) for KullaniciAdiText widget.
  FocusNode? kullaniciAdiTextFocusNode;
  TextEditingController? kullaniciAdiTextTextController;
  String? Function(BuildContext, String?)?
      kullaniciAdiTextTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    adTxtFocusNode?.dispose();
    adTxtTextController?.dispose();

    kullaniciAdiTextFocusNode?.dispose();
    kullaniciAdiTextTextController?.dispose();
  }
}
