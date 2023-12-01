import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testeartkeep/pages/welcome.dart';
import '../mainhomepage.dart';
import 'login_screen.dart';
import '../bloc/auth_bloc.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return WrapperState();
  }
}

class WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthError) {
          // Exiba um diálogo de erro, se necessário
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text("Opa, um erro aconteceu"),
                content: Text(state.message),
              );
            },
          );
        } else if (state is Authenticated) {
          // Se autenticado, navegue para a tela principal
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => MainHomePage()),
          );
        }
      },
      builder: (context, state) {
        // Renderize a tela adequada com base no estado atual
        if (state is Authenticated) {
          return authenticatedWidget(context);
        } else {
          return unauthenticatedWidget(context);
        }
      },
    );
  }
}

Widget authenticatedWidget(BuildContext context) {
  // Renderize a tela principal ou qualquer outra tela necessária para usuários autenticados
  return const MainHomePage();
}

Widget unauthenticatedWidget(BuildContext context) {
  // Renderize a tela de boas-vindas ou qualquer outra tela necessária para usuários não autenticados
  return const WelcomeScreen();
}
