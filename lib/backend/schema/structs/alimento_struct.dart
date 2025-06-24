// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class AlimentoStruct extends FFFirebaseStruct {
  AlimentoStruct({
    int? index,
    String? nomeAlimento,
    String? unidadeMedida,
    double? qntd,
    double? porcao,
    double? proteina,
    double? caloria,
    double? carboidrato,
    double? totalPorcao,
    double? totalProteina,
    double? totalCarboidrato,
    double? totalCaloria,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _index = index,
        _nomeAlimento = nomeAlimento,
        _unidadeMedida = unidadeMedida,
        _qntd = qntd,
        _porcao = porcao,
        _proteina = proteina,
        _caloria = caloria,
        _carboidrato = carboidrato,
        _totalPorcao = totalPorcao,
        _totalProteina = totalProteina,
        _totalCarboidrato = totalCarboidrato,
        _totalCaloria = totalCaloria,
        super(firestoreUtilData);

  // "index" field.
  int? _index;
  int get index => _index ?? 0;
  set index(int? val) => _index = val;

  void incrementIndex(int amount) => index = index + amount;

  bool hasIndex() => _index != null;

  // "nome_alimento" field.
  String? _nomeAlimento;
  String get nomeAlimento => _nomeAlimento ?? '';
  set nomeAlimento(String? val) => _nomeAlimento = val;

  bool hasNomeAlimento() => _nomeAlimento != null;

  // "unidade_medida" field.
  String? _unidadeMedida;
  String get unidadeMedida => _unidadeMedida ?? '';
  set unidadeMedida(String? val) => _unidadeMedida = val;

  bool hasUnidadeMedida() => _unidadeMedida != null;

  // "qntd" field.
  double? _qntd;
  double get qntd => _qntd ?? 0.0;
  set qntd(double? val) => _qntd = val;

  void incrementQntd(double amount) => qntd = qntd + amount;

  bool hasQntd() => _qntd != null;

  // "porcao" field.
  double? _porcao;
  double get porcao => _porcao ?? 0.0;
  set porcao(double? val) => _porcao = val;

  void incrementPorcao(double amount) => porcao = porcao + amount;

  bool hasPorcao() => _porcao != null;

  // "proteina" field.
  double? _proteina;
  double get proteina => _proteina ?? 0.0;
  set proteina(double? val) => _proteina = val;

  void incrementProteina(double amount) => proteina = proteina + amount;

  bool hasProteina() => _proteina != null;

  // "caloria" field.
  double? _caloria;
  double get caloria => _caloria ?? 0.0;
  set caloria(double? val) => _caloria = val;

  void incrementCaloria(double amount) => caloria = caloria + amount;

  bool hasCaloria() => _caloria != null;

  // "carboidrato" field.
  double? _carboidrato;
  double get carboidrato => _carboidrato ?? 0.0;
  set carboidrato(double? val) => _carboidrato = val;

  void incrementCarboidrato(double amount) =>
      carboidrato = carboidrato + amount;

  bool hasCarboidrato() => _carboidrato != null;

  // "totalPorcao" field.
  double? _totalPorcao;
  double get totalPorcao => _totalPorcao ?? 0.0;
  set totalPorcao(double? val) => _totalPorcao = val;

  void incrementTotalPorcao(double amount) =>
      totalPorcao = totalPorcao + amount;

  bool hasTotalPorcao() => _totalPorcao != null;

  // "totalProteina" field.
  double? _totalProteina;
  double get totalProteina => _totalProteina ?? 0.0;
  set totalProteina(double? val) => _totalProteina = val;

  void incrementTotalProteina(double amount) =>
      totalProteina = totalProteina + amount;

  bool hasTotalProteina() => _totalProteina != null;

  // "totalCarboidrato" field.
  double? _totalCarboidrato;
  double get totalCarboidrato => _totalCarboidrato ?? 0.0;
  set totalCarboidrato(double? val) => _totalCarboidrato = val;

  void incrementTotalCarboidrato(double amount) =>
      totalCarboidrato = totalCarboidrato + amount;

  bool hasTotalCarboidrato() => _totalCarboidrato != null;

  // "totalCaloria" field.
  double? _totalCaloria;
  double get totalCaloria => _totalCaloria ?? 0.0;
  set totalCaloria(double? val) => _totalCaloria = val;

  void incrementTotalCaloria(double amount) =>
      totalCaloria = totalCaloria + amount;

  bool hasTotalCaloria() => _totalCaloria != null;

  static AlimentoStruct fromMap(Map<String, dynamic> data) => AlimentoStruct(
        index: castToType<int>(data['index']),
        nomeAlimento: data['nome_alimento'] as String?,
        unidadeMedida: data['unidade_medida'] as String?,
        qntd: castToType<double>(data['qntd']),
        porcao: castToType<double>(data['porcao']),
        proteina: castToType<double>(data['proteina']),
        caloria: castToType<double>(data['caloria']),
        carboidrato: castToType<double>(data['carboidrato']),
        totalPorcao: castToType<double>(data['totalPorcao']),
        totalProteina: castToType<double>(data['totalProteina']),
        totalCarboidrato: castToType<double>(data['totalCarboidrato']),
        totalCaloria: castToType<double>(data['totalCaloria']),
      );

  static AlimentoStruct? maybeFromMap(dynamic data) =>
      data is Map ? AlimentoStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'index': _index,
        'nome_alimento': _nomeAlimento,
        'unidade_medida': _unidadeMedida,
        'qntd': _qntd,
        'porcao': _porcao,
        'proteina': _proteina,
        'caloria': _caloria,
        'carboidrato': _carboidrato,
        'totalPorcao': _totalPorcao,
        'totalProteina': _totalProteina,
        'totalCarboidrato': _totalCarboidrato,
        'totalCaloria': _totalCaloria,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'index': serializeParam(
          _index,
          ParamType.int,
        ),
        'nome_alimento': serializeParam(
          _nomeAlimento,
          ParamType.String,
        ),
        'unidade_medida': serializeParam(
          _unidadeMedida,
          ParamType.String,
        ),
        'qntd': serializeParam(
          _qntd,
          ParamType.double,
        ),
        'porcao': serializeParam(
          _porcao,
          ParamType.double,
        ),
        'proteina': serializeParam(
          _proteina,
          ParamType.double,
        ),
        'caloria': serializeParam(
          _caloria,
          ParamType.double,
        ),
        'carboidrato': serializeParam(
          _carboidrato,
          ParamType.double,
        ),
        'totalPorcao': serializeParam(
          _totalPorcao,
          ParamType.double,
        ),
        'totalProteina': serializeParam(
          _totalProteina,
          ParamType.double,
        ),
        'totalCarboidrato': serializeParam(
          _totalCarboidrato,
          ParamType.double,
        ),
        'totalCaloria': serializeParam(
          _totalCaloria,
          ParamType.double,
        ),
      }.withoutNulls;

  static AlimentoStruct fromSerializableMap(Map<String, dynamic> data) =>
      AlimentoStruct(
        index: deserializeParam(
          data['index'],
          ParamType.int,
          false,
        ),
        nomeAlimento: deserializeParam(
          data['nome_alimento'],
          ParamType.String,
          false,
        ),
        unidadeMedida: deserializeParam(
          data['unidade_medida'],
          ParamType.String,
          false,
        ),
        qntd: deserializeParam(
          data['qntd'],
          ParamType.double,
          false,
        ),
        porcao: deserializeParam(
          data['porcao'],
          ParamType.double,
          false,
        ),
        proteina: deserializeParam(
          data['proteina'],
          ParamType.double,
          false,
        ),
        caloria: deserializeParam(
          data['caloria'],
          ParamType.double,
          false,
        ),
        carboidrato: deserializeParam(
          data['carboidrato'],
          ParamType.double,
          false,
        ),
        totalPorcao: deserializeParam(
          data['totalPorcao'],
          ParamType.double,
          false,
        ),
        totalProteina: deserializeParam(
          data['totalProteina'],
          ParamType.double,
          false,
        ),
        totalCarboidrato: deserializeParam(
          data['totalCarboidrato'],
          ParamType.double,
          false,
        ),
        totalCaloria: deserializeParam(
          data['totalCaloria'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'AlimentoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AlimentoStruct &&
        index == other.index &&
        nomeAlimento == other.nomeAlimento &&
        unidadeMedida == other.unidadeMedida &&
        qntd == other.qntd &&
        porcao == other.porcao &&
        proteina == other.proteina &&
        caloria == other.caloria &&
        carboidrato == other.carboidrato &&
        totalPorcao == other.totalPorcao &&
        totalProteina == other.totalProteina &&
        totalCarboidrato == other.totalCarboidrato &&
        totalCaloria == other.totalCaloria;
  }

  @override
  int get hashCode => const ListEquality().hash([
        index,
        nomeAlimento,
        unidadeMedida,
        qntd,
        porcao,
        proteina,
        caloria,
        carboidrato,
        totalPorcao,
        totalProteina,
        totalCarboidrato,
        totalCaloria
      ]);
}

AlimentoStruct createAlimentoStruct({
  int? index,
  String? nomeAlimento,
  String? unidadeMedida,
  double? qntd,
  double? porcao,
  double? proteina,
  double? caloria,
  double? carboidrato,
  double? totalPorcao,
  double? totalProteina,
  double? totalCarboidrato,
  double? totalCaloria,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AlimentoStruct(
      index: index,
      nomeAlimento: nomeAlimento,
      unidadeMedida: unidadeMedida,
      qntd: qntd,
      porcao: porcao,
      proteina: proteina,
      caloria: caloria,
      carboidrato: carboidrato,
      totalPorcao: totalPorcao,
      totalProteina: totalProteina,
      totalCarboidrato: totalCarboidrato,
      totalCaloria: totalCaloria,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AlimentoStruct? updateAlimentoStruct(
  AlimentoStruct? alimento, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    alimento
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAlimentoStructData(
  Map<String, dynamic> firestoreData,
  AlimentoStruct? alimento,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (alimento == null) {
    return;
  }
  if (alimento.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && alimento.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final alimentoData = getAlimentoFirestoreData(alimento, forFieldValue);
  final nestedData = alimentoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = alimento.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAlimentoFirestoreData(
  AlimentoStruct? alimento, [
  bool forFieldValue = false,
]) {
  if (alimento == null) {
    return {};
  }
  final firestoreData = mapToFirestore(alimento.toMap());

  // Add any Firestore field values
  alimento.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAlimentoListFirestoreData(
  List<AlimentoStruct>? alimentos,
) =>
    alimentos?.map((e) => getAlimentoFirestoreData(e, true)).toList() ?? [];
