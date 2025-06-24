import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RefeicoesRecord extends FirestoreRecord {
  RefeicoesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "id_refeicao" field.
  String? _idRefeicao;
  String get idRefeicao => _idRefeicao ?? '';
  bool hasIdRefeicao() => _idRefeicao != null;

  // "foto_refeicao" field.
  String? _fotoRefeicao;
  String get fotoRefeicao => _fotoRefeicao ?? '';
  bool hasFotoRefeicao() => _fotoRefeicao != null;

  // "data_criacao" field.
  DateTime? _dataCriacao;
  DateTime? get dataCriacao => _dataCriacao;
  bool hasDataCriacao() => _dataCriacao != null;

  // "tipo_refeicao" field.
  String? _tipoRefeicao;
  String get tipoRefeicao => _tipoRefeicao ?? '';
  bool hasTipoRefeicao() => _tipoRefeicao != null;

  // "data_refeicao" field.
  DateTime? _dataRefeicao;
  DateTime? get dataRefeicao => _dataRefeicao;
  bool hasDataRefeicao() => _dataRefeicao != null;

  // "listaAlimento" field.
  List<AlimentoStruct>? _listaAlimento;
  List<AlimentoStruct> get listaAlimento => _listaAlimento ?? const [];
  bool hasListaAlimento() => _listaAlimento != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _idRefeicao = snapshotData['id_refeicao'] as String?;
    _fotoRefeicao = snapshotData['foto_refeicao'] as String?;
    _dataCriacao = snapshotData['data_criacao'] as DateTime?;
    _tipoRefeicao = snapshotData['tipo_refeicao'] as String?;
    _dataRefeicao = snapshotData['data_refeicao'] as DateTime?;
    _listaAlimento = getStructList(
      snapshotData['listaAlimento'],
      AlimentoStruct.fromMap,
    );
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('refeicoes')
          : FirebaseFirestore.instance.collectionGroup('refeicoes');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('refeicoes').doc(id);

  static Stream<RefeicoesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RefeicoesRecord.fromSnapshot(s));

  static Future<RefeicoesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RefeicoesRecord.fromSnapshot(s));

  static RefeicoesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RefeicoesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RefeicoesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RefeicoesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RefeicoesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RefeicoesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRefeicoesRecordData({
  String? idRefeicao,
  String? fotoRefeicao,
  DateTime? dataCriacao,
  String? tipoRefeicao,
  DateTime? dataRefeicao,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id_refeicao': idRefeicao,
      'foto_refeicao': fotoRefeicao,
      'data_criacao': dataCriacao,
      'tipo_refeicao': tipoRefeicao,
      'data_refeicao': dataRefeicao,
    }.withoutNulls,
  );

  return firestoreData;
}

class RefeicoesRecordDocumentEquality implements Equality<RefeicoesRecord> {
  const RefeicoesRecordDocumentEquality();

  @override
  bool equals(RefeicoesRecord? e1, RefeicoesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.idRefeicao == e2?.idRefeicao &&
        e1?.fotoRefeicao == e2?.fotoRefeicao &&
        e1?.dataCriacao == e2?.dataCriacao &&
        e1?.tipoRefeicao == e2?.tipoRefeicao &&
        e1?.dataRefeicao == e2?.dataRefeicao &&
        listEquality.equals(e1?.listaAlimento, e2?.listaAlimento);
  }

  @override
  int hash(RefeicoesRecord? e) => const ListEquality().hash([
        e?.idRefeicao,
        e?.fotoRefeicao,
        e?.dataCriacao,
        e?.tipoRefeicao,
        e?.dataRefeicao,
        e?.listaAlimento
      ]);

  @override
  bool isValidKey(Object? o) => o is RefeicoesRecord;
}
