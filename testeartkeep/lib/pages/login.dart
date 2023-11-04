import 'package:flutter/material.dart';
import 'package:testeartkeep/pages/register.dart';

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
                image: AssetImage('lib/images/met.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Center(
              child: Column(
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
                        top: 20),
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 17),
                    child: ElevatedButton(
                      onPressed: () {
                        // Ação do botão
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black87,
                        onPrimary: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            vertical: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              8.0),
                        ),
                      ),
                      child: Text("Login"),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      top: 10,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 17),
                    child: ElevatedButton(
                      onPressed: _navigateToRegister,
                      style: ElevatedButton.styleFrom(
                        primary: Colors.transparent,
                        onPrimary: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            vertical: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              8.0),
                        ),
                      ),
                      child: Text("Sign in"),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                        top: 100),
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
