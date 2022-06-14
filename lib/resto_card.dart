import 'package:flutter/material.dart';

class RestoCard extends StatelessWidget {
  const RestoCard({Key? key}) : super(key: key);
  final String category = 'Editor\'s Choice';
  final String title = 'The Art of Dough';
  final String description = 'Learn to make the perfect bread.';
  final String chef = 'Ray Wenderlich';

  @override
  Widget build(BuildContext context) {
  return Center(
    child: Container(
      padding: const EdgeInsets.all(16),
    ),
  );
  }
}