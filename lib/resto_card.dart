import 'package:flutter/material.dart';
// ignore: unused_import
import 'tuangeun_theme.dart';
import 'resto_cardinfo.dart';

var items = List<String>.generate(10, (i) => 'Item $i');

class RestoCard extends StatelessWidget {
  const RestoCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return buildCard(items[index], items[index], index);
      },
    );
  }
}

Widget buildCard(String restoName, restoTitle, int index) {
  return Center(
      child: Container(
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          constraints: const BoxConstraints(minWidth: 700, maxWidth: 1280),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: index % 2 == 0 ? const AssetImage('example_resto.jpg') : const AssetImage('example_cafe.jpg'),
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
              ]
            ),
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
              RestoInfoCard(restoName: restoName, restoTitle: restoTitle)
            ],
          )
        )
      );
}
