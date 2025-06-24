import '/flutter_flow/flutter_flow_util.dart';
import '/telas_secundarias_refeicao/card_alimento_app_state/card_alimento_app_state_widget.dart';
import 'inserir_alimento_refeicao_widget.dart'
    show InserirAlimentoRefeicaoWidget;
import 'package:flutter/material.dart';

class InserirAlimentoRefeicaoModel
    extends FlutterFlowModel<InserirAlimentoRefeicaoWidget> {
  ///  State fields for stateful widgets in this page.

  // Models for cardAlimentoAppState dynamic component.
  late FlutterFlowDynamicModels<CardAlimentoAppStateModel>
      cardAlimentoAppStateModels;

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
