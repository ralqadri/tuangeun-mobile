import 'package:flutter/material.dart';
import 'package:tuangeun/main.dart';
import 'package:tuangeun/resto_class.dart';
import 'package:tuangeun/tuangeun_theme.dart';
import 'rating_class.dart';

class RestosRatingListPage extends StatelessWidget {
  const RestosRatingListPage({super.key, required this.restoratings});

  final List<Rating> restoratings;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: restoratings.length,
      itemBuilder: (context, index) {
        return buildRatingCommentCard(restoratings[index], index, context);
      },
    );
  }
}

Widget buildRatingCommentCard(Rating rating, int index, BuildContext context) {
  return Container(
      width: MediaQuery.of(context).size.width,
      height: 250,
      padding: const EdgeInsets.all(24),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 22.5),
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: const Color.fromARGB(120, 255, 255, 255),
        ),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: crossaxis,
                children: [
                  const Icon(
                    Icons.star_rounded,
                    color: Colors.amber,
                    size: 45.0,
                  ),
                  Text(
                    rating.rate.toString(),
                    style: TuangeunTheme.darkTextTheme.headline3,
                  ),
                ],
              ),
            ]
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 4.0),
                child: Text(
                  "User " + rating.idUser.toString(),
                  style: TuangeunTheme.darkTextTheme.headline4,
                ),
              )
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12,),
            width: MediaQuery.of(context).size.width*0.8,
            child: Column(
              children: [
                Text(rating.review, style: TuangeunTheme.darkTextTheme.headline2,)
              ],
            )
          )
        ],
      ));
}
