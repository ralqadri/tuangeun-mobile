import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'resto_class.dart';
import 'tuangeun_theme.dart';
import 'card_resto-info.dart';
import 'page_restoinformation.dart';

// var items = List<String>.generate(10, (i) => 'Item $i');

// JSON parsing
// Documentation used: https://docs.flutter.dev/cookbook/networking/background-parsing
Future<List<Resto>> fetchRestos(http.Client client) async {
  final response =
      await client.get(Uri.parse('https://api.npoint.io/b76acd17475a19b3b5dc'));

  // Use the compute function to run parsePhotos in a separate isolate.
  return compute(parseRestos, response.body);
}

// A function that converts a response body into a List<Photo>.
List<Resto> parseRestos(String responseBody) {
  final parsed = jsonDecode(responseBody);

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
    //     return buildRestoCard(items[index], items[index], index);
    //   },
    // );
    return FutureBuilder<List<Resto>>(
        future: fetchRestos(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('An error has occured!'));
          } else if (snapshot.hasData) {
            return RestosListPage(restos: snapshot.data!);
          } else {
            return const Center(
              child: Text('Data not loaded!'),
            );
          }
        });
  }
}

class RestosListPage extends StatelessWidget {
  const RestosListPage({super.key, required this.restos});

  final List<Resto> restos;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: restos.length,
      itemBuilder: (context, index) {
        return buildRestoCard(restos[index], index, context);
      },
    );
  }
}

// TODO: Refactor buildRestoCard into it's own .dart file for consistency
Widget buildRestoCard(Resto resto, int index, BuildContext context) {
  return Center(
      child: Material(
    color: Colors.transparent,
    child: InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => RestoInformationPage(resto)));
      },
      child: Container(
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          constraints: const BoxConstraints(
              minWidth: 200, maxWidth: 1280, minHeight: 250, maxHeight: 250),
          decoration: BoxDecoration(
            image: DecorationImage(
                // image: NetworkImage((resto.url).toString()),
                image: const NetworkImage("https://i.imgur.com/b0EuTXy.png"),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.6),
                  BlendMode.dstATop,
                )
              ),
            gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xCC000000),
                  Color(0x00000000),
                  Color(0x00000000),
                  Color(0xCC000000),
                ],
              ),
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3),
              )
            ],
          ),
          child: Column(
            children: [
              RestoInfoCard(
                  restoName: (resto.name), restoTitle: resto.id.toString())
            ],
          )),
    ),
  ));
}
