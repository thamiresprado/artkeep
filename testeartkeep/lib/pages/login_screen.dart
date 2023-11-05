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
  TabController? _tabController;

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
          SingleChildScrollView(
            child: Column(
              children: [
                // Image.asset(
                //   'lib/images/login-image.png',
                //   width: 300,
                //   height: 300,
                // ),
                const SizedBox(height: 120),
                Form(
                  key: formkey,
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(
                          top: 102,
                          left: 24,
                          right: 24,
                          bottom: 6,
                        ),
                        child: TextFormField(
                          onSaved: (String? inValue) {
                            username = inValue!;
                          },
                          decoration: const InputDecoration(
                            hintText: "email",
                            prefixIcon: Icon
                              (Icons.person, color: Colors.white),
                            border: OutlineInputBorder(),
                            hintStyle:
                            TextStyle(color:
                            Colors.white38),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                          left: 24,
                          right: 24,
                          bottom: 12,
                        ),
                        child: TextFormField(
                          onSaved: (String? inValue) {
                            password = inValue!;
                          },
                          decoration: const InputDecoration(
                            hintText: "password",
                            prefixIcon: Icon
                              (Icons.lock,
                              color: Colors.white),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(width: 0.5),
                            ),
                            hintStyle:
                            TextStyle(color:
                            Colors.white38),
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: ElevatedButton(
                          onPressed: () {
                            if (formkey.currentState!.validate()) {
                              formkey.currentState!.save();
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
                        padding: EdgeInsets.only(top: 2),
                      ),
                    ],
                  ),
                ),
                // Container(
                //   width: double.infinity,
                //   padding: const EdgeInsets.symmetric(horizontal: 24),
                //   child: ElevatedButton(
                //     onPressed: () {
                //       _tabController?.animateTo(1); // Mude para a segunda guia (índice 1)
                //     },
                //     style: ElevatedButton.styleFrom(
                //       primary: Colors.transparent,
                //       onPrimary: Colors.white,
                //       padding: const EdgeInsets.symmetric(vertical: 24),
                //       shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(4.0),
                //       ),
                //     ),
                //     child: const Text("SIGN UP"),
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
