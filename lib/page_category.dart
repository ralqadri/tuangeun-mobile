import 'package:flutter/material.dart';
import 'package:tuangeun/card_category.dart';
import 'page_category-explore.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GridView.count(
        padding: const EdgeInsets.all(20),
        crossAxisCount: 2,
        childAspectRatio: 3,
        children: [
          CategoryCard(
            categoryTitle: "Restaurant",
            categoryColor: Colors.amber,
            press: () {
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => CategoryExplorePage("Restaurant")
                )
              );
            }
          ),
          CategoryCard(
            categoryTitle: "Cafe",
            categoryColor: Colors.blue,
            press: () {
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => CategoryExplorePage("Cafe")
                )
              );
            }
          ),
          CategoryCard(
            categoryTitle: "Warung",
            categoryColor: Colors.green,
            press: () {
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => CategoryExplorePage("Warung")
                )
              );
            }
          ),
          CategoryCard(
            categoryTitle: "Fine Dining",
            categoryColor: Colors.deepOrange,
            press: () {
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => CategoryExplorePage("Fine Dining")
                )
              );
            }
          ),
        ],
      ),
    );
  }
}

// Widget buildCategoryCard (String categoryName) {

// }