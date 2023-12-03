import 'package:flutter/material.dart';
import 'package:testeartkeep/pages/stores/art_store.dart';
import '../model/repositorio/art_repository.dart';
import 'package:testeartkeep/model/http/http_client.dart';


class PiecesPage extends StatefulWidget {
  const PiecesPage({super.key});

  @override
  State<PiecesPage> createState() => _PiecesPageState();
}

class _PiecesPageState extends State<PiecesPage> {
  final ArtStore store = ArtStore(
    repository: ArtRepository(
      client: HttpClient(),
    ),
  );

  @override
  void initState() {
    super.initState();
    store.getArt();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('explore all the art pieces',
          style: TextStyle(
            fontFamily: 'AlfaSlabOne',
            fontSize: 24,
            color: Colors.black,
          ),),
      ),
      body: AnimatedBuilder(
        animation: Listenable.merge([
          store.isLoading,
          store.erro,
          store.state,
        ]),
        builder: (context, child) {
          if (store.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          if (store.erro.value.isNotEmpty) {
            return Center(
              child: Text(
                store.erro.value,
                style: const TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
            );
          }

          if (store.state.value.isEmpty) {
            return const Center(
              child: Text(
                'Nenhum item na lista',
                style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
            );
          } else {
            return ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(
                height: 32,
              ),
              padding: const EdgeInsets.all(16),
              itemCount: store.state.value.length,
              itemBuilder: (_, index) {
                final item = store.state.value[index];
                return GestureDetector(
                  // onTap: () {
                  //   // Navegar para a DetalhesPage ao clicar na imagem
                  //   Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => DetalhesPage(artDetails: item),
                  //     ),
                  //   );
                  // },
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.network(
                          item.primaryImage,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            // Se ocorrer um erro ao carregar a imagem (imagem não disponível),
                            // exiba um contêiner com um fundo cinza
                            return Container(
                              color: Colors.grey,
                              child: const Center(
                                child: Icon(
                                  Icons.image_not_supported,
                                  color: Colors.white,
                                  size: 48.0,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          item.title,
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 24,
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.artistDisplayName,
                              style: const TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              item.objectName,
                              style: const TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w400,
                                fontSize: 18,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}