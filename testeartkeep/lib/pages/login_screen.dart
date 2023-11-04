import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/auth_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formkey = GlobalKey();
    String username = "";
    String password = "";
    return Form(
      key: formkey,
      child: Column(
        children: [
          TextFormField(
            validator: (String? inValue) {
              if (inValue!.isEmpty) {
                return "Insira algo como username";
              }
              return null;
            },
            onSaved: (String? inValue) {
              username = inValue!;
            },
          ),
          TextFormField(
            validator: (String? inValue) {
              if (inValue!.length < 4) {
                return "Tem que ter ao menos 4 caracteres";
              }
              return null;
            },
            onSaved: (String? inValue) {
              password = inValue!;
            },
          ),
          ElevatedButton(
            onPressed: () {
              if (formkey.currentState!.validate()) {
                formkey.currentState!.save();
                // Lançando evento
                context.read<AuthBloc>().add(LoginUser(username: username, password: password));
              }
            },
            child: const Text("Login"),
          ),
        ],
      ),
    );
  }
}
