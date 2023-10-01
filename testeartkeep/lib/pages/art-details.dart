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
                    color: Colors.black.withOpacity(0.7), //background
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
                  GestureDetector(
                    onTap: () {
                      widget.navigator.pop();
                    },
                    child: const Icon(
                      Icons.arrow_back,
                      size: 32.0,
                      color: Colors.white,
                    ),
                  ),
                  const Icon(
                    Icons.star_border,
                    size: 32.0,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            Positioned(
              left: 20.0,
              right: 20.0,
              bottom: MediaQuery.of(context).size.height * 0.67 - 100.0,
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
              ),
            ),
            
            //o resto do conteudo aqui

          ],
        ),
      ),
    );
  }
}
