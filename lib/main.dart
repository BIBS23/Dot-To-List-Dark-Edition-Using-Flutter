import 'package:demo/mydot.dart';
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DOT - To do list',
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: GradientText(
            "MY DOT",
            style: TextStyle(
              fontSize: 20,
              letterSpacing: 20,
            ),
            colors: [
              Colors.blue,
              Colors.red,
            ],
          ),
          centerTitle: true,
        ),
        body: MyDot(),
      
      ),
    );
  }
}
