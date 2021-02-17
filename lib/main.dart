import 'package:flutter/material.dart';
import 'package:radiology_calculator/pages/calculator_page.dart';
import 'package:radiology_calculator/pages/radiology_calculator.dart';

void main() {
  runApp(Home());
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/calculator': (context) => CalculatorPage(),
      },
      debugShowCheckedModeBanner: false,
      title: 'Radiology Calculator',
      home: RadiologyCalculator(),
    );
  }
}
