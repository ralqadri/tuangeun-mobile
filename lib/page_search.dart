import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tuangeun/card_category.dart';
import 'package:tuangeun/page_category-explore.dart';
import 'package:tuangeun/page_searchedresto.dart';
import 'card_category.dart';
import 'page_category.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreen createState() => _SearchScreen();
}

class _SearchScreen extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            children: <Widget>[
              SizedBox(height:50),
              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(29.5)),
                  child: TextField(
                    style: TextStyle(color: Color.fromARGB(255, 54, 54, 54)),
                    decoration: InputDecoration(
                      hintText: "Search",
                      hintStyle:
                          TextStyle(color: Color.fromARGB(255, 143, 143, 143)),
                      border: InputBorder.none,
                    ),
                    onSubmitted: (String value) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SearchedRestoPage(value)
                        )
                      );
                    }
                  ),
                ),
              ),
              Expanded(
                flex: 8,
                child: GridView.count(
                  padding: const EdgeInsets.all(15),
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
                      categoryColor: Colors.amber,
                      press: () {
                        Navigator.push(
                          context, 
                          MaterialPageRoute(
                            builder: (context) => CategoryExplorePage("Fine Dining")
                          )
                        );
                      }
                    ),
                    CategoryCard(
                      categoryTitle: "Coffeeshop",
                      categoryColor: Colors.brown,
                      press: () {
                        Navigator.push(
                          context, 
                          MaterialPageRoute(
                            builder: (context) => CategoryExplorePage("Coffeeshop")
                          )
                        );
                      }
                    ),
                    CategoryCard(
                      categoryTitle: "Healthy Food",
                      categoryColor: Colors.lightGreen,
                      press: () {
                        Navigator.push(
                          context, 
                          MaterialPageRoute(
                            builder: (context) => CategoryExplorePage("Healthy Food")
                          )
                        );
                      }
                    ),
                  ],
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}
