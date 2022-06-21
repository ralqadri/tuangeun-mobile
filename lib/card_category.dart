import 'package:flutter/material.dart';
import 'tuangeun_theme.dart';
// TODO: This library usage isn't  necessary, will remove soon lol only for proof of concept
import 'dart:math'; 

class CategoryCard extends StatelessWidget {
  final String? categoryTitle;
  final Color? categoryColor;
  final void Function()? press;

  const CategoryCard({
    Key? key,
    this.categoryTitle,
    this.categoryColor = Colors.white,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          image: DecorationImage(
            // TODO: Don't make the image random; make it fixed 
            image: Random().nextInt(2) % 2 == 0
                ? const AssetImage('images/cafe.jpg')
                : const AssetImage('images/resto.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.3),
              BlendMode.dstATop,
            )
          ),
          color: categoryColor,
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 17),
              blurRadius: 17,
              spreadRadius: -23,
              color: kShadowColor,
            ),
          ],
        ),
        child: Material(
            color: Colors.transparent,
            child: InkWell(
                onTap: press,
                child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          categoryTitle.toString(),
                          style: TuangeunTheme.darkTextTheme.headline1,
                        )
                      ],
                    )
                  )
                )
              )
              );
  }
}
