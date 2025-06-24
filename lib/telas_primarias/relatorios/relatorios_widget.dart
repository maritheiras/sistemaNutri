import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/fixos/cabecalho/cabecalho_widget.dart';
import '/fixos/meu_menu/meu_menu_widget.dart';
import '/fixos/unidade_cards_celular/unidade_cards_celular_widget.dart';
import '/fixos/unidade_cards_p_c/unidade_cards_p_c_widget.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'relatorios_model.dart';
export 'relatorios_model.dart';

class RelatoriosWidget extends StatefulWidget {
  const RelatoriosWidget({super.key});

  static String routeName = 'relatorios';
  static String routePath = '/relatorios';

  @override
  State<RelatoriosWidget> createState() => _RelatoriosWidgetState();
}

class _RelatoriosWidgetState extends State<RelatoriosWidget> {
  late RelatoriosModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RelatoriosModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      // "Pintar" o menu Relatorios
      FFAppState().ativarPagina = 'Relatórios';
      safeSetState(() {});
      // Definir o filtro com a data atual
      _model.dataInicial = getCurrentTimestamp;
      _model.dataFinal = getCurrentTimestamp;
      safeSetState(() {});
    });

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

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).alternate,
      body: SafeArea(
        top: true,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                if (responsiveVisibility(
                  context: context,
                  phone: false,
                  tablet: false,
                  tabletLandscape: false,
                ))
                  Expanded(
                    child: wrapWithModel(
                      model: _model.meuMenuModel,
                      updateCallback: () => safeSetState(() {}),
                      child: MeuMenuWidget(),
                    ),
                  ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    wrapWithModel(
                      model: _model.cabecalhoModel,
                      updateCallback: () => safeSetState(() {}),
                      child: CabecalhoWidget(
                        titulo: 'Relatórios',
                        subtitulo: 'Gerencie e visualize o painel ',
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(
                          valueOrDefault<double>(
                            () {
                              if (MediaQuery.sizeOf(context).width <
                                  kBreakpointSmall) {
                                return 0.0;
                              } else if (MediaQuery.sizeOf(context).width <
                                  kBreakpointMedium) {
                                return 0.0;
                              } else if (MediaQuery.sizeOf(context).width <
                                  kBreakpointLarge) {
                                return 1.0;
                              } else {
                                return 1.0;
                              }
                            }(),
                            1.0,
                          ),
                          0.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
                        child: Container(
                          width: 330.0,
                          height: 45.0,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            borderRadius: BorderRadius.circular(16.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                            ),
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 8.0,
                                    borderWidth: 1.0,
                                    buttonSize: 40.0,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    icon: Icon(
                                      Icons.calendar_month,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 24.0,
                                    ),
                                    onPressed: () async {
                                      // Abrir o calendário
                                      final _datePicked1Date =
                                          await showDatePicker(
                                        context: context,
                                        initialDate: (_model.dataInicial ??
                                            DateTime.now()),
                                        firstDate: DateTime(1900),
                                        lastDate: DateTime(2050),
                                        builder: (context, child) {
                                          return wrapInMaterialDatePickerTheme(
                                            context,
                                            child!,
                                            headerBackgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            headerForegroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .info,
                                            headerTextStyle:
                                                FlutterFlowTheme.of(context)
                                                    .headlineLarge
                                                    .override(
                                                      fontFamily: FlutterFlowTheme
                                                              .of(context)
                                                          .headlineLargeFamily,
                                                      fontSize: 32.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineLargeIsCustom,
                                                    ),
                                            pickerBackgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            pickerForegroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            selectedDateTimeBackgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            selectedDateTimeForegroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .info,
                                            actionButtonForegroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            iconSize: 24.0,
                                          );
                                        },
                                      );

                                      if (_datePicked1Date != null) {
                                        safeSetState(() {
                                          _model.datePicked1 = DateTime(
                                            _datePicked1Date.year,
                                            _datePicked1Date.month,
                                            _datePicked1Date.day,
                                          );
                                        });
                                      } else if (_model.datePicked1 != null) {
                                        safeSetState(() {
                                          _model.datePicked1 =
                                              _model.dataInicial;
                                        });
                                      }
                                      // Atualizar variavel dataInicial
                                      _model.dataInicial = _model.datePicked1;
                                      safeSetState(() {});
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    dateTimeFormat(
                                      "dd/MM/y",
                                      _model.dataInicial,
                                      locale: FFLocalizations.of(context)
                                          .languageCode,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          letterSpacing: 0.0,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .bodyMediumIsCustom,
                                        ),
                                  ),
                                ),
                                SizedBox(
                                  height: 32.0,
                                  child: VerticalDivider(
                                    indent: 0.5,
                                    endIndent: 0.5,
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 8.0,
                                    borderWidth: 1.0,
                                    buttonSize: 40.0,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    icon: Icon(
                                      Icons.calendar_month,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 24.0,
                                    ),
                                    onPressed: () async {
                                      // Abrir calendário
                                      final _datePicked2Date =
                                          await showDatePicker(
                                        context: context,
                                        initialDate: (_model.dataFinal ??
                                            DateTime.now()),
                                        firstDate: DateTime(1900),
                                        lastDate: DateTime(2050),
                                        builder: (context, child) {
                                          return wrapInMaterialDatePickerTheme(
                                            context,
                                            child!,
                                            headerBackgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            headerForegroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .info,
                                            headerTextStyle:
                                                FlutterFlowTheme.of(context)
                                                    .headlineLarge
                                                    .override(
                                                      fontFamily: FlutterFlowTheme
                                                              .of(context)
                                                          .headlineLargeFamily,
                                                      fontSize: 32.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineLargeIsCustom,
                                                    ),
                                            pickerBackgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            pickerForegroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            selectedDateTimeBackgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            selectedDateTimeForegroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .info,
                                            actionButtonForegroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            iconSize: 24.0,
                                          );
                                        },
                                      );

                                      if (_datePicked2Date != null) {
                                        safeSetState(() {
                                          _model.datePicked2 = DateTime(
                                            _datePicked2Date.year,
                                            _datePicked2Date.month,
                                            _datePicked2Date.day,
                                          );
                                        });
                                      } else if (_model.datePicked2 != null) {
                                        safeSetState(() {
                                          _model.datePicked2 = _model.dataFinal;
                                        });
                                      }
                                      // Atualizar variavel dataFinal
                                      _model.dataFinal = _model.datePicked2;
                                      safeSetState(() {});
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    dateTimeFormat(
                                      "dd/MM/y",
                                      _model.dataFinal,
                                      locale: FFLocalizations.of(context)
                                          .languageCode,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          letterSpacing: 0.0,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .bodyMediumIsCustom,
                                        ),
                                  ),
                                ),
                                FlutterFlowIconButton(
                                  borderColor:
                                      FlutterFlowTheme.of(context).primary,
                                  borderRadius: 16.0,
                                  borderWidth: 2.0,
                                  buttonSize: 45.0,
                                  fillColor: Color(0xD34B39EF),
                                  icon: Icon(
                                    Icons.filter_alt,
                                    color: FlutterFlowTheme.of(context).info,
                                    size: 24.0,
                                  ),
                                  showLoadingIndicator: true,
                                  onPressed: () async {
                                    if ((_model.dataInicial != null) &&
                                        (_model.dataFinal != null)) {
                                      // Busca banco de dados com filtro
                                      _model.filtroRelatorio =
                                          await queryRefeicoesRecordOnce(
                                        parent: currentUserReference,
                                        queryBuilder: (refeicoesRecord) =>
                                            refeicoesRecord
                                                .where(
                                                  'data_refeicao',
                                                  isGreaterThanOrEqualTo:
                                                      _model.dataInicial,
                                                )
                                                .where(
                                                  'data_refeicao',
                                                  isLessThanOrEqualTo:
                                                      _model.dataFinal,
                                                ),
                                      );
                                      // Atualizar appstate
                                      _model.clickFiltro = true;
                                      safeSetState(() {});
                                    } else {
                                      // Informação para usuario preencher a data
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: Text('Atenção'),
                                            content: Text(
                                                'Alguma data não foi selecionada, favor selecionar.'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
                                                child: Text('Ok'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    }

                                    safeSetState(() {});
                                  },
                                ),
                              ]
                                  .divide(SizedBox(width: 4.0))
                                  .addToStart(SizedBox(width: 4.0)),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 7,
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (responsiveVisibility(
                              context: context,
                              tablet: false,
                              tabletLandscape: false,
                              desktop: false,
                            ))
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  if (responsiveVisibility(
                                    context: context,
                                    tablet: false,
                                    tabletLandscape: false,
                                    desktop: false,
                                  ))
                                    wrapWithModel(
                                      model: _model.unidadeCardsCelularModel1,
                                      updateCallback: () => safeSetState(() {}),
                                      child: UnidadeCardsCelularWidget(
                                        icone: FaIcon(
                                          FontAwesomeIcons.fish,
                                          color:
                                              FlutterFlowTheme.of(context).info,
                                          size: 24.0,
                                        ),
                                        cor: FlutterFlowTheme.of(context)
                                            .tertiary,
                                        titulo: valueOrDefault<String>(
                                          _model.clickFiltro == true
                                              ? valueOrDefault<String>(
                                                  functions
                                                      .somarTotalProteina(_model
                                                          .filtroRelatorio!
                                                          .toList())
                                                      .toString(),
                                                  '0',
                                                )
                                              : '0',
                                          '0',
                                        ),
                                        descricao: 'Total Proteína',
                                      ),
                                    ),
                                  if (responsiveVisibility(
                                    context: context,
                                    tablet: false,
                                    tabletLandscape: false,
                                    desktop: false,
                                  ))
                                    wrapWithModel(
                                      model: _model.unidadeCardsCelularModel2,
                                      updateCallback: () => safeSetState(() {}),
                                      child: UnidadeCardsCelularWidget(
                                        icone: FaIcon(
                                          FontAwesomeIcons.appleAlt,
                                          color:
                                              FlutterFlowTheme.of(context).info,
                                          size: 24.0,
                                        ),
                                        cor: FlutterFlowTheme.of(context)
                                            .secondary,
                                        titulo: valueOrDefault<String>(
                                          _model.clickFiltro == true
                                              ? valueOrDefault<String>(
                                                  functions
                                                      .somarTotalCaloria(_model
                                                          .filtroRelatorio!
                                                          .toList())
                                                      .toString(),
                                                  '0',
                                                )
                                              : '0',
                                          '0',
                                        ),
                                        descricao: 'Total Caloria',
                                      ),
                                    ),
                                  if (responsiveVisibility(
                                    context: context,
                                    tablet: false,
                                    tabletLandscape: false,
                                    desktop: false,
                                  ))
                                    wrapWithModel(
                                      model: _model.unidadeCardsCelularModel3,
                                      updateCallback: () => safeSetState(() {}),
                                      child: UnidadeCardsCelularWidget(
                                        icone: FaIcon(
                                          FontAwesomeIcons.breadSlice,
                                          color:
                                              FlutterFlowTheme.of(context).info,
                                          size: 24.0,
                                        ),
                                        cor: FlutterFlowTheme.of(context)
                                            .warning,
                                        titulo: valueOrDefault<String>(
                                          _model.clickFiltro == true
                                              ? functions
                                                  .somarTotalCarboidrato(_model
                                                      .filtroRelatorio!
                                                      .toList())
                                                  .toString()
                                              : '0',
                                          '0',
                                        ),
                                        descricao: 'Total Carboidrato',
                                      ),
                                    ),
                                ].divide(SizedBox(height: 12.0)),
                              ),
                            if (responsiveVisibility(
                              context: context,
                              phone: false,
                              tablet: false,
                              tabletLandscape: false,
                            ))
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (responsiveVisibility(
                                    context: context,
                                    phone: false,
                                    tablet: false,
                                    tabletLandscape: false,
                                  ))
                                    Expanded(
                                      flex: 1,
                                      child: wrapWithModel(
                                        model: _model.unidadeCardsPCModel1,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: UnidadeCardsPCWidget(
                                          icone: FaIcon(
                                            FontAwesomeIcons.fish,
                                            color: FlutterFlowTheme.of(context)
                                                .info,
                                            size: 26.0,
                                          ),
                                          cor: FlutterFlowTheme.of(context)
                                              .tertiary,
                                          titulo: valueOrDefault<String>(
                                            _model.clickFiltro == true
                                                ? valueOrDefault<String>(
                                                    functions
                                                        .somarTotalProteina(
                                                            _model
                                                                .filtroRelatorio!
                                                                .toList())
                                                        .toString(),
                                                    '0',
                                                  )
                                                : '0',
                                            '0',
                                          ),
                                          descricao: 'Total Proteína',
                                        ),
                                      ),
                                    ),
                                  if (responsiveVisibility(
                                    context: context,
                                    phone: false,
                                    tablet: false,
                                    tabletLandscape: false,
                                  ))
                                    Expanded(
                                      child: wrapWithModel(
                                        model: _model.unidadeCardsPCModel2,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: UnidadeCardsPCWidget(
                                          icone: FaIcon(
                                            FontAwesomeIcons.appleAlt,
                                            color: FlutterFlowTheme.of(context)
                                                .info,
                                            size: 26.0,
                                          ),
                                          cor: FlutterFlowTheme.of(context)
                                              .secondary,
                                          titulo: valueOrDefault<String>(
                                            _model.clickFiltro == true
                                                ? valueOrDefault<String>(
                                                    functions
                                                        .somarTotalCaloria(_model
                                                            .filtroRelatorio!
                                                            .toList())
                                                        .toString(),
                                                    '0',
                                                  )
                                                : '0',
                                            '0',
                                          ),
                                          descricao: 'Total Caloria',
                                        ),
                                      ),
                                    ),
                                  if (responsiveVisibility(
                                    context: context,
                                    phone: false,
                                    tablet: false,
                                    tabletLandscape: false,
                                  ))
                                    Expanded(
                                      child: wrapWithModel(
                                        model: _model.unidadeCardsPCModel3,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: UnidadeCardsPCWidget(
                                          icone: FaIcon(
                                            FontAwesomeIcons.breadSlice,
                                            color: FlutterFlowTheme.of(context)
                                                .info,
                                            size: 26.0,
                                          ),
                                          cor: FlutterFlowTheme.of(context)
                                              .warning,
                                          titulo: valueOrDefault<String>(
                                            _model.clickFiltro == true
                                                ? functions
                                                    .somarTotalCarboidrato(
                                                        _model.filtroRelatorio!
                                                            .toList())
                                                    .toString()
                                                : '0',
                                            '0',
                                          ),
                                          descricao: 'Total Carboidrato',
                                        ),
                                      ),
                                    ),
                                ].divide(SizedBox(width: 24.0)),
                              ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 24.0, 0.0, 0.0),
                              child: Flex(
                                direction:
                                    (MediaQuery.sizeOf(context).width >= 480.0)
                                        ? Axis.horizontal
                                        : Axis.vertical,
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: () {
                                      if (MediaQuery.sizeOf(context).width ==
                                          1440.0) {
                                        return 350.0;
                                      } else if (MediaQuery.sizeOf(context)
                                              .width ==
                                          1920.0) {
                                        return 510.0;
                                      } else {
                                        return 350.0;
                                      }
                                    }(),
                                    height: () {
                                      if (MediaQuery.sizeOf(context).height ==
                                          900.0) {
                                        return 485.0;
                                      } else if (MediaQuery.sizeOf(context)
                                              .height ==
                                          1080.0) {
                                        return 665.0;
                                      } else {
                                        return 485.0;
                                      }
                                    }(),
                                    constraints: BoxConstraints(
                                      minWidth: 350.0,
                                      minHeight: 485.0,
                                      maxWidth: 510.0,
                                      maxHeight: 665.0,
                                    ),
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(16.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(-1.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Resumo Geral',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font:
                                                            GoogleFonts.roboto(
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
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                                Text(
                                                  'Status de consumo (%)',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font:
                                                            GoogleFonts.roboto(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ]
                                                  .divide(SizedBox(height: 2.0))
                                                  .addToEnd(
                                                      SizedBox(height: 4.0)),
                                            ),
                                          ),
                                          Expanded(
                                            child: Stack(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 12.0,
                                                                0.0, 12.0),
                                                    child: Container(
                                                      width: 250.0,
                                                      height: 250.0,
                                                      child:
                                                          FlutterFlowPieChart(
                                                        data: FFPieChartData(
                                                          values: [
                                                            valueOrDefault<
                                                                String>(
                                                              _model.clickFiltro ==
                                                                      true
                                                                  ? valueOrDefault<
                                                                      String>(
                                                                      functions
                                                                          .porcTotalProteina(_model
                                                                              .filtroRelatorio!
                                                                              .toList())
                                                                          .toString(),
                                                                      '0',
                                                                    )
                                                                  : '0',
                                                              '0',
                                                            ),
                                                            valueOrDefault<
                                                                String>(
                                                              _model.clickFiltro ==
                                                                      true
                                                                  ? valueOrDefault<
                                                                      String>(
                                                                      functions
                                                                          .porcTotalCarboidrato(_model
                                                                              .filtroRelatorio!
                                                                              .toList())
                                                                          .toString(),
                                                                      '0',
                                                                    )
                                                                  : '0',
                                                              '0',
                                                            ),
                                                            valueOrDefault<
                                                                String>(
                                                              _model.clickFiltro ==
                                                                      true
                                                                  ? functions
                                                                      .porcTotalCaloria(_model
                                                                          .filtroRelatorio!
                                                                          .toList())
                                                                      .toString()
                                                                  : '0',
                                                              '0',
                                                            )
                                                          ],
                                                          colors: [
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .warning,
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary
                                                          ],
                                                          radius: [
                                                            50.0,
                                                            50.0,
                                                            50.0
                                                          ],
                                                          borderColor: [
                                                            Color(0x00000000),
                                                            Color(0x00000000),
                                                            Color(0x00000000)
                                                          ],
                                                        ),
                                                        donutHoleRadius: 60.0,
                                                        donutHoleColor:
                                                            Colors.transparent,
                                                        sectionLabelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineSmall
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmallFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .info,
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .headlineSmallIsCustom,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      '${valueOrDefault<String>(
                                                        (_model.clickFiltro ==
                                                                    true) &&
                                                                (_model.filtroRelatorio !=
                                                                        null &&
                                                                    (_model.filtroRelatorio)!
                                                                        .isNotEmpty)
                                                            ? '100'
                                                            : '0',
                                                        '0',
                                                      )}%',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .roboto(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                            fontSize: 24.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                    ),
                                                    Text(
                                                      'Proporção',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .roboto(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  width: 1.0,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.all(12.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          'Proteína',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .roboto(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .tertiary,
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                        Expanded(
                                                          child: Container(
                                                            width: 100.0,
                                                            height: 0.5,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                            ),
                                                          ),
                                                        ),
                                                        Text(
                                                          '${valueOrDefault<String>(
                                                            _model.clickFiltro ==
                                                                    true
                                                                ? valueOrDefault<
                                                                    String>(
                                                                    functions
                                                                        .porcTotalProteina(_model
                                                                            .filtroRelatorio!
                                                                            .toList())
                                                                        .toString(),
                                                                    '0',
                                                                  )
                                                                : '0',
                                                            '0',
                                                          )}%',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMediumIsCustom,
                                                              ),
                                                        ),
                                                      ].divide(
                                                          SizedBox(width: 8.0)),
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          'Caloria',
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .roboto(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                        Expanded(
                                                          child: Container(
                                                            width: 100.0,
                                                            height: 0.5,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                            ),
                                                          ),
                                                        ),
                                                        Text(
                                                          '${valueOrDefault<String>(
                                                            _model.clickFiltro ==
                                                                    true
                                                                ? functions
                                                                    .porcTotalCaloria(_model
                                                                        .filtroRelatorio!
                                                                        .toList())
                                                                    .toString()
                                                                : '0',
                                                            '0',
                                                          )}%',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMediumIsCustom,
                                                              ),
                                                        ),
                                                      ].divide(
                                                          SizedBox(width: 8.0)),
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          'Carboidrato',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .roboto(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .warning,
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                        Expanded(
                                                          child: Container(
                                                            width: 100.0,
                                                            height: 0.5,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                            ),
                                                          ),
                                                        ),
                                                        Text(
                                                          '${valueOrDefault<String>(
                                                            _model.clickFiltro ==
                                                                    true
                                                                ? valueOrDefault<
                                                                    String>(
                                                                    functions
                                                                        .porcTotalCarboidrato(_model
                                                                            .filtroRelatorio!
                                                                            .toList())
                                                                        .toString(),
                                                                    '0',
                                                                  )
                                                                : '0',
                                                            '0',
                                                          )}%',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMediumIsCustom,
                                                              ),
                                                        ),
                                                      ].divide(
                                                          SizedBox(width: 8.0)),
                                                    ),
                                                  ].divide(
                                                      SizedBox(height: 12.0)),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ].divide(SizedBox(height: 8.0)),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: () {
                                      if (MediaQuery.sizeOf(context).width ==
                                          1440.0) {
                                        return 718.0;
                                      } else if (MediaQuery.sizeOf(context)
                                              .width ==
                                          1920.0) {
                                        return 1038.0;
                                      } else {
                                        return 718.0;
                                      }
                                    }(),
                                    height: () {
                                      if (MediaQuery.sizeOf(context).height ==
                                          900.0) {
                                        return 485.0;
                                      } else if (MediaQuery.sizeOf(context)
                                              .height ==
                                          1080.0) {
                                        return 665.0;
                                      } else {
                                        return 485.0;
                                      }
                                    }(),
                                    constraints: BoxConstraints(
                                      minWidth: 718.0,
                                      minHeight: 485.0,
                                      maxWidth: 1038.0,
                                      maxHeight: 665.0,
                                    ),
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(16.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(-1.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Tabela de Refeições',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font:
                                                            GoogleFonts.roboto(
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
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                                Text(
                                                  'Lista das Refeições do período',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font:
                                                            GoogleFonts.roboto(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ]
                                                  .divide(SizedBox(height: 2.0))
                                                  .addToEnd(
                                                      SizedBox(height: 4.0)),
                                            ),
                                          ),
                                          Expanded(
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Builder(
                                                builder: (context) {
                                                  final itensTabela = _model
                                                          .filtroRelatorio
                                                          ?.map((e) => e)
                                                          .toList()
                                                          .toList() ??
                                                      [];
                                                  if (itensTabela.isEmpty) {
                                                    return Center(
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                        child: Image.asset(
                                                          'assets/images/Tabela_Vazia.png',
                                                          width: 500.0,
                                                          height: 500.0,
                                                          fit: BoxFit.contain,
                                                        ),
                                                      ),
                                                    );
                                                  }

                                                  return FlutterFlowDataTable<
                                                      RefeicoesRecord>(
                                                    controller: _model
                                                        .tabelaRefeicoesController,
                                                    data: itensTabela,
                                                    columnsBuilder:
                                                        (onSortChanged) => [
                                                      DataColumn2(
                                                        label: DefaultTextStyle
                                                            .merge(
                                                          softWrap: true,
                                                          child: Text(
                                                            'Refeição',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelLarge
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .roboto(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                      DataColumn2(
                                                        label: DefaultTextStyle
                                                            .merge(
                                                          softWrap: true,
                                                          child: Text(
                                                            'Data',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelLarge
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .roboto(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                      DataColumn2(
                                                        label: DefaultTextStyle
                                                            .merge(
                                                          softWrap: true,
                                                          child: Text(
                                                            'Proteína',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelLarge
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .roboto(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                      DataColumn2(
                                                        label: DefaultTextStyle
                                                            .merge(
                                                          softWrap: true,
                                                          child: Text(
                                                            'Caloria',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelLarge
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .roboto(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                      DataColumn2(
                                                        label: DefaultTextStyle
                                                            .merge(
                                                          softWrap: true,
                                                          child: Text(
                                                            'Carboidrato',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelLarge
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .roboto(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                    dataRowBuilder:
                                                        (itensTabelaItem,
                                                                itensTabelaIndex,
                                                                selected,
                                                                onSelectChanged) =>
                                                            DataRow(
                                                      color:
                                                          WidgetStateProperty
                                                              .all(
                                                        itensTabelaIndex % 2 ==
                                                                0
                                                            ? FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                      ),
                                                      cells: [
                                                        Text(
                                                          valueOrDefault<
                                                              String>(
                                                            itensTabelaItem
                                                                .tipoRefeicao,
                                                            'Nome',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .roboto(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                        Text(
                                                          valueOrDefault<
                                                              String>(
                                                            dateTimeFormat(
                                                              "dd/MM/y",
                                                              itensTabelaItem
                                                                  .dataRefeicao,
                                                              locale: FFLocalizations
                                                                      .of(context)
                                                                  .languageCode,
                                                            ),
                                                            '0',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .roboto(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                        Text(
                                                          valueOrDefault<
                                                              String>(
                                                            functions
                                                                .somaProteina(
                                                                    itensTabelaItem
                                                                        .listaAlimento
                                                                        .toList())
                                                                .toString(),
                                                            '0',
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .roboto(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .tertiary,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                        Text(
                                                          valueOrDefault<
                                                              String>(
                                                            functions
                                                                .somaCaloria(
                                                                    itensTabelaItem
                                                                        .listaAlimento
                                                                        .toList())
                                                                .toString(),
                                                            '0',
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .roboto(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                        Text(
                                                          valueOrDefault<
                                                              String>(
                                                            functions
                                                                .somaCarboidrato(
                                                                    itensTabelaItem
                                                                        .listaAlimento
                                                                        .toList())
                                                                .toString(),
                                                            '0',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .roboto(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .warning,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                      ]
                                                          .map((c) =>
                                                              DataCell(c))
                                                          .toList(),
                                                    ),
                                                    emptyBuilder: () => Center(
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                        child: Image.asset(
                                                          'assets/images/Tabela_Vazia.png',
                                                          width: 500.0,
                                                          height: 500.0,
                                                          fit: BoxFit.contain,
                                                        ),
                                                      ),
                                                    ),
                                                    paginated: true,
                                                    selectable: false,
                                                    hidePaginator: false,
                                                    showFirstLastButtons: false,
                                                    minWidth: 580.0,
                                                    headingRowHeight: 56.0,
                                                    dataRowHeight: 48.0,
                                                    columnSpacing: 20.0,
                                                    headingRowColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .accent2,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16.0),
                                                    addHorizontalDivider: true,
                                                    addTopAndBottomDivider:
                                                        false,
                                                    hideDefaultHorizontalDivider:
                                                        false,
                                                    horizontalDividerColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .accent2,
                                                    horizontalDividerThickness:
                                                        1.0,
                                                    addVerticalDivider: false,
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ].divide(SizedBox(height: 8.0)),
                                      ),
                                    ),
                                  ),
                                ].divide(
                                    (MediaQuery.sizeOf(context).width >= 480.0)
                                        ? SizedBox(width: 24.0)
                                        : SizedBox(height: 24.0)),
                              ),
                            ),
                          ].addToStart(SizedBox(height: 18.0)),
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
  }
}
