import '/backend/backend.dart';
import '/fixos/cabecalho/cabecalho_widget.dart';
import '/fixos/meu_menu/meu_menu_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/telas_secundarias_alimentos/card_alimento_cadastro/card_alimento_cadastro_widget.dart';
import 'cadastro_alimento_widget.dart' show CadastroAlimentoWidget;
import 'package:flutter/material.dart';

class CadastroAlimentoModel extends FlutterFlowModel<CadastroAlimentoWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for meuMenu component.
  late MeuMenuModel meuMenuModel;
  // Model for cabecalho component.
  late CabecalhoModel cabecalhoModel;
  // State field(s) for busca widget.
  FocusNode? buscaFocusNode;
  TextEditingController? buscaTextController;
  String? Function(BuildContext, String?)? buscaTextControllerValidator;
  List<AlimentosRecord> simpleSearchResults = [];
  // Models for cardAlimentoCadastro dynamic component.
  late FlutterFlowDynamicModels<CardAlimentoCadastroModel>
      cardAlimentoCadastroModels1;
  // Models for cardAlimentoCadastro dynamic component.
  late FlutterFlowDynamicModels<CardAlimentoCadastroModel>
      cardAlimentoCadastroModels2;

  @override
  void initState(BuildContext context) {
    meuMenuModel = createModel(context, () => MeuMenuModel());
    cabecalhoModel = createModel(context, () => CabecalhoModel());
    cardAlimentoCadastroModels1 =
        FlutterFlowDynamicModels(() => CardAlimentoCadastroModel());
    cardAlimentoCadastroModels2 =
        FlutterFlowDynamicModels(() => CardAlimentoCadastroModel());
  }

  @override
  void dispose() {
    meuMenuModel.dispose();
    cabecalhoModel.dispose();
    buscaFocusNode?.dispose();
    buscaTextController?.dispose();

    cardAlimentoCadastroModels1.dispose();
    cardAlimentoCadastroModels2.dispose();
  }
}
