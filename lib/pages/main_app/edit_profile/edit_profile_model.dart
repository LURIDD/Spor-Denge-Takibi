import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'edit_profile_widget.dart' show EditProfileWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class EditProfileModel extends FlutterFlowModel<EditProfileWidget> {
  ///  Local state fields for this page.

  int boyValue = 210;

  int kiloValue = 130;

  ///  State fields for stateful widgets in this page.

  // State field(s) for UserNameTxt widget.
  FocusNode? userNameTxtFocusNode;
  TextEditingController? userNameTxtTextController;
  String? Function(BuildContext, String?)? userNameTxtTextControllerValidator;
  // State field(s) for DisplayNameTxt widget.
  FocusNode? displayNameTxtFocusNode;
  TextEditingController? displayNameTxtTextController;
  late MaskTextInputFormatter displayNameTxtMask;
  String? Function(BuildContext, String?)?
      displayNameTxtTextControllerValidator;
  // State field(s) for UserAgeTxt widget.
  FocusNode? userAgeTxtFocusNode;
  TextEditingController? userAgeTxtTextController;
  String? Function(BuildContext, String?)? userAgeTxtTextControllerValidator;
  // State field(s) for UserHeightTxt widget.
  FocusNode? userHeightTxtFocusNode;
  TextEditingController? userHeightTxtTextController;
  String? Function(BuildContext, String?)? userHeightTxtTextControllerValidator;
  // State field(s) for UserWeightTxt widget.
  FocusNode? userWeightTxtFocusNode;
  TextEditingController? userWeightTxtTextController;
  String? Function(BuildContext, String?)? userWeightTxtTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    userNameTxtFocusNode?.dispose();
    userNameTxtTextController?.dispose();

    displayNameTxtFocusNode?.dispose();
    displayNameTxtTextController?.dispose();

    userAgeTxtFocusNode?.dispose();
    userAgeTxtTextController?.dispose();

    userHeightTxtFocusNode?.dispose();
    userHeightTxtTextController?.dispose();

    userWeightTxtFocusNode?.dispose();
    userWeightTxtTextController?.dispose();
  }
}
