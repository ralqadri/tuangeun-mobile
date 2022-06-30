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
      body: SafeArea(
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
                    child: const TextField(
                      style: TextStyle(color: Color.fromARGB(255, 54, 54, 54)),
                      decoration: InputDecoration(
                        
                        hintText: "Search",
                        hintStyle: TextStyle(color: Color.fromARGB(255, 143, 143, 143)),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
      );
  }
}