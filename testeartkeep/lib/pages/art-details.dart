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
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: 280.0,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    'lib/images/foryou-1.png',
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                  Container(
                    color: Colors.black
                        .withOpacity(0.7), //background
                  ),
                ],
              ),
            ),

            // AppBar
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Ícone à esquerda
                  GestureDetector(
                    onTap: () {
                      widget.navigator.pop(); // Voltar para a página anterior
                    },
                    child: const Icon(
                      Icons.arrow_back,
                      size: 32.0,
                      color: Colors.white,
                    ),
                  ),
                  // Ícone à direita
                  GestureDetector(
                    onTap: () {
                      _showBottomSheet();
                    },
                    child: const Icon(
                      Icons.star_border,
                      size: 32.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),

            Positioned( // Titulo e obra
              left: 20.0,
              right: 20.0,
              bottom: MediaQuery.of(context).size.height * 0.72 - 100.0,
              height: 180.0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4.0),
                  border: Border.all(
                    color: Colors.grey,
                    width: 0.3,
                  ),
                ),
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
                        mainAxisAlignment:MainAxisAlignment.center,
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
            ),

            Align( //carrossel
              alignment: const Alignment(0, 0.15),
                child: SingleChildScrollView(
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
                        margin: const EdgeInsets.only(left: 8, right: 20),
                        child: Image.asset(
                          'lib/images/art4.png',
                          fit: BoxFit.cover,
                          width: double.infinity,
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
  void _showBottomSheet() {
    setState(() {
      _isBottomSheetVisible = true;
    });
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          // Defina o conteúdo da sua bottom sheet aqui
          child: Column(
            children: [
              ListTile(
                title: Text('Item 1'),
                onTap: () {
                  // Adicione a lógica para lidar com o clique no item 1 aqui
                },
              ),
              ListTile(
                title: Text('Item 2'),
                onTap: () {
                  // Adicione a lógica para lidar com o clique no item 2 aqui
                },
              ),
              // Adicione mais itens da bottom sheet, se necessário
            ],
          ),
        );
      },
    );
  }
}
