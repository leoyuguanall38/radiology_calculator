import 'package:flutter/material.dart';

class CalculatorTile extends StatelessWidget {
  final String entry;

  CalculatorTile({this.entry});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/calculator');
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
                  entry,
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
                  icon: Icon(Icons.star_border),
                  iconSize: 30.0,
                  color: Colors.amber,
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
