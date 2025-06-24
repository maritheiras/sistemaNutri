import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'editar_alimento_widget.dart' show EditarAlimentoWidget;
import 'package:flutter/material.dart';

class EditarAlimentoModel extends FlutterFlowModel<EditarAlimentoWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for nomeAlimento widget.
  FocusNode? nomeAlimentoFocusNode;
  TextEditingController? nomeAlimentoTextController;
  String? Function(BuildContext, String?)? nomeAlimentoTextControllerValidator;
  String? _nomeAlimentoTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    if (val.length < 1) {
      return 'Mínimo de caracteres não atingido';
    }
    if (val.length > 100) {
      return 'Máximo de caracteres atingido';
    }

    return null;
  }

  // State field(s) for porcao widget.
  FocusNode? porcaoFocusNode;
  TextEditingController? porcaoTextController;
  String? Function(BuildContext, String?)? porcaoTextControllerValidator;
  String? _porcaoTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    if (val.length < 1) {
      return 'Mínimo de caracteres não atingido';
    }
    if (val.length > 10) {
      return 'Máximo de caracteres atingido';
    }

    return null;
  }

  // State field(s) for unidadeMedida widget.
  String? unidadeMedidaValue;
  FormFieldController<String>? unidadeMedidaValueController;
  // State field(s) for proteina widget.
  FocusNode? proteinaFocusNode;
  TextEditingController? proteinaTextController;
  String? Function(BuildContext, String?)? proteinaTextControllerValidator;
  String? _proteinaTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    if (val.length < 1) {
      return 'Mínimo de caracteres não atingido';
    }
    if (val.length > 5) {
      return 'Máximo de caracteres atingido';
    }

    return null;
  }

  // State field(s) for caloria widget.
  FocusNode? caloriaFocusNode;
  TextEditingController? caloriaTextController;
  String? Function(BuildContext, String?)? caloriaTextControllerValidator;
  String? _caloriaTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    if (val.length < 1) {
      return 'Mínimo de caracteres não atingido';
    }
    if (val.length > 5) {
      return 'Máximo de caracteres atingido';
    }

    return null;
  }

  // State field(s) for carboidrato widget.
  FocusNode? carboidratoFocusNode;
  TextEditingController? carboidratoTextController;
  String? Function(BuildContext, String?)? carboidratoTextControllerValidator;
  String? _carboidratoTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    if (val.length < 1) {
      return 'Mínimo de caracteres não atingido';
    }
    if (val.length > 5) {
      return 'Máximo de caracteres atingido';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    nomeAlimentoTextControllerValidator = _nomeAlimentoTextControllerValidator;
    porcaoTextControllerValidator = _porcaoTextControllerValidator;
    proteinaTextControllerValidator = _proteinaTextControllerValidator;
    caloriaTextControllerValidator = _caloriaTextControllerValidator;
    carboidratoTextControllerValidator = _carboidratoTextControllerValidator;
  }

  @override
  void dispose() {
    nomeAlimentoFocusNode?.dispose();
    nomeAlimentoTextController?.dispose();

    porcaoFocusNode?.dispose();
    porcaoTextController?.dispose();

    proteinaFocusNode?.dispose();
    proteinaTextController?.dispose();

    caloriaFocusNode?.dispose();
    caloriaTextController?.dispose();

    carboidratoFocusNode?.dispose();
    carboidratoTextController?.dispose();
  }
}
