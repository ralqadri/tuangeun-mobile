import 'package:flutter/material.dart';
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
      height: 350,
      padding: const EdgeInsets.all(24),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 22.5),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromARGB(120, 255, 255, 255)),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Column(
        children: [
          Text('jgdkfdjf'),
        ],
      ));
}
