// categories.dart
import 'package:flutter/material.dart';
import 'categories-details.dart';

class CategoriesList {
  static List<String> categories = ['African', 'American', 'Asian'];
}

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            AppBarWidget(),
            Expanded(
              child: CategoriesListWidget(),
            ),
          ],
        ),
      ),
    );
  }
}

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 32, 16, 24),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'categories',
            style: TextStyle(
              fontFamily: 'AlfaSlabOne',
              fontSize: 24,
              color: Colors.black,
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pop(context); // Retorna para a HomePage
            },
            child: const Icon(
              Icons.close,
              size: 32,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

class CategoriesListWidget extends StatelessWidget {
  const CategoriesListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CategoryItem('African', () {
          _navigateToCategory(context, 'African');
        }),
        CategoryItem('American', () {
          _navigateToCategory(context, 'American');
        }),
        CategoryItem('Asian', () {
          _navigateToCategory(context, 'Asian');
        }),
      ],
    );
  }

  void _navigateToCategory(BuildContext context, String category) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CategoryDetailPage(category),
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String category;
  final VoidCallback onTap;

  const CategoryItem(this.category, this.onTap, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 74,
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.black,
              width: 0.5,
            ),
            bottom: BorderSide(
              color: Colors.black,
              width: 0.1,
            ),
          ),
        ),
        child: Center(
          child: Text(
            category,
            style: const TextStyle(
              fontFamily: 'Roboto',
              fontSize: 24,
              fontWeight: FontWeight.w100,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
