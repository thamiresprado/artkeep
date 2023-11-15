import 'package:flutter/material.dart';
import 'package:testeartkeep/pages/register_screen.dart';

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
                image: AssetImage
                  ('lib/images/welcome-bg.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            // top: 200, //para ficar embaixo
            // troca pra bottom:0,
            bottom:48,
            left: 16,
            right: 16,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Welcome!",
                    style: TextStyle(
                      fontFamily: 'AlfaSlabOne',
                      fontSize: 40,
                      color: Colors.white,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only
                      (top: 4),
                    child: Text(
                      "Here you can visit the Metropolitan Art Museum without leaving your home",
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w100,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ));
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black87.withOpacity(0.7),
                        onPrimary: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 24),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          side: const BorderSide(width: 1, color: Colors.white30),
                        ),
                      ),
                      child: const Text("START NOW"),
                                    ),
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

