import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _listaAlimentos = prefs
              .getStringList('ff_listaAlimentos')
              ?.map((x) {
                try {
                  return AlimentoStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _listaAlimentos;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _ativarPagina = '';
  String get ativarPagina => _ativarPagina;
  set ativarPagina(String value) {
    _ativarPagina = value;
  }

  bool _buscaAlimento = false;
  bool get buscaAlimento => _buscaAlimento;
  set buscaAlimento(bool value) {
    _buscaAlimento = value;
  }

  ImagemRefeicaoStruct _imagemRefeicao =
      ImagemRefeicaoStruct.fromSerializableMap(jsonDecode(
          '{\"cafe\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/sistema-nutri-85xb6d/assets/z78m254kvedu/Cafe_da_Manha.jpg\",\"almoco\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/sistema-nutri-85xb6d/assets/q6e7skf07nj4/Almo%C3%A7o.png\",\"lanche\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/sistema-nutri-85xb6d/assets/rt1871uaeaoe/Lanche.jpg\",\"jantar\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/sistema-nutri-85xb6d/assets/fensbnjby6y8/Jantar.jpg\"}'));
  ImagemRefeicaoStruct get imagemRefeicao => _imagemRefeicao;
  set imagemRefeicao(ImagemRefeicaoStruct value) {
    _imagemRefeicao = value;
  }

  void updateImagemRefeicaoStruct(Function(ImagemRefeicaoStruct) updateFn) {
    updateFn(_imagemRefeicao);
  }

  List<AlimentoStruct> _listaAlimentos = [];
  List<AlimentoStruct> get listaAlimentos => _listaAlimentos;
  set listaAlimentos(List<AlimentoStruct> value) {
    _listaAlimentos = value;
    prefs.setStringList(
        'ff_listaAlimentos', value.map((x) => x.serialize()).toList());
  }

  void addToListaAlimentos(AlimentoStruct value) {
    listaAlimentos.add(value);
    prefs.setStringList('ff_listaAlimentos',
        _listaAlimentos.map((x) => x.serialize()).toList());
  }

  void removeFromListaAlimentos(AlimentoStruct value) {
    listaAlimentos.remove(value);
    prefs.setStringList('ff_listaAlimentos',
        _listaAlimentos.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromListaAlimentos(int index) {
    listaAlimentos.removeAt(index);
    prefs.setStringList('ff_listaAlimentos',
        _listaAlimentos.map((x) => x.serialize()).toList());
  }

  void updateListaAlimentosAtIndex(
    int index,
    AlimentoStruct Function(AlimentoStruct) updateFn,
  ) {
    listaAlimentos[index] = updateFn(_listaAlimentos[index]);
    prefs.setStringList('ff_listaAlimentos',
        _listaAlimentos.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInListaAlimentos(int index, AlimentoStruct value) {
    listaAlimentos.insert(index, value);
    prefs.setStringList('ff_listaAlimentos',
        _listaAlimentos.map((x) => x.serialize()).toList());
  }

  List<String> _listaRefeicao = ['Café da Manhã', 'Almoço', 'Lanche', 'Jantar'];
  List<String> get listaRefeicao => _listaRefeicao;
  set listaRefeicao(List<String> value) {
    _listaRefeicao = value;
  }

  void addToListaRefeicao(String value) {
    listaRefeicao.add(value);
  }

  void removeFromListaRefeicao(String value) {
    listaRefeicao.remove(value);
  }

  void removeAtIndexFromListaRefeicao(int index) {
    listaRefeicao.removeAt(index);
  }

  void updateListaRefeicaoAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    listaRefeicao[index] = updateFn(_listaRefeicao[index]);
  }

  void insertAtIndexInListaRefeicao(int index, String value) {
    listaRefeicao.insert(index, value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
