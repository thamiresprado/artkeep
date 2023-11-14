import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/auth_bloc.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 126,
            color: Colors.black87,
            child: ElevatedButton(
              onPressed: () {
                BlocProvider.of<AuthBloc>(context).add(Logout());
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.transparent,
                onPrimary: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 24),
                shape: const RoundedRectangleBorder(
                  side: BorderSide(width: 1, color: Colors.black),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(Icons.logout),
                  SizedBox(width: 8),
                ],
              ),
            ),
          ),





          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
            child: Container(
              decoration: BoxDecoration(
                // color: Colors.purpleAccent,
                borderRadius: BorderRadius.circular(10), // Ajuste o valor conforme necessário
                border: Border.all(width: 1, color: Colors.black),
              ),
              height: 104,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'lib/images/avatar.png',
                    width: 72,
                    height: 72,
                  ),
                  const SizedBox(width: 16),
                  const Text(
                    'Mari Araújo',
                    style: TextStyle(
                      fontSize: 24.0, // Tamanho da fonte
                      fontFamily: 'AlfaSlabOne',
                    ),
                  ),
                  const Text(
                    '',
                    style: TextStyle(

                      fontSize: 12.0, // Tamanho da fonte
                      fontWeight: FontWeight.w200, // Peso da fonte
                    ),
                  ),
                ],
              ),
            ),
          ),


          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: Container(
              decoration: BoxDecoration(
                // color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              height: 200,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 16),
                  Padding(padding: const EdgeInsets.only(left: 8), // Adiciona espaço à esquerda do texto
                    child: Text(
                      ' ',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Alfa Slab One',
                      ),
                    ),
                  )
                  // Text(
                  //   'NAME',
                  //   style: TextStyle(
                  //     fontSize: 16.0,
                  //     fontWeight: FontWeight.bold,
                  //     fontFamily: 'Alfa Slab One',
                  //   ),
                  // ),
                  // Text(
                  //   'Mari Araújo',
                  //   style: TextStyle(
                  //     fontSize: 10.0,
                  //     fontWeight: FontWeight.bold,
                  //     fontFamily: 'Alfa Slab One',
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}