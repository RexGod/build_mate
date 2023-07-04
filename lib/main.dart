import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
Future<void> main() async {

  runApp(MainApp());
}

class MainApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello!'),
        ),
      ),
    );
  }
}
