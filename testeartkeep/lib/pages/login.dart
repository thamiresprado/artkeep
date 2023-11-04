import 'package:flutter/material.dart';
import 'package:testeartkeep/pages/register.dart';
import 'register.dart';

class Login extends StatefulWidget {
  const Login({Key? key});

  @override
  _LoginState createState() => _LoginState();
}


class _LoginState extends State<Login> {
  void _navigateToRegister() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return Register(navigator: Navigator.of(context));
        },
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/images/image-8.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/images/rectangle-black.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 0),
                Image.asset(
                  'lib/images/login-image.png',
                  width: 500,
                  height: 500,
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 5, left: 17, right: 17),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "username",
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 8, left: 17, right: 17),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "password",
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(
                      top: 20), // Adicione espaço acima do botão "Login"
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 17),
                  child: ElevatedButton(
                    onPressed: () {
                      // Ação do botão
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black87, // Cor de fundo
                      onPrimary: Colors.white, // Cor do texto
                      padding: const EdgeInsets.symmetric(
                          vertical: 20), // Ajuste o espaço vertical
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            8.0), // Ajuste o raio do botão
                      ),
                    ),
                    child: Text("Login"),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(
                      top: 10), // Adicione espaço acima do botão "Login"
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 17),
                  child: ElevatedButton(
                    onPressed: _navigateToRegister,
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent, // Cor de fundo
                      onPrimary: Colors.white, // Cor do texto
                      padding: const EdgeInsets.symmetric(
                          vertical: 20), // Ajuste o espaço vertical
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            8.0), // Ajuste o raio do botão
                      ),
                    ),
                    child: Text("Sign in"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
