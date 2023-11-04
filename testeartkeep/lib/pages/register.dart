import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final NavigatorState navigator;
  const Register({Key? key, required this.navigator});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _isBottomSheetVisible = false;
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
                const Padding(
                  padding: EdgeInsets.only(
                      top: 50), 
                ),
                //const SizedBox(height: 0),
                Image.asset(
                  'lib/images/login-image.png',
                  width: 100,
                  height: 100,
                ),
                const Padding(
                  padding: EdgeInsets.only(
                      top: 50), 
                ),

                //name
                const Padding(
                  padding: EdgeInsets.only(top: 5, left: 17, right: 17),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "name",
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(
                      top: 12), 
                ),

                //user
                const Padding(
                  padding: EdgeInsets.only(top: 5, left: 17, right: 17),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "user",
                      prefixIcon: Icon(Icons.person_pin_rounded),
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(
                      top: 12), 
                ),

//password
                const Padding(
                  padding: EdgeInsets.only(top: 5, left: 17, right: 17),
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
                      top: 12), 
                ),

                //birthday
                const Padding(
                  padding: EdgeInsets.only(top: 5, left: 17, right: 17),
                  child: TextField(
                      decoration: InputDecoration(
                      hintText: "birthday",
                      prefixIcon: Icon(Icons.date_range),
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),

                const Padding(
                  padding: EdgeInsets.only(
                      top: 12), 
                ),

//telefone
                const Padding(
                  padding: EdgeInsets.only(top: 5, left: 17, right: 17),
                  child: TextField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      hintText: "cell",
                      prefixIcon: Icon(Icons.tablet_android_outlined),
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(
                      top: 12),
                ),

                //email
                const Padding(
                  padding: EdgeInsets.only(top: 5, left: 17, right: 17),
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: "email",
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(
                      top: 12), 
                ),

                //country
                const Padding(
                  padding: EdgeInsets.only(top: 5, left: 17, right: 17),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "country",
                      prefixIcon: Icon(Icons.home),
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(
                      top: 12), 
                ),

                //about me
                const Padding(
                  padding: EdgeInsets.only(top: 5, left: 17, right: 17),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "about me",
                      prefixIcon: Icon(Icons.abc_outlined),
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),

                const Padding(
                  padding: EdgeInsets.only(
                      top: 12), 
                ),

                //Botão cadastrar

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
                    child: Text("Cadastrar"),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(
                      top: 30),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
