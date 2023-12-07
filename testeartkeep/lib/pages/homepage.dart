import 'package:flutter/material.dart';
import 'package:testeartkeep/pages/profile.dart';
class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //TODO: quando tiver com banco, conectar imagens curtidas na api nesse metodo aqui
  // void _navigateToDetailPage() {
  //   Navigator.of(context).push(
  //     MaterialPageRoute(
  //       builder: (context) {
  //         return DetailsPage(navigator: Navigator.of(context));
  //       },
  //     ),
  //   );
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(64.0),
        child: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 80, top: 24, right: 0),
              height: 428.0,
              child: Image.asset('lib/images/principal-image.png'),
            ),
            const SizedBox(height: 80),
            SizedBox(
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
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
