import '/fixos/modo_dark/modo_dark_widget.dart';
import '/fixos/opcao_menu/opcao_menu_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'opcao_menu_cel_widget.dart' show OpcaoMenuCelWidget;
import 'package:flutter/material.dart';

class OpcaoMenuCelModel extends FlutterFlowModel<OpcaoMenuCelWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered = false;
  // Model for modoDark component.
  late ModoDarkModel modoDarkModel;
  // Model for opcaoMenu component.
  late OpcaoMenuModel opcaoMenuModel;

  @override
  void initState(BuildContext context) {
    modoDarkModel = createModel(context, () => ModoDarkModel());
    opcaoMenuModel = createModel(context, () => OpcaoMenuModel());
  }

  @override
  void dispose() {
    modoDarkModel.dispose();
    opcaoMenuModel.dispose();
  }
}
