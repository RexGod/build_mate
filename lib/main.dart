import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Screens/Landing_screen.dart';
import 'Screens/Register_screen.dart';
import 'Provider/Auth_managers.dart';

Future<void> main() async {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Auth()),
      ],
      child: MaterialApp(
        home: Landing(),
        routes: {
          Landing.route_name: (context) => Landing(),
          Register.route_name: (context) => Register(),
          //SignUp.route_name :(context) => SignUp()
        },
      ),
    );
  }
}
