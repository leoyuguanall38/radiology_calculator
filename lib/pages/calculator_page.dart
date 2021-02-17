import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.grey[800],
        title: Text('_ Calculator'),
      ),
    );
  }
}
