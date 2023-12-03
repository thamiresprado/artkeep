//mesmo principio usado para o repo de produto
import 'package:http/http.dart' as http;

//CONTRATO
abstract class IHttpClient {
  Future get({required String url});
}

//CLASSE CONCRETA
class HttpClient implements IHttpClient{
  // TODO: INSTALAR O CLIENTE HTTP
  //COMO? TERMINAL: flutter pub add http
  //var client recebe o cliente instalado

  final client = http.Client();

  @override
  Future get({required String url}) async {
    return await client.get(Uri.parse(url));
  }
}

//dessa forma, estou fazendo http mas podia
// usar o dio logo abaixo.