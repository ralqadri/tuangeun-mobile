import 'package:flutter/material.dart';
import 'tuangeun_theme.dart';


class RestoInfoCard extends StatelessWidget {
  final String restoName;
  final String restoTitle;

  const RestoInfoCard({
    Key? key,
    required this.restoName,
    required this.restoTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minWidth: 700, maxWidth: 1280),
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                restoName,
                style: TuangeunTheme.darkTextTheme.headline2,
              ),
              Text(
                restoTitle,
                style: TuangeunTheme.darkTextTheme.headline4,
              ),
            ],
          )
        ],
      ),
    );
  }
}