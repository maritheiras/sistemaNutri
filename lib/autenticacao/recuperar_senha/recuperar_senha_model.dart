import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'recuperar_senha_widget.dart' show RecuperarSenhaWidget;
import 'package:flutter/material.dart';

class RecuperarSenhaModel extends FlutterFlowModel<RecuperarSenhaWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for enderecoEmail widget.
  FocusNode? enderecoEmailFocusNode;
  TextEditingController? enderecoEmailTextController;
  String? Function(BuildContext, String?)? enderecoEmailTextControllerValidator;
  String? _enderecoEmailTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Digite um e-mail válido';
    }
    return null;
  }

  @override
  void initState(BuildContext context) {
    enderecoEmailTextControllerValidator =
        _enderecoEmailTextControllerValidator;
  }

  @override
  void dispose() {
    enderecoEmailFocusNode?.dispose();
    enderecoEmailTextController?.dispose();
  }
}
