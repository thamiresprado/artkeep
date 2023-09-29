import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() =>
      _HomePageState();
}

class _HomePageState extends State<HomePage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(left:80,
            top: 24, right:0),
        height: 428.0,
        child: Image.asset
          ('lib/images/principal-image.png'),
        // Substitua pelo caminho da sua imagem
      ),
    );
  }
}