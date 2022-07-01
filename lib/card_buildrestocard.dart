import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tuangeun/card_buildrestocard-plain.dart';
import 'resto_class.dart';
import 'card_resto-info.dart';
import 'page_restoinformation.dart';

Widget buildRestoCard(Resto resto, int index, BuildContext context) {
  

  return Center(
      child: Material(
    color: Colors.transparent,
    child: InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => RestoInformationPage(resto, index.toString())));
      },
      child: CachedNetworkImage(
        imageUrl: resto.imageLink,
        imageBuilder: (context, imageProvider) => Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            constraints: const BoxConstraints(
                minWidth: 200, maxWidth: 1280, minHeight: 250, maxHeight: 250),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: imageProvider,
                  // image: NetworkImage((resto.imageLink).toString()),
                  // image: const NetworkImage("https://i.imgur.com/b0EuTXy.png"),
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
          placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) =>  buildPlainRestoCard(resto, index, context),
      ),
    ),
  ));
}
