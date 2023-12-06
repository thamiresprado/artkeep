import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testeartkeep/pages/register_screen.dart';
import '../bloc/auth_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with SingleTickerProviderStateMixin {
  GlobalKey<FormState> formkey = GlobalKey();
  String username = "";
  String password = "";
  String firstname = "";

  TabController? _tabController;
  bool _obscureText = true;
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
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

          Positioned(
            top: 90,
            left: MediaQuery.of(context).size.width / 2 - 50, // Ajuste o valor conforme necessário
            child: Image.asset(
              'lib/images/login-image.png',
              width: 100,
              height: 100,
            ),
          ),

          Positioned(
            bottom: 12,
            left: 32,
            right: 32,
            child: SingleChildScrollView(
              child: Form(
                key: formkey,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(
                        // left: 24,
                        // right: 24,
                        bottom: 6,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: TextFormField(
                          onSaved: (String? inValue) {
                            username = inValue!;
                          },
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                          decoration: const InputDecoration(
                            hintText: "email",
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.black,
                              size: 16,
                            ),
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),

                    Container(
                      padding: const EdgeInsets.only(
                        bottom: 12,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: TextFormField(
                          controller: _passwordController,
                          onSaved: (String? inValue) {
                            password = inValue!;
                          },
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            hintText: "password",
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: Colors.black,
                              size: 16,
                            ),
                            border: InputBorder.none,
                            hintStyle: const TextStyle(
                              color: Colors.black,
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscureText ? Icons.visibility : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                            ),
                          ),
                          obscureText: _obscureText,
                        ),
                      ),
                    ),

                    Container(
                      width: double.infinity,
                      // padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: ElevatedButton(
                        onPressed: () async {
                          if (formkey.currentState!.validate()) {
                            formkey.currentState!.save();

                            // Adicione o evento de autenticação ao AuthBloc
                            context.read<AuthBloc>().add(LoginUser(username: username, password: password));
                          }
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
                        child: const Text("LOGIN"),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only
                        (top: 6),
                    ),

                    Container(
                      width: double.infinity,
                      // padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen()));
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.transparent,
                          onPrimary: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 24),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0),
                          ),
                        ),
                        child: const Text(
                          "SIGN UP",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            decoration:
                            TextDecoration
                                .underline,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}