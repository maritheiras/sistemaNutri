import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/telas_secundarias_refeicao/card_alimento_inserir/card_alimento_inserir_widget.dart';
import 'inserir_alimento_widget.dart' show InserirAlimentoWidget;
import 'package:flutter/material.dart';

class InserirAlimentoModel extends FlutterFlowModel<InserirAlimentoWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for busca widget.
  FocusNode? buscaFocusNode;
  TextEditingController? buscaTextController;
  String? Function(BuildContext, String?)? buscaTextControllerValidator;
  List<AlimentosRecord> simpleSearchResults = [];
  // Models for cardAlimentoInserir dynamic component.
  late FlutterFlowDynamicModels<CardAlimentoInserirModel>
      cardAlimentoInserirModels1;
  // Models for cardAlimentoInserir dynamic component.
  late FlutterFlowDynamicModels<CardAlimentoInserirModel>
      cardAlimentoInserirModels2;

  @override
  void initState(BuildContext context) {
    cardAlimentoInserirModels1 =
        FlutterFlowDynamicModels(() => CardAlimentoInserirModel());
    cardAlimentoInserirModels2 =
        FlutterFlowDynamicModels(() => CardAlimentoInserirModel());
  }

  @override
  void dispose() {
    buscaFocusNode?.dispose();
    buscaTextController?.dispose();

    cardAlimentoInserirModels1.dispose();
    cardAlimentoInserirModels2.dispose();
  }
}
