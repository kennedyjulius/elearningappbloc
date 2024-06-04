import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Center(child: Text("My Home Page")),
      ),
    );
  }
}