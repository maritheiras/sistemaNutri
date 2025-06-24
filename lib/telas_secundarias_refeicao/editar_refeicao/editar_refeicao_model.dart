import '/flutter_flow/flutter_flow_util.dart';
import '/telas_secundarias_refeicao/card_alimento_data_base/card_alimento_data_base_widget.dart';
import '/index.dart';
import 'editar_refeicao_widget.dart' show EditarRefeicaoWidget;
import 'package:flutter/material.dart';

class EditarRefeicaoModel extends FlutterFlowModel<EditarRefeicaoWidget> {
  ///  State fields for stateful widgets in this page.

  // Models for cardAlimentoDataBase dynamic component.
  late FlutterFlowDynamicModels<CardAlimentoDataBaseModel>
      cardAlimentoDataBaseModels;

  @override
  void initState(BuildContext context) {
    cardAlimentoDataBaseModels =
        FlutterFlowDynamicModels(() => CardAlimentoDataBaseModel());
  }

  @override
  void dispose() {
    cardAlimentoDataBaseModels.dispose();
  }
}
