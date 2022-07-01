import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tuangeun/list_restolistpage.dart';
import 'resto_class.dart';
import 'tuangeun_theme.dart';

class CategoryExplorePage extends StatelessWidget {
  CategoryExplorePage(this.categoryQuery, {super.key});

  String categoryQuery;

  // JSON parsing for resto list according to category
  Future<List<Resto>> fetchRestos(http.Client client) async {
    final response = await client.get(Uri.parse(
        'http://localhost:8000/api/restaurant/categories/$categoryQuery'));

    return compute(parseRestos, response.body);
  }

  List<Resto> parseRestos(String responseBody) {
    final parsed = jsonDecode(responseBody);
    // final parsedData = parsed['data'] as List;
    // print(parsed['data']);

    return parsed['data'].map<Resto>((json) => Resto.fromJson(json)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryQuery),
      ),
      body: FutureBuilder<List<Resto>>(
        future: fetchRestos(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('An error has occured! Category: $categoryQuery'));
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
                  Text('Loading $categoryQuery...',
                      style: TuangeunTheme.darkTextTheme.headline3),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

