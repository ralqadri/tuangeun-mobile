import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'resto_class.dart';
import 'card_resto-info.dart';
import 'page_restoinformation.dart';

Widget buildPlainRestoCard(Resto resto, int index, BuildContext context) {
  
  return Center(
    child: Material(
    color: Colors.transparent,
    child: InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => RestoInformationPage(resto)));
      },
      child: Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            constraints: const BoxConstraints(
                minWidth: 200, maxWidth: 1280, minHeight: 250, maxHeight: 250),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: resto.id % 15 == 0 ? const AssetImage('images/default2.jpg') : resto.id % 2 == 0 ? const AssetImage('images/default1.jpg') : const AssetImage('images/default3.jpg'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.6),
                    BlendMode.dstATop,
                  )),
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
                    restoName: resto.name, restoCategory: resto.category)
              ],
            )
          ),
    ),
  ));
}
