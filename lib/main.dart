import 'package:flutter/material.dart';
import 'tuangeun_theme.dart';
import 'home.dart';

void main() {
  runApp(const Tuangeun());
}

class Tuangeun extends StatelessWidget {
  const Tuangeun({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final darkTheme = TuangeunTheme.dark();
    final lightTheme = TuangeunTheme.light();
    return MaterialApp(
      title: 'Tuangeun',
      theme: darkTheme,
      home: const Home(),
    );
  }
}

/*
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(),
      ),
    );
  }
}
*/