import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CalculatorPage extends StatefulWidget {
  final String name;

  CalculatorPage({this.name});

  @override
  _CalculatorPageState createState() => _CalculatorPageState(name: name);
}

class _CalculatorPageState extends State<CalculatorPage> {
  final String name;

  _CalculatorPageState({this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.grey[800],
        title: Text(name),
      ),
      body: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: 'https://radiology-universe.org/',
      ),
    );
  }
}
