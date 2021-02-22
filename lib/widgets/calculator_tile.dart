import 'package:flutter/material.dart';
import 'package:radiology_calculator/pages/calculator_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class CalculatorTile extends StatefulWidget {
  final String entry;

  CalculatorTile({this.entry});

  @override
  _CalculatorTileState createState() => _CalculatorTileState(entry: entry);
}

saveFavorite(String entryName) async {
  final calcPrefs = await SharedPreferences.getInstance();
  calcPrefs.setBool(entryName, true);
}

removeFavorite(String entryName) async {
  final calcPrefs = await SharedPreferences.getInstance();
  calcPrefs.setBool(entryName, false);
}

Future<bool> readFavorite(String entryName) async {
  final calcPrefs = await SharedPreferences.getInstance();
  bool fav = calcPrefs.getBool(entryName) ?? false;
  return fav;
}

class _CalculatorTileState extends State<CalculatorTile> {
  final String entry;
  bool _favorite = false;

  _CalculatorTileState({this.entry});

  @override
  void initState() {
    super.initState();
    readFavorite(entry).then((value) {
      setState(() {
        this._favorite = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CalculatorPage(
              name: entry,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 8.0,
        ),
        child: Container(
          height: 80.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            color: Colors.grey[600],
            border: Border.all(
              width: 4.0,
              color: Colors.amber,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                ),
                child: Text(
                  widget.entry,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                ),
                child: IconButton(
                  icon: _favorite ? Icon(Icons.star) : Icon(Icons.star_border),
                  iconSize: 30.0,
                  color: Colors.amber,
                  onPressed: () {
                    _favorite ? removeFavorite(entry) : saveFavorite(entry);
                    setState(() {
                      this._favorite = !this._favorite;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
