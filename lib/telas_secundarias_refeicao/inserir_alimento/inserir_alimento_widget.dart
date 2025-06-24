import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/telas_secundarias_alimentos/busca_alimento_vazia/busca_alimento_vazia_widget.dart';
import '/telas_secundarias_alimentos/lista_alimento_vazia/lista_alimento_vazia_widget.dart';
import '/telas_secundarias_refeicao/card_alimento_inserir/card_alimento_inserir_widget.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';
import 'inserir_alimento_model.dart';
export 'inserir_alimento_model.dart';

class InserirAlimentoWidget extends StatefulWidget {
  const InserirAlimentoWidget({super.key});

  @override
  State<InserirAlimentoWidget> createState() => _InserirAlimentoWidgetState();
}

class _InserirAlimentoWidgetState extends State<InserirAlimentoWidget>
    with TickerProviderStateMixin {
  late InserirAlimentoModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InserirAlimentoModel());

    _model.buscaTextController ??= TextEditingController();
    _model.buscaFocusNode ??= FocusNode();

    animationsMap.addAll({
      'columnOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });

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
        tablet: false,
        tabletLandscape: false,
      ),
      child: Align(
        alignment: AlignmentDirectional(0.0, 0.0),
        child: StreamBuilder<List<AlimentosRecord>>(
          stream: queryAlimentosRecord(
            parent: currentUserReference,
            queryBuilder: (alimentosRecord) =>
                alimentosRecord.orderBy('nome_alimento'),
          ),
          builder: (context, snapshot) {
            // Customize what your widget looks like when it's loading.
            if (!snapshot.hasData) {
              return Center(
                child: SizedBox(
                  width: 50.0,
                  height: 50.0,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      FlutterFlowTheme.of(context).accent1,
                    ),
                  ),
                ),
              );
            }
            List<AlimentosRecord> containerAlimentosRecordList = snapshot.data!;

            return SafeArea(
              child: Container(
                width: 1000.0,
                height: 700.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16.0),
                    bottomRight: Radius.circular(16.0),
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 8.0),
                            child: Text(
                              'Inserir Alimento',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.roboto(
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    fontSize: 24.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ),
                          Expanded(
                            child: Align(
                              alignment: AlignmentDirectional(1.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  Navigator.pop(context);
                                },
                                child: Icon(
                                  Icons.keyboard_arrow_down_outlined,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 32.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 16.0, 16.0, 16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 4.0),
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
                                            _model.simpleSearchResults =
                                                TextSearch(
                                              containerAlimentosRecordList
                                                  .map(
                                                    (record) => TextSearchItem
                                                        .fromTerms(record, [
                                                      record.nomeAlimento
                                                    ]),
                                                  )
                                                  .toList(),
                                            )
                                                    .search(_model
                                                        .buscaTextController
                                                        .text)
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
                                                .alternate,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                        ),
                                        filled: true,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .alternate,
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
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                      validator: _model
                                          .buscaTextControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                  if (FFAppState().buscaAlimento)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          4.0, 0.0, 0.0, 0.0),
                                      child: FlutterFlowIconButton(
                                        borderColor: Colors.transparent,
                                        borderRadius: 32.0,
                                        buttonSize: 40.0,
                                        icon: Icon(
                                          Icons.close,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
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
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 4.0, 0.0, 0.0),
                                            child: Builder(
                                              builder: (context) {
                                                final itensAlimento =
                                                    containerAlimentosRecordList
                                                        .toList();
                                                if (itensAlimento.isEmpty) {
                                                  return Center(
                                                    child: Container(
                                                      width: 350.0,
                                                      height: 430.0,
                                                      child:
                                                          ListaAlimentoVaziaWidget(),
                                                    ),
                                                  );
                                                }

                                                return ListView.separated(
                                                  padding: EdgeInsets.zero,
                                                  primary: false,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount:
                                                      itensAlimento.length,
                                                  separatorBuilder: (_, __) =>
                                                      SizedBox(height: 8.0),
                                                  itemBuilder: (context,
                                                      itensAlimentoIndex) {
                                                    final itensAlimentoItem =
                                                        itensAlimento[
                                                            itensAlimentoIndex];
                                                    return wrapWithModel(
                                                      model: _model
                                                          .cardAlimentoInserirModels1
                                                          .getModel(
                                                        itensAlimentoItem
                                                            .reference.id,
                                                        itensAlimentoIndex,
                                                      ),
                                                      updateCallback: () =>
                                                          safeSetState(() {}),
                                                      updateOnChange: true,
                                                      child:
                                                          CardAlimentoInserirWidget(
                                                        key: Key(
                                                          'Keyff9_${itensAlimentoItem.reference.id}',
                                                        ),
                                                        nomeAlimento:
                                                            valueOrDefault<
                                                                String>(
                                                          itensAlimentoItem
                                                              .nomeAlimento,
                                                          'Nome alimento',
                                                        ),
                                                        porcao: valueOrDefault<
                                                            double>(
                                                          itensAlimentoItem
                                                              .porcao,
                                                          0.0,
                                                        ),
                                                        unMed: valueOrDefault<
                                                            String>(
                                                          itensAlimentoItem
                                                              .unidadeMedida,
                                                          'g',
                                                        ),
                                                        caloria: valueOrDefault<
                                                            double>(
                                                          itensAlimentoItem
                                                              .caloria,
                                                          0.0,
                                                        ),
                                                        carboidrato:
                                                            valueOrDefault<
                                                                double>(
                                                          itensAlimentoItem
                                                              .carboidrato,
                                                          0.0,
                                                        ),
                                                        proteina:
                                                            valueOrDefault<
                                                                double>(
                                                          itensAlimentoItem
                                                              .proteina,
                                                          0.0,
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
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
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
                                                      width: 400.0,
                                                      height: 400.0,
                                                      child:
                                                          BuscaAlimentoVaziaWidget(),
                                                    ),
                                                  );
                                                }

                                                return ListView.separated(
                                                  padding: EdgeInsets.zero,
                                                  primary: false,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount:
                                                      itensAlimento.length,
                                                  separatorBuilder: (_, __) =>
                                                      SizedBox(height: 12.0),
                                                  itemBuilder: (context,
                                                      itensAlimentoIndex) {
                                                    final itensAlimentoItem =
                                                        itensAlimento[
                                                            itensAlimentoIndex];
                                                    return wrapWithModel(
                                                      model: _model
                                                          .cardAlimentoInserirModels2
                                                          .getModel(
                                                        itensAlimentoItem
                                                            .reference.id,
                                                        itensAlimentoIndex,
                                                      ),
                                                      updateCallback: () =>
                                                          safeSetState(() {}),
                                                      child:
                                                          CardAlimentoInserirWidget(
                                                        key: Key(
                                                          'Keyz1k_${itensAlimentoItem.reference.id}',
                                                        ),
                                                        nomeAlimento:
                                                            valueOrDefault<
                                                                String>(
                                                          itensAlimentoItem
                                                              .nomeAlimento,
                                                          'Nome alimento',
                                                        ),
                                                        porcao: valueOrDefault<
                                                            double>(
                                                          itensAlimentoItem
                                                              .porcao,
                                                          0.0,
                                                        ),
                                                        unMed: valueOrDefault<
                                                            String>(
                                                          itensAlimentoItem
                                                              .unidadeMedida,
                                                          'g',
                                                        ),
                                                        caloria: valueOrDefault<
                                                            double>(
                                                          itensAlimentoItem
                                                              .caloria,
                                                          0.0,
                                                        ),
                                                        carboidrato:
                                                            valueOrDefault<
                                                                double>(
                                                          itensAlimentoItem
                                                              .carboidrato,
                                                          0.0,
                                                        ),
                                                        proteina:
                                                            valueOrDefault<
                                                                double>(
                                                          itensAlimentoItem
                                                              .proteina,
                                                          0.0,
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
                              ).animateOnPageLoad(
                                  animationsMap['columnOnPageLoadAnimation']!),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ].addToStart(SizedBox(height: 24.0)),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
