import 'package:flutter/material.dart';
import 'package:tuangeun/card_category-dinda.dart';
import 'package:tuangeun/card_category.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Expanded(
        child: GridView.count(
          padding: const EdgeInsets.all(20),
          crossAxisCount: 2,
          childAspectRatio: 3,
          children: [
            CategoryCard(
              cardTitle: "Restaurant",
              cardColor: Colors.amber,
              press: (){},
            ),
            Container(
              margin: EdgeInsets.all(4),
              color: Colors.red,
            ),
            Container(
              margin: EdgeInsets.all(4),
              color: Colors.blue,
            ),
            Container(
              margin: EdgeInsets.all(4),
              color: Colors.purple,
            ),
          ],
        )
      ),
    );
  }
}

// Widget buildCategoryCard (String categoryName) {

// }