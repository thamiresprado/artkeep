import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  final NavigatorState navigator;
  const DetailsPage({Key? key, required this.navigator});

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  bool _isBottomSheetVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 60,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Container(
                    color: const Color(0xFFFAFAFA),
                  ),
                  Positioned(
                    top: 20.0,
                    left: 16.0,
                    right: 16.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            widget.navigator.pop();
                          },
                          child: const Icon(
                            Icons.arrow_back,
                            size: 32.0,
                            color: Colors.black,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            _showBottomSheet();
                          },
                          child: const Icon(
                            Icons.star_border,
                            size: 32.0,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
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
                          Container(
                            width: 150,
                            height: 150,
                            margin: const EdgeInsets.only(right: 12.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            child: Image.asset(
                              'lib/images/foryou-1.png',
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Annunciation Triptych (Merode Altarpiece)',
                                  style: TextStyle(
                                    fontSize: 26.0,
                                    fontWeight: FontWeight.w900,
                                    height: 1.0,
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
                        children: [
                          Container(
                            width: 250,
                            height: 250,
                            margin: const EdgeInsets.only(left: 20),
                            child: Image.asset(
                              'lib/images/art2.png',
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                          Container(
                            width: 250,
                            height: 250,
                            margin: const EdgeInsets.only(left: 8),
                            child: Image.asset(
                              'lib/images/art1.png',
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                          Container(
                            width: 250,
                            height: 250,
                            margin: const EdgeInsets.only(left: 8),
                            child: Image.asset(
                              'lib/images/art3.png',
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                          Container(
                            width: 250,
                            height: 250,
                            margin: const
                            EdgeInsets.only
                              (left: 8, right: 16),
                            child: Image.asset(
                              'lib/images/art4.png',
                              fit: BoxFit.cover,
                              width: double.infinity,
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildInfoRow('ARTIST', 'Workshop of Robert Campin (Netherlandish, ca. 1375–1444 Tournai)'),
                                _buildInfoRow('DATE', 'ca. 1427–32'),
                                _buildInfoRow('GEOGRAPHY', 'Made in Tournai, South Netherlands'),
                                _buildInfoRow('CULTURE', 'South Netherlandish'),
                                _buildInfoRow('MEDIUM', 'Oil on oak'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 32),

                    // Seção de comentários
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets
                          .fromLTRB(16.0, 24,
                          16.0, 16.0),
                      color: const Color
                        (0xFFF5F5F5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'comments',
                            style: TextStyle(
                              fontFamily: 'AlfaSlabOne',
                              fontSize: 24.0,
                            ),
                          ),
                          CommentWidget(
                            userName: 'John Doe',
                            time: '2h ago',
                            comment: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                          ),
                          CommentWidget(
                            userName: 'Jane Smith',
                            time: '1h ago',
                            comment: 'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

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

  void _showBottomSheet() {
    // ... (código anterior)
  }
}

class CommentWidget extends StatelessWidget {
  final String userName;
  final String time;
  final String comment;

  CommentWidget({
    required this.userName,
    required this.time,
    required this.comment,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16.0),
      padding: const EdgeInsets.symmetric
        (horizontal: 16.0, vertical: 8.0),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // Imagem do usuário
              CircleAvatar(
                radius: 16.0,
                // Substitua a linha abaixo pela lógica real de obtenção da imagem do usuário
                backgroundImage: AssetImage('lib/images/user_avatar.png'),
              ),
              SizedBox(width: 4.0),
              // Nome do usuário
              Text(
                userName,
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Spacer(), // Espaço flexível para empurrar a hora para a direita
              // Hora do comentário
              Text(
                time,
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.0),
          // Comentário
          Text(
            comment,
            style: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w200,
              fontFamily: 'Roboto',
            ),
          ),
        ],
      ),
    );
  }
}
