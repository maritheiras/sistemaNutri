// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ImagemRefeicaoStruct extends FFFirebaseStruct {
  ImagemRefeicaoStruct({
    String? cafe,
    String? almoco,
    String? lanche,
    String? jantar,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _cafe = cafe,
        _almoco = almoco,
        _lanche = lanche,
        _jantar = jantar,
        super(firestoreUtilData);

  // "cafe" field.
  String? _cafe;
  String get cafe =>
      _cafe ??
      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/sistema-nutri-85xb6d/assets/z78m254kvedu/Cafe_da_Manha.jpg';
  set cafe(String? val) => _cafe = val;

  bool hasCafe() => _cafe != null;

  // "almoco" field.
  String? _almoco;
  String get almoco =>
      _almoco ??
      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/sistema-nutri-85xb6d/assets/q6e7skf07nj4/Almo%C3%A7o.png';
  set almoco(String? val) => _almoco = val;

  bool hasAlmoco() => _almoco != null;

  // "lanche" field.
  String? _lanche;
  String get lanche =>
      _lanche ??
      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/sistema-nutri-85xb6d/assets/rt1871uaeaoe/Lanche.jpg';
  set lanche(String? val) => _lanche = val;

  bool hasLanche() => _lanche != null;

  // "jantar" field.
  String? _jantar;
  String get jantar =>
      _jantar ??
      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/sistema-nutri-85xb6d/assets/fensbnjby6y8/Jantar.jpg';
  set jantar(String? val) => _jantar = val;

  bool hasJantar() => _jantar != null;

  static ImagemRefeicaoStruct fromMap(Map<String, dynamic> data) =>
      ImagemRefeicaoStruct(
        cafe: data['cafe'] as String?,
        almoco: data['almoco'] as String?,
        lanche: data['lanche'] as String?,
        jantar: data['jantar'] as String?,
      );

  static ImagemRefeicaoStruct? maybeFromMap(dynamic data) => data is Map
      ? ImagemRefeicaoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'cafe': _cafe,
        'almoco': _almoco,
        'lanche': _lanche,
        'jantar': _jantar,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'cafe': serializeParam(
          _cafe,
          ParamType.String,
        ),
        'almoco': serializeParam(
          _almoco,
          ParamType.String,
        ),
        'lanche': serializeParam(
          _lanche,
          ParamType.String,
        ),
        'jantar': serializeParam(
          _jantar,
          ParamType.String,
        ),
      }.withoutNulls;

  static ImagemRefeicaoStruct fromSerializableMap(Map<String, dynamic> data) =>
      ImagemRefeicaoStruct(
        cafe: deserializeParam(
          data['cafe'],
          ParamType.String,
          false,
        ),
        almoco: deserializeParam(
          data['almoco'],
          ParamType.String,
          false,
        ),
        lanche: deserializeParam(
          data['lanche'],
          ParamType.String,
          false,
        ),
        jantar: deserializeParam(
          data['jantar'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ImagemRefeicaoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ImagemRefeicaoStruct &&
        cafe == other.cafe &&
        almoco == other.almoco &&
        lanche == other.lanche &&
        jantar == other.jantar;
  }

  @override
  int get hashCode => const ListEquality().hash([cafe, almoco, lanche, jantar]);
}

ImagemRefeicaoStruct createImagemRefeicaoStruct({
  String? cafe,
  String? almoco,
  String? lanche,
  String? jantar,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ImagemRefeicaoStruct(
      cafe: cafe,
      almoco: almoco,
      lanche: lanche,
      jantar: jantar,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ImagemRefeicaoStruct? updateImagemRefeicaoStruct(
  ImagemRefeicaoStruct? imagemRefeicao, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    imagemRefeicao
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addImagemRefeicaoStructData(
  Map<String, dynamic> firestoreData,
  ImagemRefeicaoStruct? imagemRefeicao,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (imagemRefeicao == null) {
    return;
  }
  if (imagemRefeicao.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && imagemRefeicao.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final imagemRefeicaoData =
      getImagemRefeicaoFirestoreData(imagemRefeicao, forFieldValue);
  final nestedData =
      imagemRefeicaoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = imagemRefeicao.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getImagemRefeicaoFirestoreData(
  ImagemRefeicaoStruct? imagemRefeicao, [
  bool forFieldValue = false,
]) {
  if (imagemRefeicao == null) {
    return {};
  }
  final firestoreData = mapToFirestore(imagemRefeicao.toMap());

  // Add any Firestore field values
  imagemRefeicao.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getImagemRefeicaoListFirestoreData(
  List<ImagemRefeicaoStruct>? imagemRefeicaos,
) =>
    imagemRefeicaos
        ?.map((e) => getImagemRefeicaoFirestoreData(e, true))
        .toList() ??
    [];
