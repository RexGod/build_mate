import 'package:build_mate/Settings/Validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Screens/Building_screen.dart';
import 'Screens/Landing_screen.dart';
import 'Provider/Auth_managers.dart';
import 'Screens/SignUp.dart';
import 'Screens/login_screen.dart';

Future<void> main() async {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Auth()),
        ChangeNotifierProvider.value(value: Setting())
      ],
      child: MaterialApp(
        home: Landing(),
        routes: {
          Landing.route_name: (context) => Landing(),
          Login.route_name: (context) => Login(),
          SignUp.route_name: (context) => SignUp(),
          Building.route_name: (context) => Building(),
        },
      ),
    );
  }
}
