import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testeartkeep/pages/register_screen.dart';
import '../bloc/auth_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formkey = GlobalKey();
    String username = "";
    String password = "";
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
                Image.asset(
                  'lib/images/login-image.png',
                  width: 300,
                  height: 300,
                ),
                Form(
                  key: formkey, // Adicione o Form aqui
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(
                          top: 102,
                          left: 16,
                          right: 16,
                          bottom: 6,
                        ),
                        child: TextFormField(
                          // validator: (String? inValue) {
                          //   if (inValue!.isEmpty) {
                          //     return "Insira algo como username";
                          //   }
                          //   return null;
                          // },
                          onSaved: (String? inValue) {
                            username = inValue!;
                          },
                          decoration: const InputDecoration(
                            hintText: "email",
                            prefixIcon: Icon(Icons.person),
                            border: OutlineInputBorder(),
                            filled: true,
                            fillColor: Colors.white,
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                          left: 16,
                          right: 16,
                          bottom: 12,
                        ),
                        child: TextFormField(
                          // validator: (String? inValue) {
                          //   if (inValue!.length < 4) {
                          //     return "Tem que ter ao menos 4 caracteres";
                          //   }
                          //   return null;
                          // },
                          onSaved: (String? inValue) {
                            password = inValue!;
                          },
                          decoration: const InputDecoration(
                            hintText: "password",
                            prefixIcon: Icon(Icons.lock),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(width: 0.5), // Espessura da borda
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: ElevatedButton(
                          onPressed: () {
                            if (formkey.currentState!.validate()) {
                              formkey.currentState!.save();
                              context.read<AuthBloc>().add(LoginUser(username: username, password: password));
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.black87.withOpacity(0.7), // Cor de fundo
                            onPrimary: Colors.white, // Cor do texto
                            padding: const EdgeInsets.symmetric(vertical: 24), // Ajuste o espaço vertical
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
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ElevatedButton(
                    onPressed: () {
                      // Navegar para a página de registro quando o botão for clicado
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return const RegisterScreen();
                            // Substitua "Register" pelo nome da sua página de registro
                          },
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      onPrimary: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 24), // Ajuste o espaço vertical
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                    ),
                    child: const Text("SIGN UP"),
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
