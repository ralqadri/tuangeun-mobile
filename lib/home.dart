import 'package:flutter/material.dart';
import 'package:tuangeun/page_explore.dart';
import 'package:tuangeun/page_exploreandcategory.dart';
import 'page_search.dart';
import 'page_explore.dart';
import 'page_category.dart';

// 1
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  static List<Widget> pages = <Widget>[
    ExploreAndCategoryPage(),
    ExplorePage(),
    SearchScreen(), 
    CategoryPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tuangeun',
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).textSelectionTheme.selectionColor,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: Icon(Icons.explore_rounded),
            label: 'Explore and Category',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.food_bank_rounded),
            label: 'Explore',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.search_rounded),
            label: 'Search',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.category_rounded),
            label: 'Categories',
          )
        ],
      ),
    );
  }
}
