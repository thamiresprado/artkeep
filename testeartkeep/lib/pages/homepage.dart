import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 80, top: 24, right: 0),
              height: 428.0,
              child: Image.asset('lib/images/principal-image.png'),
            ),
            const SizedBox(height: 80),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Image.asset('lib/images/the-met.png', fit: BoxFit.cover),
            ),
            const SizedBox(height: 12),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: const Text(
                "One of the world's largest and finest art museums. Its collection spans 5,000 years of world culture, from prehistory to the present and from every part of the globe.",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w200,
                  height: 1.4,
                ),
              ),
            ),
            const SizedBox(height: 60),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              height: 0.2,
              color: Colors.black,
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(width: 16),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 20, right: 16),
                    constraints: const BoxConstraints
                      (maxWidth: 200),
                    child: const Text(
                      "Now it is your time to create your own gallery. Here we have some suggestions based on your favorites types of art",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w200,
                        height: 1.4,
                      ),
                      textAlign: TextAlign.right,
                    ),

                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 20),
                  width: 100,
                  child: Image.asset
                    ('lib/images/foryou.png'),
                ),
              ],
            ),
            const SizedBox(height: 180),
          ],
        ),
      ),
    );
  }
}
