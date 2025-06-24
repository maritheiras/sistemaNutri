import '/fixos/cabecalho/cabecalho_widget.dart';
import '/fixos/meu_menu/meu_menu_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/telas_secundarias_minha_conta/informacao_perfil_p_c/informacao_perfil_p_c_widget.dart';
import 'package:flutter/material.dart';
import 'minha_conta_model.dart';
export 'minha_conta_model.dart';

class MinhaContaWidget extends StatefulWidget {
  const MinhaContaWidget({super.key});

  static String routeName = 'minhaConta';
  static String routePath = '/minhaConta';

  @override
  State<MinhaContaWidget> createState() => _MinhaContaWidgetState();
}

class _MinhaContaWidgetState extends State<MinhaContaWidget> {
  late MinhaContaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MinhaContaModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).alternate,
      body: SafeArea(
        top: true,
        child: Visibility(
          visible: responsiveVisibility(
            context: context,
            phone: false,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: wrapWithModel(
                      model: _model.meuMenuModel,
                      updateCallback: () => safeSetState(() {}),
                      child: MeuMenuWidget(),
                    ),
                  ),
                ],
              ),
              Flexible(
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      wrapWithModel(
                        model: _model.cabecalhoModel,
                        updateCallback: () => safeSetState(() {}),
                        child: CabecalhoWidget(
                          titulo: 'Minha Conta',
                          subtitulo: 'Gerencie sua conta aqui',
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(0.0, -1.0),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: wrapWithModel(
                                    model: _model.informacaoPerfilPCModel,
                                    updateCallback: () => safeSetState(() {}),
                                    child: InformacaoPerfilPCWidget(),
                                  ),
                                ),
                              ].divide(SizedBox(height: 4.0)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
