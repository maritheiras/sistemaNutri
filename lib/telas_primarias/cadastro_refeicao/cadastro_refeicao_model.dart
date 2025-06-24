import '/backend/backend.dart';
import '/fixos/cabecalho/cabecalho_widget.dart';
import '/fixos/meu_menu/meu_menu_widget.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'cadastro_refeicao_widget.dart' show CadastroRefeicaoWidget;
import 'package:flutter/material.dart';

class CadastroRefeicaoModel extends FlutterFlowModel<CadastroRefeicaoWidget> {
  ///  Local state fields for this page.

  DateTime? dataSelecionada;

  ///  State fields for stateful widgets in this page.

  // Model for meuMenu component.
  late MeuMenuModel meuMenuModel;
  // Model for cabecalho component.
  late CabecalhoModel cabecalhoModel;
  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay;
  // Stores action output result for [Firestore Query - Query a collection] action in ButtonRefeicao widget.
  List<RefeicoesRecord>? buscaRefeicao;

  @override
  void initState(BuildContext context) {
    meuMenuModel = createModel(context, () => MeuMenuModel());
    cabecalhoModel = createModel(context, () => CabecalhoModel());
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
  }

  @override
  void dispose() {
    meuMenuModel.dispose();
    cabecalhoModel.dispose();
  }
}
