import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AlimentosRecord extends FirestoreRecord {
  AlimentosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "id_alimento" field.
  String? _idAlimento;
  String get idAlimento => _idAlimento ?? '';
  bool hasIdAlimento() => _idAlimento != null;

  // "nome_alimento" field.
  String? _nomeAlimento;
  String get nomeAlimento => _nomeAlimento ?? '';
  bool hasNomeAlimento() => _nomeAlimento != null;

  // "data_criacao" field.
  DateTime? _dataCriacao;
  DateTime? get dataCriacao => _dataCriacao;
  bool hasDataCriacao() => _dataCriacao != null;

  // "data_atualizacao" field.
  DateTime? _dataAtualizacao;
  DateTime? get dataAtualizacao => _dataAtualizacao;
  bool hasDataAtualizacao() => _dataAtualizacao != null;

  // "unidade_medida" field.
  String? _unidadeMedida;
  String get unidadeMedida => _unidadeMedida ?? '';
  bool hasUnidadeMedida() => _unidadeMedida != null;

  // "porcao" field.
  double? _porcao;
  double get porcao => _porcao ?? 0.0;
  bool hasPorcao() => _porcao != null;

  // "proteina" field.
  double? _proteina;
  double get proteina => _proteina ?? 0.0;
  bool hasProteina() => _proteina != null;

  // "caloria" field.
  double? _caloria;
  double get caloria => _caloria ?? 0.0;
  bool hasCaloria() => _caloria != null;

  // "carboidrato" field.
  double? _carboidrato;
  double get carboidrato => _carboidrato ?? 0.0;
  bool hasCarboidrato() => _carboidrato != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _idAlimento = snapshotData['id_alimento'] as String?;
    _nomeAlimento = snapshotData['nome_alimento'] as String?;
    _dataCriacao = snapshotData['data_criacao'] as DateTime?;
    _dataAtualizacao = snapshotData['data_atualizacao'] as DateTime?;
    _unidadeMedida = snapshotData['unidade_medida'] as String?;
    _porcao = castToType<double>(snapshotData['porcao']);
    _proteina = castToType<double>(snapshotData['proteina']);
    _caloria = castToType<double>(snapshotData['caloria']);
    _carboidrato = castToType<double>(snapshotData['carboidrato']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('alimentos')
          : FirebaseFirestore.instance.collectionGroup('alimentos');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('alimentos').doc(id);

  static Stream<AlimentosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AlimentosRecord.fromSnapshot(s));

  static Future<AlimentosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AlimentosRecord.fromSnapshot(s));

  static AlimentosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AlimentosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AlimentosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AlimentosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AlimentosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AlimentosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAlimentosRecordData({
  String? idAlimento,
  String? nomeAlimento,
  DateTime? dataCriacao,
  DateTime? dataAtualizacao,
  String? unidadeMedida,
  double? porcao,
  double? proteina,
  double? caloria,
  double? carboidrato,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id_alimento': idAlimento,
      'nome_alimento': nomeAlimento,
      'data_criacao': dataCriacao,
      'data_atualizacao': dataAtualizacao,
      'unidade_medida': unidadeMedida,
      'porcao': porcao,
      'proteina': proteina,
      'caloria': caloria,
      'carboidrato': carboidrato,
    }.withoutNulls,
  );

  return firestoreData;
}

class AlimentosRecordDocumentEquality implements Equality<AlimentosRecord> {
  const AlimentosRecordDocumentEquality();

  @override
  bool equals(AlimentosRecord? e1, AlimentosRecord? e2) {
    return e1?.idAlimento == e2?.idAlimento &&
        e1?.nomeAlimento == e2?.nomeAlimento &&
        e1?.dataCriacao == e2?.dataCriacao &&
        e1?.dataAtualizacao == e2?.dataAtualizacao &&
        e1?.unidadeMedida == e2?.unidadeMedida &&
        e1?.porcao == e2?.porcao &&
        e1?.proteina == e2?.proteina &&
        e1?.caloria == e2?.caloria &&
        e1?.carboidrato == e2?.carboidrato;
  }

  @override
  int hash(AlimentosRecord? e) => const ListEquality().hash([
        e?.idAlimento,
        e?.nomeAlimento,
        e?.dataCriacao,
        e?.dataAtualizacao,
        e?.unidadeMedida,
        e?.porcao,
        e?.proteina,
        e?.caloria,
        e?.carboidrato
      ]);

  @override
  bool isValidKey(Object? o) => o is AlimentosRecord;
}
