import 'package:flutter/material.dart';
import 'package:radiology_calculator/pages/assets/calculators.dart';
import 'package:radiology_calculator/pages/calculator_page.dart';

List<String> _recentCalculators = [];

class CalculatorSearch extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(
          context,
          null,
        );
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return ListView();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<String> suggestions = query.isEmpty
        ? _recentCalculators
        : radiologyCalculators
            .where((e) => e.toLowerCase().contains(query.toLowerCase()))
            .toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          _recentCalculators.insert(0, suggestions[index]);
          _recentCalculators = _recentCalculators.toSet().toList();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CalculatorPage(),
            ),
          );
        },
        leading: Icon(Icons.calculate_rounded),
        title: Text(suggestions[index]),
      ),
    );
  }
}
