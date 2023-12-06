import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/like_bloc.dart';
import '../model/art_model.dart';
import '../model/repositorio/art_repository.dart';
import 'package:testeartkeep/model/http/http_client.dart';

class DetalhesPage extends StatelessWidget {
  final ArtModel artDetails;
  final Function(ArtModel) onLike;
  // final IArtRepository artRepository =
  //     ArtRepository(client: HttpClient());

  const DetalhesPage({
    Key? key,
    required this.artDetails,
    required this.onLike,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
                right: 16.0),
            child: IconButton(
              icon: const Icon(
                Icons.star_border,
                size: 32.0,
              ),
              onPressed: () {
                // Chama a função de callback passando a obra específica
                onLike(artDetails);
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
                borderRadius:
                BorderRadius.circular(4.0),
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
                      _showFullScreenImage(
                          context,
                          artDetails
                              .primaryImage);
                    },
                    child: Container(
                      width: 150,
                      height: 150,
                      margin:
                      const EdgeInsets.only(
                          right: 12.0),
                      decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.circular(
                            4.0),
                      ),
                      child: Image.network(
                        artDetails.primaryImage,
                        fit: BoxFit.cover,
                        errorBuilder: (context,
                            error, stackTrace) {
                          return Container(
                            color: Colors.grey,
                            height: 100,
                            child: const Center(
                              child: Icon(
                                Icons
                                    .image_not_supported,
                                color:
                                Colors.white,
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
                      crossAxisAlignment:
                      CrossAxisAlignment
                          .start,
                      mainAxisAlignment:
                      MainAxisAlignment
                          .center,
                      children: [
                        Text(
                          artDetails.title,
                          style: TextStyle(
                            fontSize: 26.0,
                            fontWeight:
                            FontWeight.w900,
                            height: 1.4,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 32),

            // Informações sobre a obra
            Container(
              margin: const EdgeInsets.only(
                  left: 16.0, right: 16.0),
              child: Row(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  // Título "About the piece"
                  Container(
                    width: MediaQuery.of(context)
                        .size
                        .width *
                        0.4,
                    margin: const EdgeInsets.only(
                        right: 16.0),
                    child: const Text(
                      'About the piece',
                      style: TextStyle(
                        fontFamily: 'AlfaSlabOne',
                        fontSize: 40.0,
                        height: 0.8,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ),
                  // Informações sobre a peça
                  Expanded(
                    child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment
                            .start,
                        children: [
                          Column(
                            crossAxisAlignment:
                            CrossAxisAlignment
                                .start,
                            children: [
                              Text(
                                'ARTIST',
                                style:
                                const TextStyle(
                                  fontSize: 12.0,
                                  fontWeight:
                                  FontWeight
                                      .w900,
                                ),
                              ),
                              Text(
                                artDetails
                                    .artistDisplayName ??
                                    'Artista Desconhecido',
                                style:
                                const TextStyle(
                                  fontSize: 12.0,
                                  fontWeight:
                                  FontWeight
                                      .w100,
                                ),
                              ),
                              SizedBox(
                                  height: 12),
                              Text(
                                'DATE',
                                style:
                                const TextStyle(
                                  fontSize: 12.0,
                                  fontWeight:
                                  FontWeight
                                      .w900,
                                ),
                              ),
                              Text(
                                artDetails
                                    .objectDate,
                                style:
                                const TextStyle(
                                  fontSize: 12.0,
                                  fontWeight:
                                  FontWeight
                                      .w100,
                                ),
                              ),
                              SizedBox(
                                  height: 12),
                              Text(
                                'GEOGRAPHY',
                                style:
                                const TextStyle(
                                  fontSize: 12.0,
                                  fontWeight:
                                  FontWeight
                                      .w900,
                                ),
                              ),
                              Text(
                                artDetails.city,
                                style:
                                const TextStyle(
                                  fontSize: 12.0,
                                  fontWeight:
                                  FontWeight
                                      .w100,
                                ),
                              ),
                              SizedBox(
                                  height: 12),
                              Text(
                                'DEPARTMENT',
                                style:
                                const TextStyle(
                                  fontSize: 12.0,
                                  fontWeight:
                                  FontWeight
                                      .w900,
                                ),
                              ),
                              Text(
                                artDetails
                                    .department,
                                style:
                                const TextStyle(
                                  fontSize: 12.0,
                                  fontWeight:
                                  FontWeight
                                      .w100,
                                ),
                              ),
                              SizedBox(
                                  height: 12),
                              Text(
                                'MEDIUM',
                                style:
                                const TextStyle(
                                  fontSize: 12.0,
                                  fontWeight:
                                  FontWeight
                                      .w900,
                                ),
                              ),
                              Text(
                                artDetails
                                    .objectName,
                                style:
                                const TextStyle(
                                  fontSize: 12.0,
                                  fontWeight:
                                  FontWeight
                                      .w100,
                                ),
                              ),
                            ],
                          ),
                        ]),
                  ),
                ],
              ),
            ),

            SizedBox(height: 40),

            // Carrossel
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: artDetails
                    .additionalImages.isEmpty
                    ? [
                  Container(
                    width: 250,
                    height: 250,
                    margin: const EdgeInsets
                        .only(left: 8),
                    child: const Text(
                      'Infelizmente não possuímos imagens adicionais dessa obra.',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight:
                        FontWeight.w500,
                        color: Colors.grey,
                      ),
                      textAlign:
                      TextAlign.left,
                    ),
                  ),
                ]
                    : artDetails.additionalImages
                    .map((imageUrl) {
                  return InkWell(
                    onTap: () {
                      _showFullScreenImage(
                          context,
                          imageUrl);
                    },
                    child: Container(
                      width: 250,
                      height: 250,
                      margin:
                      const EdgeInsets
                          .only(
                          left: 8),
                      child: Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                        width:
                        double.infinity,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),

            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  void _showFullScreenImage(
      BuildContext context, String imageUrl) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => FullScreenImagePage(
            imageUrl: imageUrl),
      ),
    );
  }
}

class FullScreenImagePage
    extends StatelessWidget {
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
                Navigator.pop(context);
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
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
