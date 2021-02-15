import 'package:flutter/material.dart';
import 'package:radiology_calculator/pages/assets/calculators.dart';

final List<String> _radiologyCalculators = radiologyCalculators;

class RadiologyCalculator extends StatefulWidget {
  @override
  _RadiologyCalculatorState createState() => _RadiologyCalculatorState();
}

class _RadiologyCalculatorState extends State<RadiologyCalculator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.grey[800],
        title: Text('Radiology Calculator'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
            iconSize: 30.0,
          ),
        ],
      ),
      body: Container(
        color: Colors.black,
        child: ListView.builder(
          itemCount: _radiologyCalculators.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                print('Success!');
              },
              title: Text(
                _radiologyCalculators[index],
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}