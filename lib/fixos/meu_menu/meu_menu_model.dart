import '/fixos/modo_dark/modo_dark_widget.dart';
import '/fixos/opcao_menu/opcao_menu_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'meu_menu_widget.dart' show MeuMenuWidget;
import 'package:flutter/material.dart';

class MeuMenuModel extends FlutterFlowModel<MeuMenuWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for opcaoMenu component.
  late OpcaoMenuModel opcaoMenuModel1;
  // Model for opcaoMenu component.
  late OpcaoMenuModel opcaoMenuModel2;
  // Model for opcaoMenu component.
  late OpcaoMenuModel opcaoMenuModel3;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered = false;
  // Model for modoDark component.
  late ModoDarkModel modoDarkModel;
  // Model for opcaoMenu component.
  late OpcaoMenuModel opcaoMenuModel4;

  @override
  void initState(BuildContext context) {
    opcaoMenuModel1 = createModel(context, () => OpcaoMenuModel());
    opcaoMenuModel2 = createModel(context, () => OpcaoMenuModel());
    opcaoMenuModel3 = createModel(context, () => OpcaoMenuModel());
    modoDarkModel = createModel(context, () => ModoDarkModel());
    opcaoMenuModel4 = createModel(context, () => OpcaoMenuModel());
  }

  @override
  void dispose() {
    opcaoMenuModel1.dispose();
    opcaoMenuModel2.dispose();
    opcaoMenuModel3.dispose();
    modoDarkModel.dispose();
    opcaoMenuModel4.dispose();
  }
}
