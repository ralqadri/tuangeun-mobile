import 'package:flutter/material.dart';
import 'tuangeun_theme.dart';


class RestoInfoCard extends StatelessWidget {
  final String restoName;
  final String restoCategory;

  const RestoInfoCard({
    Key? key,
    required this.restoName,
    required this.restoCategory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.black,
      constraints: const BoxConstraints(minWidth: 700, maxWidth: 1280, minHeight: 200, maxHeight: 218),
      padding: const EdgeInsets.all(8),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                Text(
                  restoCategory,
                  style: TuangeunTheme.darkTextTheme.headline3,
                ),
                Text(
                  restoName,
                  style: TuangeunTheme.darkTextTheme.headline1,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}