import 'package:flutter/material.dart';
import 'package:radiology_calculator/pages/assets/calculators.dart';
import 'package:radiology_calculator/widgets/calculator_tile.dart';

final List<String> _radiologyCalculators = radiologyCalculators;

class RadiologyCalculator extends StatefulWidget {
  @override
  _RadiologyCalculatorState createState() => _RadiologyCalculatorState();
}

class _RadiologyCalculatorState extends State<RadiologyCalculator> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
        padding: EdgeInsets.symmetric(
          vertical: 8.0,
        ),
        color: Colors.black,
        child: ListView.builder(
          itemCount: _radiologyCalculators.length,
          itemBuilder: (context, index) {
            return CalculatorTile(
              entry: _radiologyCalculators[index],
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        backgroundColor: Colors.grey[800],
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.white,
        selectedFontSize: 16.0,
        unselectedFontSize: 16.0,
        iconSize: 28.0,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
