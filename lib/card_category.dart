import 'package:flutter/material.dart';
import 'tuangeun_theme.dart';

class CategoryCard extends StatelessWidget {
  final String? cardTitle;
  final Color? cardColor;
  final void Function()? press;

  const CategoryCard({
    Key? key,
    this.cardTitle,
    this.cardColor = Colors.white,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            offset: Offset(0, 17),
            blurRadius: 17,
            spreadRadius: -23,
            color: kShadowColor,
          ),
        ]
      ),
    );
  }
}
