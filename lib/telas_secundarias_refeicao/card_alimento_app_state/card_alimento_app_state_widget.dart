import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'card_alimento_app_state_model.dart';
export 'card_alimento_app_state_model.dart';

class CardAlimentoAppStateWidget extends StatefulWidget {
  const CardAlimentoAppStateWidget({
    super.key,
    String? nomeAlimento,
    required this.porcao,
    String? unMed,
    required this.qntd,
    required this.porcaoTotal,
    required this.index,
    required this.proteina,
    required this.caloria,
    required this.carboidrato,
    required this.totalProteina,
    required this.totalCaloria,
    required this.totalCarboidrato,
  })  : this.nomeAlimento = nomeAlimento ?? 'Alimento',
        this.unMed = unMed ?? 'g';

  final String nomeAlimento;
  final double? porcao;
  final String unMed;
  final double? qntd;
  final double? porcaoTotal;
  final int? index;
  final double? proteina;
  final double? caloria;
  final double? carboidrato;
  final double? totalProteina;
  final double? totalCaloria;
  final double? totalCarboidrato;

  @override
  State<CardAlimentoAppStateWidget> createState() =>
      _CardAlimentoAppStateWidgetState();
}

class _CardAlimentoAppStateWidgetState
    extends State<CardAlimentoAppStateWidget> {
  late CardAlimentoAppStateModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CardAlimentoAppStateModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 90.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Align(
        alignment: AlignmentDirectional(1.0, 0.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 16.0, 0.0),
              child: Container(
                width: 120.0,
                height: 60.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Align(
                        alignment: AlignmentDirectional(1.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            if (widget.qntd == 0.5) {
                              // Mensagem usuário
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Quantidade não pode ser igual a zero',
                                    style: GoogleFonts.roboto(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 2000),
                                  backgroundColor: Color(0x54FF5963),
                                ),
                              );
                            } else {
                              // Diminuindo quantidade
                              FFAppState().updateListaAlimentosAtIndex(
                                widget.index!,
                                (e) => e..incrementQntd(-0.5),
                              );
                              FFAppState().update(() {});
                              // Diminuindo os Totais
                              FFAppState().updateListaAlimentosAtIndex(
                                widget.index!,
                                (e) => e
                                  ..totalPorcao = valueOrDefault<double>(
                                    (widget.porcaoTotal!) -
                                        ((widget.porcao!) * 0.5),
                                    0.0,
                                  )
                                  ..totalProteina = widget.totalProteina != 0.0
                                      ? ((widget.totalProteina!) -
                                          ((widget.proteina!) * 0.5))
                                      : widget.proteina
                                  ..totalCarboidrato =
                                      widget.totalCarboidrato != 0.0
                                          ? valueOrDefault<double>(
                                              (widget.totalCarboidrato!) -
                                                  ((widget.carboidrato!) *
                                                      0.5),
                                              0.0,
                                            )
                                          : widget.carboidrato
                                  ..totalCaloria = widget.totalCaloria != 0.0
                                      ? valueOrDefault<double>(
                                          (widget.totalCaloria!) -
                                              ((widget.caloria!) * 0.5),
                                          0.0,
                                        )
                                      : widget.caloria,
                              );
                              FFAppState().update(() {});
                            }
                          },
                          child: Icon(
                            Icons.remove_circle,
                            color: FlutterFlowTheme.of(context).error,
                            size: 24.0,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            valueOrDefault<String>(
                              widget.qntd?.toString(),
                              '0',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  useGoogleFonts: !FlutterFlowTheme.of(context)
                                      .bodyMediumIsCustom,
                                ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            // Aumentando quantidade
                            FFAppState().updateListaAlimentosAtIndex(
                              widget.index!,
                              (e) => e..incrementQntd(0.5),
                            );
                            _model.updatePage(() {});
                            // Aumentando totalPorcao
                            FFAppState().updateListaAlimentosAtIndex(
                              widget.index!,
                              (e) => e
                                ..totalPorcao = valueOrDefault<double>(
                                  (widget.porcaoTotal!) +
                                      ((widget.porcao!) * 0.5),
                                  0.0,
                                )
                                ..totalProteina = widget.totalProteina != 0.0
                                    ? ((widget.totalProteina!) +
                                        ((widget.proteina!) * 0.5))
                                    : widget.proteina
                                ..totalCarboidrato =
                                    widget.totalCarboidrato != 0.0
                                        ? valueOrDefault<double>(
                                            (widget.totalCarboidrato!) +
                                                ((widget.carboidrato!) * 0.5),
                                            0.0,
                                          )
                                        : widget.carboidrato
                                ..totalCaloria = widget.totalCaloria != 0.0
                                    ? valueOrDefault<double>(
                                        (widget.totalCaloria!) +
                                            ((widget.caloria!) * 0.5),
                                        0.0,
                                      )
                                    : widget.caloria,
                            );
                            _model.updatePage(() {});
                          },
                          child: Icon(
                            Icons.add_circle,
                            color: FlutterFlowTheme.of(context).secondary,
                            size: 24.0,
                          ),
                        ),
                      ),
                    ),
                  ].divide(SizedBox(width: 4.0)),
                ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.nomeAlimento,
                  textAlign: TextAlign.start,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.roboto(
                          fontWeight: FontWeight.w500,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        fontSize: 20.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w500,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                      child: Text(
                        'Porção unitária:',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.roboto(
                                fontWeight: FontWeight.normal,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              color: FlutterFlowTheme.of(context).secondaryText,
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.normal,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                      ),
                    ),
                    Text(
                      valueOrDefault<String>(
                        widget.porcao?.toString(),
                        '0',
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.roboto(
                              fontWeight: FontWeight.normal,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            color: FlutterFlowTheme.of(context).secondaryText,
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.normal,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                    Text(
                      widget.unMed,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.roboto(
                              fontWeight: FontWeight.normal,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            color: FlutterFlowTheme.of(context).secondaryText,
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.normal,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Icon(
                      Icons.edit_rounded,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 12.0,
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
                      child: Text(
                        'Porção total:',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.roboto(
                                fontWeight: FontWeight.normal,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              color: FlutterFlowTheme.of(context).secondaryText,
                              fontSize: 13.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.normal,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                      ),
                    ),
                    Text(
                      valueOrDefault<String>(
                        widget.porcaoTotal?.toString(),
                        '0',
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.roboto(
                              fontWeight: FontWeight.w500,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            color: FlutterFlowTheme.of(context).primaryText,
                            fontSize: 13.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w500,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                    Text(
                      valueOrDefault<String>(
                        widget.unMed,
                        'g',
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.roboto(
                              fontWeight: FontWeight.w500,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            color: FlutterFlowTheme.of(context).primaryText,
                            fontSize: 13.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w500,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                  ],
                ),
              ].divide(SizedBox(height: 4.0)),
            ),
          ].addToStart(SizedBox(width: 8.0)),
        ),
      ),
    );
  }
}
