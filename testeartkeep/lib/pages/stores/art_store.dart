//gerencia o estado dos produtos na tela
// enquanto a requisição é feita

import 'package:flutter/cupertino.dart';
import 'package:testeartkeep/model/http/exceptions.dart';
import 'package:testeartkeep/model/art_model.dart';
import 'package:testeartkeep/model/repositorio/art_repository.dart';

class ArtStore {
  final IArtRepository repository;

  ArtStore({required this.repository});

  //Loading
  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  //Estado da tela = Lista de produtos
  final ValueNotifier<List<ArtModel>> state =
  ValueNotifier<List<ArtModel>>([]);

  //Erro
  final ValueNotifier<String> erro = ValueNotifier<String>('');

  Future getArt() async{
    isLoading.value = true;

    try{
      final result = await repository.getArt();
      state.value = result;
    } on NotFoundException catch(e){
      erro.value = e.message;
    }catch(e) {
      erro.value = e.toString();
    }

    isLoading.value = false;
  }
}