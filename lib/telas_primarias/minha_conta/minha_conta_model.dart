import '/fixos/cabecalho/cabecalho_widget.dart';
import '/fixos/meu_menu/meu_menu_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/telas_secundarias_minha_conta/informacao_perfil_p_c/informacao_perfil_p_c_widget.dart';
import 'minha_conta_widget.dart' show MinhaContaWidget;
import 'package:flutter/material.dart';

class MinhaContaModel extends FlutterFlowModel<MinhaContaWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for meuMenu component.
  late MeuMenuModel meuMenuModel;
  // Model for cabecalho component.
  late CabecalhoModel cabecalhoModel;
  // Model for informacaoPerfilPC component.
  late InformacaoPerfilPCModel informacaoPerfilPCModel;

  @override
  void initState(BuildContext context) {
    meuMenuModel = createModel(context, () => MeuMenuModel());
    cabecalhoModel = createModel(context, () => CabecalhoModel());
    informacaoPerfilPCModel =
        createModel(context, () => InformacaoPerfilPCModel());
  }

  @override
  void dispose() {
    meuMenuModel.dispose();
    cabecalhoModel.dispose();
    informacaoPerfilPCModel.dispose();
  }
}
