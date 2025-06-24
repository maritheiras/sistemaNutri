import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'informacao_perfil_celular_widget.dart'
    show InformacaoPerfilCelularWidget;
import 'package:flutter/material.dart';

class InformacaoPerfilCelularModel
    extends FlutterFlowModel<InformacaoPerfilCelularWidget> {
  ///  Local state fields for this component.

  bool atualizarImagemCel = false;

  bool atualizarNomeCel = false;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading_uploadDataS6h = false;
  FFUploadedFile uploadedLocalFile_uploadDataS6h =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // State field(s) for nomeUsuario widget.
  FocusNode? nomeUsuarioFocusNode;
  TextEditingController? nomeUsuarioTextController;
  String? Function(BuildContext, String?)? nomeUsuarioTextControllerValidator;
  String? _nomeUsuarioTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório.';
    }

    return null;
  }

  // Stores action output result for [Firestore Query - Query a collection] action in nomeUsuario widget.
  UserRecord? nameUserCel;
  // State field(s) for enderecoEmail widget.
  FocusNode? enderecoEmailFocusNode;
  TextEditingController? enderecoEmailTextController;
  String? Function(BuildContext, String?)? enderecoEmailTextControllerValidator;
  bool isDataUploading_updateUploadData = false;
  FFUploadedFile uploadedLocalFile_updateUploadData =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_updateUploadData = '';

  @override
  void initState(BuildContext context) {
    nomeUsuarioTextControllerValidator = _nomeUsuarioTextControllerValidator;
  }

  @override
  void dispose() {
    nomeUsuarioFocusNode?.dispose();
    nomeUsuarioTextController?.dispose();

    enderecoEmailFocusNode?.dispose();
    enderecoEmailTextController?.dispose();
  }
}
