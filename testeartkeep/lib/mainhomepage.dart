import 'package:flutter/material.dart';
import 'package:testeartkeep/pages/art-details.dart';
import 'package:testeartkeep/pages/categories.dart';
import 'package:testeartkeep/widgets/appbar.dart';
import 'package:testeartkeep/widgets/bottomnavigationbar.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({Key? key}) : super(key: key);

  @override
  _MainHomePageState createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  int pageIndex = 0;

  void _navigateToDetailPage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return DetailsPage(navigator: Navigator.of(context));
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
      title: '',
      icon: Icons.menu,
        onTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => CategoriesPage()),
          );
        },
        automaticallyImplyLeading: false,
    ),

      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 80, top: 24, right: 0),
                  height: 428.0,
                  child: Image.asset('lib/images/principal-image.png'),
                ),
                const SizedBox(height: 80),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset('lib/images/the-met.png', fit: BoxFit.cover),
                ),
                const SizedBox(height: 12),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: const Text(
                    "One of the world's largest and finest art museums. Its collection spans 5,000 years of world culture, from prehistory to the present and from every part of the globe.",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w200,
                      height: 1.4,
                    ),
                  ),
                ),
                const SizedBox(height: 60),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  height: 0.2,
                  color: Colors.black,
                ),
                const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(width: 16),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(left: 20, right: 16),
                        constraints: const BoxConstraints(maxWidth: 200),
                        child: const Text(
                          "Now it is your time to create your own gallery. Here we have some suggestions based on your favorites types of art",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w200,
                            height: 1.4,
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 20),
                      width: 100,
                      child: Image.asset('lib/images/foryou.png'),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                InkWell(
                  onTap: _navigateToDetailPage,
                  child: Container(
                    child: Image.asset(
                      'lib/images/foryou-1.png',
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: _navigateToDetailPage,
                      child: Container(
                        width: (MediaQuery.of(context).size.width - 4) / 2,
                        height: 140,
                        child: Image.asset(
                          'lib/images/foryou-2.png',
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: _navigateToDetailPage,
                      child: Container(
                        width: (MediaQuery.of(context).size.width - 4) / 2,
                        height: 140,
                        child: Image.asset(
                          'lib/images/foryou-3.png',
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Container(
                  margin: const EdgeInsets.only(left: 8, right: 8),
                  child: ElevatedButton(
                    onPressed: () {
                      // levar para a página do perfil
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      onPrimary: Colors.white,
                      minimumSize: const Size(double.infinity, 48),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    child: const Text(
                      "SEE MORE",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 100),
              ],
            ),
          ),
          CustomBottomNavigationBar(
            currentIndex: pageIndex,
            onTap: (int index) {
              setState(() {
                pageIndex = index;
              });
            },
          ),
        ],
      ),
    );
  }
}
