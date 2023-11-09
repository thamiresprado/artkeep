import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/auth_bloc.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() =>
      _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: ElevatedButton(
        onPressed: () {
          BlocProvider.of<AuthBloc>(context).add(Logout());
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
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.logout),
            SizedBox(width: 8), // Adjust the spacing as needed
            Text("LOGOUT"),
          ],
        ),
      ),
    );

  }
}