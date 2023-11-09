import 'package:flutter/material.dart';

import 'login_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/images/met.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 200, //para ficar embaixo
            // troca pra bottom:0,
            left: 24,
            right: 24,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hey there!",
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w900,
                      fontSize: 40,
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: Text(
                      "Here you can visit the "
                          "Metropolitan Art Museum without leaving your home. With just a click, embark on a journey through the epochs, witnessing the evolution of artistic movements and the pulse of cultural shifts. Whether it's the classical elegance of Renaissance masterpieces or the bold strokes of contemporary creations, the Metropolitan Art Museum beckons you to explore, learn, and be inspired, all within the confines of your virtual sanctuary.",
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w100,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 24),
                  // Container(
                  //   width: double.infinity,
                  //   padding: const EdgeInsets.symmetric(horizontal: 24),
                  //   child: ElevatedButton(
                  //     onPressed: () {
                  //       Navigator.push(
                  //         context,
                  //         MaterialPageRoute(builder: (context) => LoginScreen()),
                  //       );
                  //     },
                  //     style: ElevatedButton.styleFrom(
                  //       primary: Colors.black87.withOpacity(0.7),
                  //       onPrimary: Colors.white,
                  //       padding: const EdgeInsets.symmetric(vertical: 24),
                  //       shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(4.0),
                  //         side: const BorderSide(width: 1, color: Colors.white30),
                  //       ),
                  //     ),
                  //     child: const Text("START NOW"),
                  //   ),
                  // // ),
                  // const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

