import 'package:flutter/material.dart';
import 'resto_class.dart';
import 'tuangeun_theme.dart';

class RestoInformationPage extends StatelessWidget {
  RestoInformationPage(this.resto, {super.key});

  Resto resto;
  AssetImage examplerestoimg = const AssetImage('example_cafe.jpg');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(resto.name),
      ),
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                // color: Colors.purple,
                width: MediaQuery.of(context).size.width,
                height: 450,
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: examplerestoimg,
                    fit: BoxFit.cover,
                  ),
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xCC000000),
                      Color(0x00000000),
                      Color(0x00000000),
                      Color(0xCC000000),
                    ]
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      spreadRadius: 3,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ]
                )
              ),
              Container(
                color: Colors.blue,
                width: 500,
                height: 500,
              ),
            ],
          )
        )
      ),
    );
  }
}
