import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'entrar_widget.dart' show EntrarWidget;
import 'package:flutter/material.dart';

class EntrarModel extends FlutterFlowModel<EntrarWidget> {
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

  // State field(s) for senha widget.
  FocusNode? senhaFocusNode;
  TextEditingController? senhaTextController;
  late bool senhaVisibility;
  String? Function(BuildContext, String?)? senhaTextControllerValidator;
  String? _senhaTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    enderecoEmailTextControllerValidator =
        _enderecoEmailTextControllerValidator;
    senhaVisibility = false;
    senhaTextControllerValidator = _senhaTextControllerValidator;
  }

  @override
  void dispose() {
    enderecoEmailFocusNode?.dispose();
    enderecoEmailTextController?.dispose();

    senhaFocusNode?.dispose();
    senhaTextController?.dispose();
  }
}
