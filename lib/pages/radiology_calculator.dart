import 'package:flutter/material.dart';
import 'package:radiology_calculator/pages/assets/calculators.dart';
import 'package:radiology_calculator/widgets/calculator_search.dart';
import 'package:radiology_calculator/widgets/calculator_tile.dart';
import 'package:shared_preferences/shared_preferences.dart';

final List<String> _radiologyCalculators = radiologyCalculators;

Future<List<String>> _retrieveFavorites() async {
  List<String> favCalculators = [];
  SharedPreferences prefs = await SharedPreferences.getInstance();
  _radiologyCalculators.forEach((element) {
    bool isFavorite = prefs.getBool(element);
    if (isFavorite) {
      favCalculators.add(element);
    }
  });
  return favCalculators;
}

class RadiologyCalculator extends StatefulWidget {
  @override
  _RadiologyCalculatorState createState() => _RadiologyCalculatorState();
}

class _RadiologyCalculatorState extends State<RadiologyCalculator> {
  int _selectedIndex = 0;
  List<String> _favoriteCalculators = [];

  @override
  void initState() {
    super.initState();
    _retrieveFavorites().then((value) {
      setState(() {
        this._favoriteCalculators = value;
      });
    });
  }

  void _onItemTapped(int index) {
    _retrieveFavorites().then((value) {
      setState(() {
        this._selectedIndex = index;
        this._favoriteCalculators = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.grey[800],
        title: Text('Radiology Tools'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: CalculatorSearch());
            },
            iconSize: 30.0,
          ),
        ],
      ),
      body: _selectedIndex == 0 ? _allCalculators() : _favCalculators(),
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

  Widget _allCalculators() {
    return Container(
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
    );
  }

  Widget _favCalculators() {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 8.0,
      ),
      color: Colors.black,
      child: ListView.builder(
        itemCount: this._favoriteCalculators.length,
        itemBuilder: (context, index) {
          return CalculatorTile(
            entry: this._favoriteCalculators[index],
          );
        },
      ),
    );
  }
}
