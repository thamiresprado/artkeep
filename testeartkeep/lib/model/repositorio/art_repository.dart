//aqui a gente vai fazer a chamada de api
//formato contrato: pode ser adaptado para
// diversos repositorios da mesma forma
import 'dart:convert';
import 'package:testeartkeep/model/http/http_client.dart';
import 'package:testeartkeep/model/art_model.dart';
import '../http/exceptions.dart';


//CONTRATO
abstract class IArtRepository {
  Future<List<ArtModel>> getArt();
}

class ArtRepository implements IArtRepository {
  final IHttpClient client;

  ArtRepository({required this.client});

  @override
  Future<List<ArtModel>> getArt() async {
    final response = await client.get(
      url: 'https://collectionapi.metmuseum.org/public/collection/v1/objects',
    );

    if (response.statusCode == 200) {
      final List<ArtModel> arts = [];
      final body = jsonDecode(response.body);

      // Obter todos os objectIDs disponíveis
      final List<int> allObjectIDs = List<int>.from(body['objectIDs']);

      // Embaralhar a lista de objectIDs
      allObjectIDs.shuffle();

      // Selecionar os primeiros 100 objectIDs embaralhados
      final List<int> selectedObjectIDs =
      allObjectIDs.take(50).toList();

      for (int objectID in selectedObjectIDs) {
        final detailsResponse = await client.get(
          url: 'https://collectionapi.metmuseum.org/public/collection/v1/objects/$objectID',
        );

        if (detailsResponse.statusCode == 200) {
          final Map<String, dynamic> objectDetails = jsonDecode(detailsResponse.body);
          final ArtModel art = ArtModel.fromMap(objectDetails);
          arts.add(art);
        } else {
          print('Failed to load object details for ID $objectID');
        }
      }

      return arts;
    } else if (response.statusCode == 404) {
      throw NotFoundException('URL inválida');
    } else {
      throw Exception('Não foi possível carregar');
    }
  }
}
