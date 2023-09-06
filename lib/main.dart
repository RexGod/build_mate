import 'package:build_mate/Provider/Residence_provider.dart';
import 'package:build_mate/Provider/balance_Provider.dart';
import 'package:build_mate/Provider/chargh_provider.dart';
import 'package:build_mate/Provider/cost_Provider.dart';
import 'package:build_mate/Screens/main-pages/Costs.dart';
import 'package:build_mate/Screens/payScreen.dart';
import 'package:build_mate/Settings/Validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Screens/Building_screen.dart';
import 'Screens/Landing_screen.dart';
import 'Provider/Auth_managers.dart';
import 'Screens/Authenticate_screen/SignUp.dart';
import 'Screens/Authenticate_screen/login_screen.dart';
import 'Screens/balance.dart';
import 'Screens/charghNotife.dart';
import 'Screens/payChargh.dart';

Future<void> main() async {
  runApp(MainApp());
}

// ignore: use_key_in_widget_constructors
class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Auth()),
        ChangeNotifierProvider.value(value: Setting()),
        ChangeNotifierProvider.value(value: ResidenceProvider()),
        ChangeNotifierProvider.value(value: ProviderCost()),
        ChangeNotifierProvider.value(value: ProviderBalance()),
        ChangeNotifierProvider.value(value: ProviderChargh()),
      ],
      child: MaterialApp(
        home: const Landing(),
        routes: {
          Landing.route_name: (context) => const Landing(),
          Login.route_name: (context) => const Login(),
          SignUp.route_name: (context) => const SignUp(),
          Building.route_name: (context) => Building(),
          Payment.routeName: (context) => const Payment(),
          Cost.routeName: (context) => const Cost(),
          MultiStepForm.routeName: (context) => MultiStepForm(),
          BalanceScreen.routeName: (context) => BalanceScreen(),
          paychargh.route_Name: (context) => paychargh(),
        },
      ),
    );
  }
}
