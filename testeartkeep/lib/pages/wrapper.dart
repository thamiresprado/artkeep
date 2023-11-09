import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testeartkeep/pages/welcome.dart';

//import '../bloc/manage_bloc.dart';
//import '../bloc/monitor_bloc.dart';
//import 'add_note.dart';
//import 'list_note.dart';
import '../mainhomepage.dart';
import 'login_screen.dart';

import '../bloc/auth_bloc.dart';

import 'register_screen.dart';

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
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text("Opa, um erro aconteceu"),
                  content: Text(state.message),
                );
              });
        }
      },
      builder: (context, state) {
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
  return const MainHomePage();
}

Widget unauthenticatedWidget(BuildContext context) {
  return DefaultTabController(
    length: 3,
    child: Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(""),
        centerTitle: true,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(120),
          child: Padding(
            padding: EdgeInsets.only(bottom: 0),
            child: TabBar(
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white,
              labelStyle: TextStyle(fontWeight: FontWeight.w900),
              unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
              indicator: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.transparent, width: 3)),
              ),
              tabs: [
                Tab(
                  text: "Welcome",
                ),
                Tab(
                  text: "Login",
                ),
                Tab(
                  text: "SignUp",
                ),
              ],
            ),
          ),
        ),
        flexibleSpace: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'lib/images/login-image.png',
                width: 72,
                height: 72,
              ),
            ],
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/images/met.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: const TabBarView(
          children: [
            WelcomeScreen(),
            LoginScreen(),
            RegisterScreen(),
          ],
        ),
      ),
    ),
  );

}

// Widget unauthenticatedWidget(BuildContext context) {
//   return const LoginScreen();
// }

