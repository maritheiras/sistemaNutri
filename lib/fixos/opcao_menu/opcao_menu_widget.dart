import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'opcao_menu_model.dart';
export 'opcao_menu_model.dart';

class OpcaoMenuWidget extends StatefulWidget {
  const OpcaoMenuWidget({
    super.key,
    required this.titulo,
    required this.ativo,
    required this.iconeAtivo,
    required this.iconeInativo,
    required this.navegacaoAtivada,
  });

  final String? titulo;
  final bool? ativo;
  final Widget? iconeAtivo;
  final Widget? iconeInativo;
  final Future Function()? navegacaoAtivada;

  @override
  State<OpcaoMenuWidget> createState() => _OpcaoMenuWidgetState();
}

class _OpcaoMenuWidgetState extends State<OpcaoMenuWidget> {
  late OpcaoMenuModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OpcaoMenuModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      opaque: false,
      cursor: SystemMouseCursors.click ?? MouseCursor.defer,
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 4.0),
        child: InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            await widget.navegacaoAtivada?.call();
          },
          child: Container(
            width: double.infinity,
            height: 50.0,
            decoration: BoxDecoration(
              color: () {
                if (widget.ativo!) {
                  return FlutterFlowTheme.of(context).primary;
                } else if (_model.mouseRegionHovered) {
                  return FlutterFlowTheme.of(context).alternate;
                } else {
                  return FlutterFlowTheme.of(context).secondaryBackground;
                }
              }(),
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                widget.ativo! ? widget.iconeAtivo! : widget.iconeInativo!,
                Text(
                  valueOrDefault<String>(
                    widget.titulo,
                    'Relatórios',
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.roboto(
                          fontWeight: FontWeight.w500,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        color: () {
                          if (widget.ativo!) {
                            return FlutterFlowTheme.of(context).info;
                          } else if (_model.mouseRegionHovered) {
                            return FlutterFlowTheme.of(context).secondaryText;
                          } else {
                            return FlutterFlowTheme.of(context).secondaryText;
                          }
                        }(),
                        fontSize: 16.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w500,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                ),
              ].divide(SizedBox(width: 12.0)).addToStart(SizedBox(width: 24.0)),
            ),
          ),
        ),
      ),
      onEnter: ((event) async {
        safeSetState(() => _model.mouseRegionHovered = true);
      }),
      onExit: ((event) async {
        safeSetState(() => _model.mouseRegionHovered = false);
      }),
    );
  }
}
