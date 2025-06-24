import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'informacao_perfil_p_c_widget.dart' show InformacaoPerfilPCWidget;
import 'package:flutter/material.dart';

class InformacaoPerfilPCModel
    extends FlutterFlowModel<InformacaoPerfilPCWidget> {
  ///  Local state fields for this component.

  bool atualizarImagem = false;

  bool atualizarNome = false;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading_uploadDataOem = false;
  FFUploadedFile uploadedLocalFile_uploadDataOem =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // State field(s) for emailUsuario widget.
  FocusNode? emailUsuarioFocusNode;
  TextEditingController? emailUsuarioTextController;
  String? Function(BuildContext, String?)? emailUsuarioTextControllerValidator;
  // State field(s) for nomeUsuario widget.
  FocusNode? nomeUsuarioFocusNode;
  TextEditingController? nomeUsuarioTextController;
  String? Function(BuildContext, String?)? nomeUsuarioTextControllerValidator;
  String? _nomeUsuarioTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório!';
    }

    return null;
  }

  // Stores action output result for [Firestore Query - Query a collection] action in nomeUsuario widget.
  UserRecord? nameUser;
  bool isDataUploading_uploadFirebaseUserPc = false;
  FFUploadedFile uploadedLocalFile_uploadFirebaseUserPc =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadFirebaseUserPc = '';

  @override
  void initState(BuildContext context) {
    nomeUsuarioTextControllerValidator = _nomeUsuarioTextControllerValidator;
  }

  @override
  void dispose() {
    emailUsuarioFocusNode?.dispose();
    emailUsuarioTextController?.dispose();

    nomeUsuarioFocusNode?.dispose();
    nomeUsuarioTextController?.dispose();
  }
}
