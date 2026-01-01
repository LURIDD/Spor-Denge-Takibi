import '/flutter_flow/flutter_flow_util.dart';
import 'height_and_weight_widget.dart' show HeightAndWeightWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class HeightAndWeightModel extends FlutterFlowModel<HeightAndWeightWidget> {
  ///  Local state fields for this component.

  bool showErrors = false;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for BoyText widget.
  FocusNode? boyTextFocusNode;
  TextEditingController? boyTextTextController;
  late MaskTextInputFormatter boyTextMask;
  String? Function(BuildContext, String?)? boyTextTextControllerValidator;
  String? _boyTextTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Örn: 175 is required';
    }

    if (val.length < 3) {
      return 'Geçerli rakam girin';
    }
    if (val.length > 3) {
      return 'G';
    }

    return null;
  }

  // State field(s) for KiloText widget.
  FocusNode? kiloTextFocusNode;
  TextEditingController? kiloTextTextController;
  String? Function(BuildContext, String?)? kiloTextTextControllerValidator;

  @override
  void initState(BuildContext context) {
    boyTextTextControllerValidator = _boyTextTextControllerValidator;
  }

  @override
  void dispose() {
    boyTextFocusNode?.dispose();
    boyTextTextController?.dispose();

    kiloTextFocusNode?.dispose();
    kiloTextTextController?.dispose();
  }
}
