import 'package:flutter/material.dart';

import 'login_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  //final VoidCallback onLoginPressed;

  //const WelcomeScreen({required this.onLoginPressed, Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  void _redirectToLogin() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) {
        return const Scaffold(
          body: LoginScreen(), // Aqui, você redireciona diretamente para a página de login
        );
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Bem-vindo ao ArtKeep"),
            ElevatedButton(
              onPressed: _redirectToLogin, // Chama a função para ir diretamente para a página de login
              child: Text("Efetuar Login"),
            ),
          ],
        ),
      ),
    );
  }
}
