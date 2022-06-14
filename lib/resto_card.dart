import 'package:flutter/material.dart';
import 'tuangeun_theme.dart';
import 'restoinfocard.dart';

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
          constraints: const BoxConstraints.expand(
            width: 500,
            height: 350,
          ),
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage('example_cafe.jpg'),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.all(const Radius.circular(12)),
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
              // SizedBox(height: 240),
              const RestoInfoCard(restoName: 'Restorant Tuangeun', restoTitle: 'Sebuah kafe contoh untuk aplikasi Tuangeun')
            ],
          )
      )
    );
  }
}
