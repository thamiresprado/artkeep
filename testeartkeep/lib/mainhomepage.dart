import 'package:flutter/material.dart';
import 'package:testeartkeep/pages/homepage.dart';
import 'package:testeartkeep/pages/profile.dart';
import 'package:testeartkeep/pages/search.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({super.key});

  @override
  _MainHomePageState createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage>{
  int pageIndex = 0;
  final List<Widget> tabList = [
    HomePage(),
    SearchPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight
            (64.0), // Defina a altura do
          // cabeçalho como 72px
          child: AppBar(
            backgroundColor: Colors.white,
            actions: const [
              Padding(
                padding: EdgeInsets.only(right: 16.0),
                child: Icon(
                  Icons.menu, // Ícone no canto
                  // direito do cabeçalho
                  color: Colors.black, // Cor do ícone
                  size: 24.0, // Tamanho do ícone
                ),
              ),
            ],
          ),
        ),
      body: Stack(
        children: [
          tabList.elementAt(pageIndex),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Align(
              alignment: const Alignment(0.0, 1.0),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(30),
                ),
                child: BottomNavigationBar(
                  selectedItemColor: Colors.white,
                  unselectedItemColor: Colors.grey,
                  showSelectedLabels: true,
                  showUnselectedLabels: false,
                  backgroundColor: Colors.black,
                  currentIndex: pageIndex,
                  onTap: (int index) {
                    setState(() {
                      pageIndex = index;
                    });
                  },
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.search),
                      label: 'Search',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.person_outline),
                      label: 'Profile',
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      )
    );
  }
}