import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';
import 'Screens/Landing_screen.dart';
import 'Screens/Login_screen.dart';
Future<void> main() async {

  runApp(MainApp());
}

class MainApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Landing(),
      routes: {
        Landing.route_name: (context) =>  Landing(),
        Login.route_name :(context) => Login(),
      },
    );
  }
}
