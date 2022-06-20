
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'resto_class.dart';
// ignore: unused_import
import 'tuangeun_theme.dart';
import 'resto_card-info.dart';

var items = List<String>.generate(10, (i) => 'Item $i');

// JSON parsing
// Documentation used: https://docs.flutter.dev/cookbook/networking/background-parsing
Future<List<Resto>> fetchRestos(http.Client client) async {
  final response = await client
      .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));

  // Use the compute function to run parsePhotos in a separate isolate.
  return compute(parseRestos, response.body);
}

// A function that converts a response body into a List<Photo>.
List<Resto> parseRestos(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Resto>((json) => Resto.fromJson(json)).toList();
}

class ExplorePage extends StatelessWidget {
  ExplorePage({Key? key}) : super(key: key);

  // JSON parsing, using placeholder/example data for now
  var _jsonList = fetchRestos(http.Client());

  @override
  Widget build(BuildContext context) {
    // return ListView.builder(
    //   itemCount: items.length,
    //   itemBuilder: (context, index) {
    //     return buildCard(items[index], items[index], index);
    //   },
    // );
    return FutureBuilder<List<Resto>>(
        future: fetchRestos(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('An error has occured!'));
          } else if (snapshot.hasData) {
            return RestosList(restos: snapshot.data!);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}

class RestosList extends StatelessWidget {
  const RestosList({super.key, required this.restos});

  final List<Resto> restos;
  
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: restos.length,
      itemBuilder: (context, index) {
        return buildCard(restos[index], index);
      },
    );
  }
}

Widget buildCard(Resto resto, int index) {
  return Center(
      child: Container(
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          constraints: const BoxConstraints(minWidth: 200, maxWidth: 1280),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: index % 2 == 0
                  ? const AssetImage('example_resto.jpg')
                  : const AssetImage('example_cafe.jpg'),
              fit: BoxFit.cover,
            ),
            gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xCC000000),
                  Color(0x00000000),
                  Color(0x00000000),
                  Color(0xCC000000),
                ]),
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3),
              )
            ],
          ),
          child: Column(
            children: [
              RestoInfoCard(restoName: (resto.title), restoTitle: resto.id.toString())
            ],
          )
        )
      );
}
