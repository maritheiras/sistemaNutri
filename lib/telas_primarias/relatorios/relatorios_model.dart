import '/backend/backend.dart';
import '/fixos/cabecalho/cabecalho_widget.dart';
import '/fixos/meu_menu/meu_menu_widget.dart';
import '/fixos/unidade_cards_celular/unidade_cards_celular_widget.dart';
import '/fixos/unidade_cards_p_c/unidade_cards_p_c_widget.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'relatorios_widget.dart' show RelatoriosWidget;
import 'package:flutter/material.dart';

class RelatoriosModel extends FlutterFlowModel<RelatoriosWidget> {
  ///  Local state fields for this page.

  DateTime? dataInicial;

  DateTime? dataFinal;

  bool clickFiltro = false;

  ///  State fields for stateful widgets in this page.

  // Model for meuMenu component.
  late MeuMenuModel meuMenuModel;
  // Model for cabecalho component.
  late CabecalhoModel cabecalhoModel;
  DateTime? datePicked1;
  DateTime? datePicked2;
  // Stores action output result for [Firestore Query - Query a collection] action in ButtonFiltro widget.
  List<RefeicoesRecord>? filtroRelatorio;
  // Model for unidadeCardsCelular component.
  late UnidadeCardsCelularModel unidadeCardsCelularModel1;
  // Model for unidadeCardsCelular component.
  late UnidadeCardsCelularModel unidadeCardsCelularModel2;
  // Model for unidadeCardsCelular component.
  late UnidadeCardsCelularModel unidadeCardsCelularModel3;
  // Model for unidadeCardsPC component.
  late UnidadeCardsPCModel unidadeCardsPCModel1;
  // Model for unidadeCardsPC component.
  late UnidadeCardsPCModel unidadeCardsPCModel2;
  // Model for unidadeCardsPC component.
  late UnidadeCardsPCModel unidadeCardsPCModel3;
  // State field(s) for tabelaRefeicoes widget.
  final tabelaRefeicoesController =
      FlutterFlowDataTableController<RefeicoesRecord>();

  @override
  void initState(BuildContext context) {
    meuMenuModel = createModel(context, () => MeuMenuModel());
    cabecalhoModel = createModel(context, () => CabecalhoModel());
    unidadeCardsCelularModel1 =
        createModel(context, () => UnidadeCardsCelularModel());
    unidadeCardsCelularModel2 =
        createModel(context, () => UnidadeCardsCelularModel());
    unidadeCardsCelularModel3 =
        createModel(context, () => UnidadeCardsCelularModel());
    unidadeCardsPCModel1 = createModel(context, () => UnidadeCardsPCModel());
    unidadeCardsPCModel2 = createModel(context, () => UnidadeCardsPCModel());
    unidadeCardsPCModel3 = createModel(context, () => UnidadeCardsPCModel());
  }

  @override
  void dispose() {
    meuMenuModel.dispose();
    cabecalhoModel.dispose();
    unidadeCardsCelularModel1.dispose();
    unidadeCardsCelularModel2.dispose();
    unidadeCardsCelularModel3.dispose();
    unidadeCardsPCModel1.dispose();
    unidadeCardsPCModel2.dispose();
    unidadeCardsPCModel3.dispose();
    tabelaRefeicoesController.dispose();
  }
}
