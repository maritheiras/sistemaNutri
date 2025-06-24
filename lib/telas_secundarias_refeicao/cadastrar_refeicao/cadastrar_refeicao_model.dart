import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/telas_secundarias_refeicao/card_alimento_app_state/card_alimento_app_state_widget.dart';
import 'cadastrar_refeicao_widget.dart' show CadastrarRefeicaoWidget;
import 'package:flutter/material.dart';

class CadastrarRefeicaoModel extends FlutterFlowModel<CadastrarRefeicaoWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for tipoRefeicao widget.
  String? tipoRefeicaoValue;
  FormFieldController<String>? tipoRefeicaoValueController;
  // Models for cardAlimentoAppState dynamic component.
  late FlutterFlowDynamicModels<CardAlimentoAppStateModel>
      cardAlimentoAppStateModels;
  // Stores action output result for [Validate Form] action in FloatingActionButton widget.
  bool? resultForm;

  @override
  void initState(BuildContext context) {
    cardAlimentoAppStateModels =
        FlutterFlowDynamicModels(() => CardAlimentoAppStateModel());
  }

  @override
  void dispose() {
    cardAlimentoAppStateModels.dispose();
  }
}
