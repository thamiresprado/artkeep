import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testeartkeep/pages/select_avatar.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/like_bloc.dart';
import '../model/art_model.dart';
import 'package:http/http.dart' as http;



class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    // Disparar o evento RetrieveLikes ao iniciar a página para obter as obras curtidas
    BlocProvider.of<LikeBloc>(context).add(RetrieveLikes());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: Colors.black,
              padding: const EdgeInsets.fromLTRB(0, 12, 16, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.logout),
                    onPressed: () {
                      Navigator.popUntil(
                          context, ModalRoute.withName('/welcome'));
                      BlocProvider.of<AuthBloc>(context).add(Logout());
                    },
                    iconSize: 25,
                    color: Colors.white70,
                  ),
                  SizedBox(width: 16),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
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
                          Container(
                            width: 150,
                            height: 150,
                            margin: const EdgeInsets.only(right: 12.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            child: InkWell(
                              onTap: () {
                                // Adicione aqui a navegação para a próxima página ao clicar na imagem do avatar
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => SelectAvatarPage()),
                                );},
                              child: Image.asset(
                                'lib/images/avatar3.png',
                                fit: BoxFit.cover,
                                width: double.infinity,
                              ),
                            ),
                          ),
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'John Brown',
                                  style: TextStyle(
                                    fontSize: 26.0,
                                    fontWeight: FontWeight.w900,
                                    height: 1.0,
                                  ),
                                ),
                                SizedBox(height: 2),
                                Text(
                                  '@john1010',
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w100,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 40),
                    // Informações sobre a obra
                    Container(
                      margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Título "About the piece"
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            margin: const EdgeInsets.only(right: 16.0),
                            child: const Text(
                              'About me',
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //_buildInfoRow('NAME', BlocProvider.of<AuthBloc>(context).add(RetrieveUserInfoEvent())),
                                _buildInfoRow('NAME', 'John Brown'),
                                _buildInfoRow('BIRTHDAY', '24/05/1996'),
                                _buildInfoRow('E-MAIL', 'johnbrown@gmail.com'),
                                _buildInfoRow('COUNTRY', 'Brazil'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 32),
                    BlocBuilder<LikeBloc, LikeState>(
                      builder: (context, state) {
                        if (state is ObtainedArts) {
                          return _buildLikedArtworksList(state.arts);
                        } else if (state is ErrorLikes) {
                          return Text(state.message);
                        } else {
                          return CircularProgressIndicator();
                        }
                      },
                    ),
                    SizedBox(height: 80),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget _buildLikedArtworksList(List<ArtModel> likedArts) {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Padding(
  //         padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
  //         child: Text(
  //           'Obras Curtidas',
  //           style: TextStyle(
  //             fontSize: 24.0,
  //             fontWeight: FontWeight.bold,
  //           ),
  //         ),
  //       ),
  //       ListView.builder(
  //         shrinkWrap: true,
  //         itemCount: likedArts.length,
  //         itemBuilder: (context, index) {
  //           return ListTile(
  //             title: Text(likedArts[index].title),
  //             subtitle: Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Text(likedArts[index].artistDisplayName),
  //                 // _buildImageFromUrl(likedArts[index].primaryImage),
  //               ],
  //             ),
  //             // Adicione qualquer informação adicional que deseja exibir
  //             // por exemplo, data, etc.
  //           );
  //         },
  //       ),
  //     ],
  //   );
  // }

  //
  // Widget _buildLikedArtworksList(List<ArtModel> likedArts) {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Padding(
  //         padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
  //         child: Text(
  //           'Obras Curtidas',
  //           style: TextStyle(
  //             fontSize: 24.0,
  //             fontWeight: FontWeight.bold,
  //           ),
  //         ),
  //       ),
  //       ListView.builder(
  //         shrinkWrap: true,
  //         itemCount: likedArts.length,
  //         itemBuilder: (context, index) {
  //           return ListTile(
  //             title: Text(likedArts[index].title),
  //             subtitle: Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Text(likedArts[index].artistDisplayName),
  //               ],
  //             ),
  //             onTap: () {
  //               // Mostrar um AlertDialog para confirmar a exclusão
  //               showDialog(
  //                 context: context,
  //                 builder: (BuildContext context) {
  //                   return AlertDialog(
  //                     title: Text('Excluir obra dos favoritos?'),
  //                     content: Text(
  //                       'Deseja realmente excluir esta obra dos favoritos?',
  //                     ),
  //                     actions: <Widget>[
  //                       TextButton(
  //                         onPressed: () {
  //                           // Fechar o AlertDialog
  //                           Navigator.of(context).pop();
  //                         },
  //                         child: Text('Não'),
  //                       ),
  //                       TextButton(
  //                         onPressed: () {
  //                           // Remover localmente da lista
  //                           setState(() {
  //                             likedArts.removeAt(index);
  //                           });
  //
  //                           // Fechar o AlertDialog
  //                           Navigator.of(context).pop();
  //                         },
  //                         child: Text('Sim'),
  //                       ),
  //                     ],
  //                   );
  //                 },
  //               );
  //             },
  //           );
  //         },
  //       ),
  //     ],
  //   );
  // }

  Widget _buildLikedArtworksList(List<ArtModel> likedArts) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text(
            //'Obras Curtidas',
            'Liked arts',
            style: TextStyle(
              fontFamily: 'AlfaSlabOne',
              fontSize: 20.0,
              fontWeight: FontWeight.w100,
              height: 1.0,
            ),
            textAlign: TextAlign.right,
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: likedArts.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(likedArts[index].title),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(likedArts[index].artistDisplayName),
                ],
              ),
              onTap: () {
                // Mostrar um AlertDialog para confirmar a exclusão
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Actions in art'),
                      content: const Text(
                        'Do you want to delete this art from your favorites?',
                      ),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            // Fechar o AlertDialog, Mudar para abrir os detalhes da obra
                            Navigator.of(context).pop();
                          },
                          child: Text('Ver detalhes'),
                        ),
                        TextButton(
                          onPressed: () {
                            // Fechar o AlertDialog
                            Navigator.of(context).pop();
                          },
                          child: Text('No'),
                        ),
                        TextButton(
                          onPressed: () async {
                            // Remover do Firestore
                            BlocProvider.of<LikeBloc>(context).add(DeleteLike(artTitle: likedArts[index].title));
                            // Remover localmente da lista
                            setState(() {
                              likedArts.removeAt(index);
                            });
                            // Fechar o AlertDialog
                            Navigator.of(context).pop();
                          },
                          child: Text('Yes'),
                        ),
                      ],
                    );
                  },
                );
              },
            );
          },
        ),
      ],
    );
  }




  //
  // Widget _buildImageFromUrl(String imageUrl) {
  //   try {
  //     return FutureBuilder(
  //       future: _fetchImageFromNetwork(imageUrl),
  //       builder: (context, snapshot) {
  //         if (snapshot.connectionState == ConnectionState.done) {
  //           if (snapshot.hasError) {
  //             print('Erro ao carregar a imagem: ${snapshot.error}');
  //             return Container(); // Ou um widget de imagem padrão para indicar erro
  //           } else {
  //             return Image.memory(snapshot.data as Uint8List, width: 100, height: 100);
  //           }
  //         } else {
  //           return CircularProgressIndicator(); // Pode exibir um indicador de carregamento enquanto a imagem está sendo buscada
  //         }
  //       },
  //     );
  //   } catch (e) {
  //     print('Erro ao carregar a imagem: $e');
  //     return Container(); // Ou um widget de imagem padrão para indicar erro
  //   }
  // }
  //
  // Future<Uint8List> _fetchImageFromNetwork(String imageUrl) async {
  //   final response = await http.get(Uri.parse(imageUrl));
  //
  //   if (response.statusCode == 200) {
  //     return Uint8List.fromList(response.bodyBytes);
  //   } else {
  //     throw Exception('Falha ao carregar a imagem');
  //   }
  // }

  Widget _buildInfoRow(String title, String description) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w900,
            ),
          ),
          Text(
            description,
            style: const TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w100,
            ),
          ),
        ],
      ),
    );
  }
}
