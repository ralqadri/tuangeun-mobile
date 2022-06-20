import 'package:flutter/material.dart';
import 'tuangeun_theme.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:meditation_app/constants.dart';

class CategoryCardDinda extends StatelessWidget {
  final String? title;
  final void Function()? press;
  const CategoryCardDinda({
    Key? key,
    this.title,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(13),
      child: Container(
        // padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(13),
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
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  const Spacer(),
                  // SvgPicture.asset(svgSrc),
                  const Spacer(),
                  Text(
                    title!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.black),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}