import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/fixos/cabecalho/cabecalho_widget.dart';
import '/fixos/meu_menu/meu_menu_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/telas_secundarias_alimentos/busca_alimento_vazia/busca_alimento_vazia_widget.dart';
import '/telas_secundarias_alimentos/cadastrar_alimento/cadastrar_alimento_widget.dart';
import '/telas_secundarias_alimentos/card_alimento_cadastro/card_alimento_cadastro_widget.dart';
import '/telas_secundarias_alimentos/editar_alimento/editar_alimento_widget.dart';
import '/telas_secundarias_alimentos/lista_alimento_vazia/lista_alimento_vazia_widget.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';
import 'cadastro_alimento_model.dart';
export 'cadastro_alimento_model.dart';

class CadastroAlimentoWidget extends StatefulWidget {
  const CadastroAlimentoWidget({super.key});

  static String routeName = 'cadastroAlimento';
  static String routePath = '/cadastroAlimento';

  @override
  State<CadastroAlimentoWidget> createState() => _CadastroAlimentoWidgetState();
}

class _CadastroAlimentoWidgetState extends State<CadastroAlimentoWidget> {
  late CadastroAlimentoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CadastroAlimentoModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      // Definir status da busca
      FFAppState().buscaAlimento = false;
      FFAppState().ativarPagina = 'Alimentos';
      safeSetState(() {});
    });

    _model.buscaTextController ??= TextEditingController();
    _model.buscaFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<AlimentosRecord>>(
      stream: queryAlimentosRecord(
        parent: currentUserReference,
        queryBuilder: (alimentosRecord) =>
            alimentosRecord.orderBy('nome_alimento'),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).alternate,
            body: Center(
              child: Image.asset(
                'assets/images/Flutter_Logo.png',
                fit: BoxFit.cover,
              ),
            ),
          );
        }
        List<AlimentosRecord> cadastroAlimentoAlimentosRecordList =
            snapshot.data!;

        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).alternate,
          floatingActionButton: Align(
            alignment: AlignmentDirectional(1.0, 1.0),
            child: Builder(
              builder: (context) => Padding(
                padding: EdgeInsets.all(8.0),
                child: FloatingActionButton.extended(
                  onPressed: () async {
                    // Navegar para aba de cadastro
                    await showDialog(
                      context: context,
                      builder: (dialogContext) {
                        return Dialog(
                          elevation: 0,
                          insetPadding: EdgeInsets.zero,
                          backgroundColor: Colors.transparent,
                          alignment: AlignmentDirectional(0.0, 0.0)
                              .resolve(Directionality.of(context)),
                          child: CadastrarAlimentoWidget(),
                        );
                      },
                    );
                  },
                  backgroundColor: FlutterFlowTheme.of(context).primary,
                  elevation: 8.0,
                  label: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add,
                        color: FlutterFlowTheme.of(context).info,
                        size: 24.0,
                      ),
                      if (responsiveVisibility(
                        context: context,
                        phone: false,
                      ))
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              4.0, 0.0, 0.0, 0.0),
                          child: Text(
                            'Cadastrar Alimento',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  color: FlutterFlowTheme.of(context).info,
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: !FlutterFlowTheme.of(context)
                                      .bodyMediumIsCustom,
                                ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          body: SafeArea(
            top: true,
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
                            titulo: 'Alimentos',
                            subtitulo: 'Gerencie e cadastre seus alimentos',
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 8.0, 0.0, 4.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: _model.buscaTextController,
                                  focusNode: _model.buscaFocusNode,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    '_model.buscaTextController',
                                    Duration(milliseconds: 100),
                                    () async {
                                      // Busca simples
                                      safeSetState(() {
                                        _model.simpleSearchResults = TextSearch(
                                          cadastroAlimentoAlimentosRecordList
                                              .map(
                                                (record) =>
                                                    TextSearchItem.fromTerms(
                                                        record, [
                                                  record.nomeAlimento,
                                                  record.unidadeMedida
                                                ]),
                                              )
                                              .toList(),
                                        )
                                            .search(
                                                _model.buscaTextController.text)
                                            .map((r) => r.object)
                                            .toList();
                                        ;
                                      });
                                      // Atualiza o status da busca
                                      FFAppState().buscaAlimento = true;
                                      safeSetState(() {});
                                    },
                                  ),
                                  autofocus: false,
                                  textInputAction: TextInputAction.search,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    hintText: 'Buscar alimentos...',
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          font: GoogleFonts.roboto(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontStyle,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontStyle,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    filled: true,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    prefixIcon: Icon(
                                      Icons.search_sharp,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                    ),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.roboto(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                  validator: _model.buscaTextControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                              if (FFAppState().buscaAlimento)
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      4.0, 0.0, 0.0, 0.0),
                                  child: FlutterFlowIconButton(
                                    borderRadius: 32.0,
                                    buttonSize: 40.0,
                                    icon: Icon(
                                      Icons.close,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 18.0,
                                    ),
                                    onPressed: () async {
                                      // Limpar texto de busca
                                      safeSetState(() {
                                        _model.buscaTextController?.clear();
                                      });
                                      // Atualizar status da busca
                                      FFAppState().buscaAlimento = false;
                                      safeSetState(() {});
                                    },
                                  ),
                                ),
                            ],
                          ),
                        ),
                        if (FFAppState().buscaAlimento)
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      4.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    'Resultado da busca:',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.roboto(
                                            fontWeight: FontWeight.normal,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      4.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    _model.simpleSearchResults.length
                                        .toString(),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.roboto(
                                            fontWeight: FontWeight.normal,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    if (!FFAppState().buscaAlimento)
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 4.0, 0.0, 0.0),
                                        child: Builder(
                                          builder: (context) {
                                            final itensAlimento =
                                                cadastroAlimentoAlimentosRecordList
                                                    .toList();
                                            if (itensAlimento.isEmpty) {
                                              return Center(
                                                child: Container(
                                                  width: 350.0,
                                                  height: 450.0,
                                                  child:
                                                      ListaAlimentoVaziaWidget(),
                                                ),
                                              );
                                            }

                                            return ListView.separated(
                                              padding: EdgeInsets.zero,
                                              primary: false,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount: itensAlimento.length,
                                              separatorBuilder: (_, __) =>
                                                  SizedBox(height: 8.0),
                                              itemBuilder: (context,
                                                  itensAlimentoIndex) {
                                                final itensAlimentoItem =
                                                    itensAlimento[
                                                        itensAlimentoIndex];
                                                return InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    await showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      enableDrag: false,
                                                      context: context,
                                                      builder: (context) {
                                                        return Padding(
                                                          padding: MediaQuery
                                                              .viewInsetsOf(
                                                                  context),
                                                          child:
                                                              EditarAlimentoWidget(
                                                            idAlimento:
                                                                itensAlimentoItem
                                                                    .reference,
                                                          ),
                                                        );
                                                      },
                                                    ).then((value) =>
                                                        safeSetState(() {}));
                                                  },
                                                  child: wrapWithModel(
                                                    model: _model
                                                        .cardAlimentoCadastroModels1
                                                        .getModel(
                                                      itensAlimentoItem
                                                          .idAlimento,
                                                      itensAlimentoIndex,
                                                    ),
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child:
                                                        CardAlimentoCadastroWidget(
                                                      key: Key(
                                                        'Keya5r_${itensAlimentoItem.idAlimento}',
                                                      ),
                                                      nomeAlimento:
                                                          itensAlimentoItem
                                                              .nomeAlimento,
                                                      quantidadePorcao:
                                                          itensAlimentoItem
                                                              .porcao
                                                              .toString(),
                                                      unidadeMedida:
                                                          itensAlimentoItem
                                                              .unidadeMedida,
                                                      icon: Icon(
                                                        Icons.arrow_forward_ios,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        size: 24.0,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    if (FFAppState().buscaAlimento)
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 4.0, 0.0, 0.0),
                                        child: Builder(
                                          builder: (context) {
                                            final itensAlimento = _model
                                                .simpleSearchResults
                                                .map((e) => e)
                                                .toList();
                                            if (itensAlimento.isEmpty) {
                                              return Center(
                                                child: Container(
                                                  width: 350.0,
                                                  height: 450.0,
                                                  child:
                                                      BuscaAlimentoVaziaWidget(),
                                                ),
                                              );
                                            }

                                            return ListView.separated(
                                              padding: EdgeInsets.zero,
                                              primary: false,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount: itensAlimento.length,
                                              separatorBuilder: (_, __) =>
                                                  SizedBox(height: 8.0),
                                              itemBuilder: (context,
                                                  itensAlimentoIndex) {
                                                final itensAlimentoItem =
                                                    itensAlimento[
                                                        itensAlimentoIndex];
                                                return Builder(
                                                  builder: (context) => InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (dialogContext) {
                                                          return Dialog(
                                                            elevation: 0,
                                                            insetPadding:
                                                                EdgeInsets.zero,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            alignment: AlignmentDirectional(
                                                                    0.0, 0.0)
                                                                .resolve(
                                                                    Directionality.of(
                                                                        context)),
                                                            child:
                                                                EditarAlimentoWidget(
                                                              idAlimento:
                                                                  itensAlimentoItem
                                                                      .reference,
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    },
                                                    child: wrapWithModel(
                                                      model: _model
                                                          .cardAlimentoCadastroModels2
                                                          .getModel(
                                                        itensAlimentoItem
                                                            .idAlimento,
                                                        itensAlimentoIndex,
                                                      ),
                                                      updateCallback: () =>
                                                          safeSetState(() {}),
                                                      child:
                                                          CardAlimentoCadastroWidget(
                                                        key: Key(
                                                          'Keysnx_${itensAlimentoItem.idAlimento}',
                                                        ),
                                                        nomeAlimento:
                                                            itensAlimentoItem
                                                                .nomeAlimento,
                                                        quantidadePorcao:
                                                            itensAlimentoItem
                                                                .porcao
                                                                .toString(),
                                                        unidadeMedida:
                                                            itensAlimentoItem
                                                                .unidadeMedida,
                                                        icon: Icon(
                                                          Icons
                                                              .arrow_forward_ios,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          size: 24.0,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                  ],
                                ),
                              ]
                                  .divide(SizedBox(height: 12.0))
                                  .addToStart(SizedBox(height: 18.0)),
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
        );
      },
    );
  }
}
