import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/auth_bloc.dart';
import 'pages/wrapper.dart';
import 'mainhomepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyBwinaMF-GN8EOIUbc9xgzdopo0W-rNJ8g",
          authDomain: "artkeep-3a564.firebaseapp.com",
          projectId: "artkeep-3a564",
          storageBucket: "artkeep-3a564.appspot.com",
          messagingSenderId: "133879350250",
          appId: "1:133879350250:web:859ef8d6378fb3f579a893"));
  runApp(const MyApp());
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: "Bottom Navigation Bar",
//       theme: ThemeData(
//         useMaterial3: true,
//       ),
//       home: const MainHomePage(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'ArtKeep',
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: MultiBlocProvider(providers: [
          BlocProvider(create: (context) => AuthBloc()),
        ], child: const Wrapper()),
      debugShowCheckedModeBanner: false,);
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(widget.title),
      ),
      body: const Center(
      ),
    );
  }
}
