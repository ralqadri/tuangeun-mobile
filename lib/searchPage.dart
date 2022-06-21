import 'package:flutter/material.dart';
import 'package:tuangeun/card_category.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreen createState() => _SearchScreen();
}

class _SearchScreen extends State<SearchScreen>{
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * .45,
            decoration: BoxDecoration(
              color: Colors.red[900],
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: <Widget>[
                  Text(
                      "SEARCH",
                      style: Theme.of(context).textTheme.displayLarge,
                      ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 30),
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(29.5)
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Expanded(
                    child: GridView.count(
                        crossAxisCount: 2,
                        childAspectRatio: 3,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(20.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(13),
                            ),
                            child: Column(
                              children: <Widget>[
                                CategoryCard(
                                  categoryTitle: "Restaurant",
                                  press: (){},
                                ),
                                CategoryCard(
                                  categoryTitle: "Cafe",
                                  press: (){},
                                ),
                                CategoryCard(
                                  categoryTitle: "Fine Dining",
                                  press: (){},
                                )
                              ],
                            ),
                          )
                        ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      )
    );
  }
}