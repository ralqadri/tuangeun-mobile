import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tuangeun/home.dart';

class RouterGenerator {
  static Route<dynamic>? generateRoute(RouteSettings settings){
    switch (settings.name){

      case homeRoute:
        return MaterialPageRoute(builder: (_) => const Home());

      default:
        return MaterialPageRoute(builder: (_) => const Center(child: Text("Error"),));
    }
  }
}