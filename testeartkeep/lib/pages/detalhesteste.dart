import 'package:flutter/material.dart';
import '../model/art_model.dart';

class DetalhesPage extends StatelessWidget {
  final ArtModel artDetails;

  const DetalhesPage({Key? key, required this.artDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: IconButton(
              icon: const Icon(
                Icons.star_border,
                size: 32.0,
              ),
              onPressed: () {
                // TODO: SALVARCURTIDA
                // Apos salvo, alterar para
                // estrela preenchida
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Titulo e obra
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4.0),
                border: Border.all(
                  color: Colors.grey,
                  width: 0.3,
                ),
              ),
              margin: const EdgeInsets.all(16.0),
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      _showFullScreenImage(context, artDetails.primaryImage);
                    },
                    child: Container(
                      width: 150,
                      height: 150,
                      margin: const EdgeInsets.only(right: 12.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: Image.network(
                        artDetails.primaryImage,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.grey,
                            height: 100,
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
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          artDetails.title,
                          style: TextStyle(
                            fontSize: 26.0,
                            fontWeight: FontWeight.w900,
                            height: 1.4,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Carrossel
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: artDetails.additionalImages.isEmpty
                    ? [
                  Container(
                    width: 250,
                    height: 250,
                    margin: const EdgeInsets.only(left: 8),
                    child: const Text(
                      'Infelizmente não possuímos imagens adicionais dessa obra.',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ]
                    : artDetails.additionalImages.map((imageUrl) {
                  return InkWell(
                    onTap: () {
                      _showFullScreenImage(context, imageUrl);
                    },
                    child: Container(
                      width: 250,
                      height: 250,
                      margin: const EdgeInsets.only(left: 8),
                      child: Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showFullScreenImage(BuildContext context, String imageUrl) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => FullScreenImagePage(imageUrl: imageUrl),
      ),
    );
  }
}

class FullScreenImagePage extends StatelessWidget {
  final String imageUrl;

  FullScreenImagePage({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context); // Fechar a tela cheia ao tocar na imagem
              },
              child: Image.network(
                imageUrl,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Positioned(
            top: 16.0,
            right: 16.0,
            child: IconButton(
              icon: Icon(
                Icons.close,
                color: Colors.black,
                size: 32.0,
              ),
              onPressed: () {
                Navigator.pop(context); // Fechar a tela cheia ao tocar no ícone de fechar
              },
            ),
          ),
        ],
      ),
    );
  }
}
