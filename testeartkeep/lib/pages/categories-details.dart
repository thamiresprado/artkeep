// categories-details.dart
import 'package:flutter/material.dart';
import 'categories.dart';

class CategoryDetailPage extends StatelessWidget {
  final String category;

  CategoryDetailPage(this.category);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets
                  .fromLTRB(0, 24, 16, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    iconSize: 32,
                    color: Colors.black,
                  ),
                  SizedBox(width: 16),
                  Text(
                    category,
                    style: const TextStyle(
                      fontFamily: 'AlfaSlabOne',
                      fontSize: 24,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildCategorySection('PAINTINGS'),
                    _buildCategorySection('CERAMICS'),
                    _buildCategorySection('SCULPTURES'),
                    _buildExploreSection(context),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategorySection(String sectionName) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            sectionName,
            style: const TextStyle(
              fontFamily: 'AlfaSlabOne',
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 8),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildImageContainer('lib/images/art2.png'),
                _buildImageContainer('lib/images/art1.png'),
                _buildImageContainer('lib/images/art3.png'),
                _buildImageContainer('lib/images/art4.png'),
              ],
            ),
          ),
        ],

      ),

    );
  }

  Widget _buildImageContainer(String imagePath) {
    return Container(
      width: 250,
      height: 250,
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4.0),
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
          width: double.infinity,
        ),
      ),
    );
  }

  Widget _buildExploreSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16,
          24, 16, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'EXPLORE CATEGORIES',
            style: TextStyle(
              fontFamily: 'AlfaSlabOne',
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 8),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (String categoryName in CategoriesList.categories)
                  _buildCategoryCard(context, categoryName),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryCard(BuildContext context, String categoryName) {
    return Container(
      width: 140,
      height: 62,
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: GestureDetector(
        onTap: () {
          _navigateToCategory(context, categoryName);
        },
        child: Center(
          child: Text(
            categoryName,
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w100,
            ),
          ),
        ),
      ),
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
