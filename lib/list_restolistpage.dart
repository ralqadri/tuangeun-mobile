import 'package:flutter/material.dart';
import 'resto_class.dart';
import 'card_buildrestocard.dart';

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