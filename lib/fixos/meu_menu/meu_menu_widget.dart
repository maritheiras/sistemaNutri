import '/auth/firebase_auth/auth_util.dart';
import '/fixos/modo_dark/modo_dark_widget.dart';
import '/fixos/opcao_menu/opcao_menu_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'meu_menu_model.dart';
export 'meu_menu_model.dart';

class MeuMenuWidget extends StatefulWidget {
  const MeuMenuWidget({super.key});

  @override
  State<MeuMenuWidget> createState() => _MeuMenuWidgetState();
}

class _MeuMenuWidgetState extends State<MeuMenuWidget> {
  late MeuMenuModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MeuMenuModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Visibility(
      visible: responsiveVisibility(
        context: context,
        phone: false,
        tablet: false,
        tabletLandscape: false,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 0.0, 16.0),
        child: Container(
          width: 300.0,
          height: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'assets/images/Flutter_Logo.png',
                    width: 80.0,
                    height: 80.0,
                    fit: BoxFit.contain,
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'MENU',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.roboto(
                              fontWeight: FontWeight.w600,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            color: FlutterFlowTheme.of(context).primary,
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                    Expanded(
                      child: Container(
                        width: 100.0,
                        height: 1.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).alternate,
                        ),
                      ),
                    ),
                  ]
                      .divide(SizedBox(width: 12.0))
                      .addToStart(SizedBox(width: 24.0)),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 8.0, 0.0, 4.0),
                          child: wrapWithModel(
                            model: _model.opcaoMenuModel1,
                            updateCallback: () => safeSetState(() {}),
                            child: OpcaoMenuWidget(
                              titulo: 'Relatórios',
                              ativo: FFAppState().ativarPagina == 'Relatórios',
                              iconeAtivo: Icon(
                                Icons.space_dashboard,
                                color: FlutterFlowTheme.of(context).info,
                                size: 24.0,
                              ),
                              iconeInativo: Icon(
                                Icons.space_dashboard,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                              navegacaoAtivada: () async {
                                context.pushNamed(RelatoriosWidget.routeName);

                                FFAppState().ativarPagina = 'Relatórios';
                                FFAppState().update(() {});
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 4.0, 0.0, 4.0),
                          child: wrapWithModel(
                            model: _model.opcaoMenuModel2,
                            updateCallback: () => safeSetState(() {}),
                            child: OpcaoMenuWidget(
                              titulo: 'Refeições',
                              ativo: FFAppState().ativarPagina == 'Refeições',
                              iconeAtivo: Icon(
                                Icons.flatware_rounded,
                                color: FlutterFlowTheme.of(context).info,
                                size: 24.0,
                              ),
                              iconeInativo: Icon(
                                Icons.flatware_rounded,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                              navegacaoAtivada: () async {
                                context.pushNamed(
                                    CadastroRefeicaoWidget.routeName);

                                FFAppState().ativarPagina = 'Refeições';
                                FFAppState().update(() {});
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 4.0, 0.0, 4.0),
                          child: wrapWithModel(
                            model: _model.opcaoMenuModel3,
                            updateCallback: () => safeSetState(() {}),
                            child: OpcaoMenuWidget(
                              titulo: 'Alimentos',
                              ativo: FFAppState().ativarPagina == 'Alimentos',
                              iconeAtivo: Icon(
                                Icons.fastfood_rounded,
                                color: FlutterFlowTheme.of(context).info,
                                size: 24.0,
                              ),
                              iconeInativo: Icon(
                                Icons.fastfood_rounded,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                              navegacaoAtivada: () async {
                                context.pushNamed(
                                    CadastroAlimentoWidget.routeName);

                                FFAppState().ativarPagina = 'Alimentos';
                                FFAppState().update(() {});
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Flexible(
                  child: Align(
                    alignment: AlignmentDirectional(0.0, 1.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          child: MouseRegion(
                            opaque: false,
                            cursor:
                                SystemMouseCursors.click ?? MouseCursor.defer,
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed(MinhaContaWidget.routeName);

                                FFAppState().ativarPagina = 'Minha Conta';
                                FFAppState().update(() {});
                              },
                              child: Container(
                                width: double.infinity,
                                height: 90.0,
                                decoration: BoxDecoration(
                                  color: () {
                                    if (FFAppState().ativarPagina ==
                                        'Minha Conta') {
                                      return FlutterFlowTheme.of(context)
                                          .alternate;
                                    } else if (_model.mouseRegionHovered) {
                                      return FlutterFlowTheme.of(context)
                                          .alternate;
                                    } else {
                                      return FlutterFlowTheme.of(context)
                                          .secondaryBackground;
                                    }
                                  }(),
                                  borderRadius: BorderRadius.circular(16.0),
                                  border: Border.all(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    width: 1.0,
                                  ),
                                ),
                                child: Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      AuthUserStreamWidget(
                                        builder: (context) => Container(
                                          width: 60.0,
                                          height: 60.0,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.network(
                                            valueOrDefault<String>(
                                              currentUserPhoto,
                                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/sistema-nutri-85xb6d/assets/lazboq70ybse/user.png',
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          AuthUserStreamWidget(
                                            builder: (context) => Text(
                                              valueOrDefault<String>(
                                                currentUserDisplayName,
                                                'Nome Usuario',
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font: GoogleFonts.roboto(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                                    fontSize: 16.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                            ),
                                          ),
                                          Text(
                                            valueOrDefault<String>(
                                              currentUserEmail,
                                              'usuario@email.com',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.roboto(
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .success,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.normal,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ].divide(SizedBox(height: 4.0)),
                                      ),
                                    ]
                                        .divide(SizedBox(width: 16.0))
                                        .addToStart(SizedBox(width: 8.0))
                                        .addToEnd(SizedBox(width: 8.0)),
                                  ),
                                ),
                              ),
                            ),
                            onEnter: ((event) async {
                              safeSetState(
                                  () => _model.mouseRegionHovered = true);
                            }),
                            onExit: ((event) async {
                              safeSetState(
                                  () => _model.mouseRegionHovered = false);
                            }),
                          ),
                        ),
                        wrapWithModel(
                          model: _model.modoDarkModel,
                          updateCallback: () => safeSetState(() {}),
                          child: ModoDarkWidget(),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 4.0, 0.0, 4.0),
                          child: wrapWithModel(
                            model: _model.opcaoMenuModel4,
                            updateCallback: () => safeSetState(() {}),
                            updateOnChange: true,
                            child: OpcaoMenuWidget(
                              titulo: 'Sair',
                              ativo: FFAppState().ativarPagina == 'Sair',
                              iconeAtivo: Icon(
                                Icons.logout_sharp,
                                color: FlutterFlowTheme.of(context).info,
                                size: 24.0,
                              ),
                              iconeInativo: Icon(
                                Icons.logout_sharp,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                              navegacaoAtivada: () async {
                                // Deslogar da conta
                                GoRouter.of(context).prepareAuthEvent();
                                await authManager.signOut();
                                GoRouter.of(context).clearRedirectLocation();

                                context.goNamedAuth(
                                    EntrarWidget.routeName, context.mounted);
                              },
                            ),
                          ),
                        ),
                      ]
                          .divide(SizedBox(height: 16.0))
                          .addToEnd(SizedBox(height: 24.0)),
                    ),
                  ),
                ),
              ]
                  .divide(SizedBox(height: 24.0))
                  .addToStart(SizedBox(height: 24.0)),
            ),
          ),
        ),
      ),
    );
  }
}
