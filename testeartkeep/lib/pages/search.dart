import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  _SearchPageState createState() =>
      _SearchPageState();
}

class _SearchPageState extends State<SearchPage>{
  @override
  Widget build(BuildContext context){
    return const Scaffold(
      body: Center(
        child: Text('Hello, World!'),
      ),
    );
  }
}