import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  final NavigatorState navigator;
  const DetailsPage({Key? key, required this.navigator});

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
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
                  const Icon(
                    Icons.star_border,
                    size: 32.0,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            // Container branco com bordas arredondadas e cor de borda rosa
            Positioned(
              left: 20.0,
              right: 20.0,
              bottom: MediaQuery.of(context).size.height * 0.72 - 100.0,
              height: 180.0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4.0), // Bordas de 16px
                  border: Border.all(
                    color: Colors.grey,
                    width: 0.3,
                  ),
                ),
                padding: EdgeInsets.all(16.0), // Preenchimento interno de 16px
                child: Row(
                  children: [
                    Container(
                      width: 150,
                      height: 150,
                      margin: const EdgeInsets.only(right: 12.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0), // Bordas de 16px
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
}
