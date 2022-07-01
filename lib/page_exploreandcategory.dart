import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tuangeun/page_category-explore.dart';
import 'package:tuangeun/page_explore.dart';
import 'resto_class.dart';
import 'tuangeun_theme.dart';
import 'card_buildrestocard.dart';
import 'card_resto-info.dart';
import 'page_restoinformation.dart';
import 'list_restolistpage.dart';
import 'page_category.dart';
import 'card_category.dart';

// var items = List<String>.generate(10, (i) => 'Item $i');

// JSON parsing
// Documentation used: https://docs.flutter.dev/cookbook/networking/background-parsing
Future<List<Resto>> fetchRestos(http.Client client) async {
  final response =
      // await client.get(Uri.parse('https://api.npoint.io/b76acd17475a19b3b5dc')); // OLDEST EXAMPLE DUMMY JSON
      // await client.get(Uri.parse('https://api.npoint.io/1a2ef27ab43e7eb6cdee')); // OLD EXAMPLE DUMMY JSON
      // await client.get(Uri.parse('https://api.npoint.io/776b89ade036023e7b8c')); // OLD EXAMPLE DUMMY JSON
      await client.get(Uri.parse('http://localhost:8000/api/restaurant'));
  // await client.get(Uri.parse('http://localhost:8000/api/restaurant'));

  // Use the compute function to run parsePhotos in a separate isolate.
  return compute(parseRestos, response.body);
}

// A function that converts a response body into a List<Photo>.
List<Resto> parseRestos(String responseBody) {
  final parsed = jsonDecode(responseBody);
  // final parsedData = parsed['data'] as List;
  // print(parsed['data']);

  return parsed['data'].map<Resto>((json) => Resto.fromJson(json)).toList();
}

class ExploreAndCategoryPage extends StatelessWidget {
  ExploreAndCategoryPage({Key? key}) : super(key: key);

  // JSON parsing, using placeholder/example data for now
  // var _jsonList = fetchRestos(http.Client());

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Builder(builder: (BuildContext context) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Expanded(
              flex: 4,
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
                                builder: (context) =>
                                    CategoryExplorePage("Restaurant")));
                      }),
                  CategoryCard(
                      categoryTitle: "Cafe",
                      categoryColor: Colors.blue,
                      press: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    CategoryExplorePage("Cafe")));
                      }),
                  CategoryCard(
                      categoryTitle: "Warung",
                      categoryColor: Colors.green,
                      press: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    CategoryExplorePage("Warung")));
                      }),
                  CategoryCard(
                      categoryTitle: "Fine Dining",
                      categoryColor: Colors.orange,
                      press: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    CategoryExplorePage("Fine Dining")));
                      })
                ],
              )),
          Expanded(
              flex: 8,
              child: FutureBuilder<List<Resto>>(
                  future: fetchRestos(http.Client()),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return const Center(
                        child: Text('An error has occured!'),
                      );
                    } else if (snapshot.hasData) {
                      return RestosListPage(restos: snapshot.data!);
                    } else {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircularProgressIndicator(),
                            SizedBox(height: 15),
                            Text('Loading data...', style: TuangeunTheme.darkTextTheme.headline3)
                          ],
                        )
                      );
                    }
                  })),
        ],
      );
    }));
  }
}
