import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'criar_conta_widget.dart' show CriarContaWidget;
import 'package:flutter/material.dart';

class CriarContaModel extends FlutterFlowModel<CriarContaWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for nomeUsuario widget.
  FocusNode? nomeUsuarioFocusNode;
  TextEditingController? nomeUsuarioTextController;
  String? Function(BuildContext, String?)? nomeUsuarioTextControllerValidator;
  String? _nomeUsuarioTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    return null;
  }

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

    if (val.length < 6) {
      return 'Mínimo 6 caracteres';
    }
    if (val.length > 12) {
      return 'Máximo 12 caracteres';
    }

    return null;
  }

  // State field(s) for confirmarSenha widget.
  FocusNode? confirmarSenhaFocusNode;
  TextEditingController? confirmarSenhaTextController;
  late bool confirmarSenhaVisibility;
  String? Function(BuildContext, String?)?
      confirmarSenhaTextControllerValidator;
  String? _confirmarSenhaTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    nomeUsuarioTextControllerValidator = _nomeUsuarioTextControllerValidator;
    enderecoEmailTextControllerValidator =
        _enderecoEmailTextControllerValidator;
    senhaVisibility = false;
    senhaTextControllerValidator = _senhaTextControllerValidator;
    confirmarSenhaVisibility = false;
    confirmarSenhaTextControllerValidator =
        _confirmarSenhaTextControllerValidator;
  }

  @override
  void dispose() {
    nomeUsuarioFocusNode?.dispose();
    nomeUsuarioTextController?.dispose();

    enderecoEmailFocusNode?.dispose();
    enderecoEmailTextController?.dispose();

    senhaFocusNode?.dispose();
    senhaTextController?.dispose();

    confirmarSenhaFocusNode?.dispose();
    confirmarSenhaTextController?.dispose();
  }
}
