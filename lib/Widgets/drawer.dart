import 'package:build_mate/Screens/Building_screen.dart';
import 'package:build_mate/Screens/charghNotife.dart';
import 'package:flutter/material.dart';

class drawerWidget extends StatelessWidget {
  const drawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Directionality(
            textDirection: TextDirection.rtl,
            child: ListView(
              children: [
                DrawerHeader(
                  decoration: const BoxDecoration(),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Image.asset(
                        'lib/assets/LogoAppBar.png',
                        width: 100.0,
                        height: 100.0,
                      ),
                    ),
                  ),
                ),
                ListTile(
                  leading: TextButton.icon(
                      onPressed: () {
                        Navigator.of(context)
                            .pushReplacementNamed(Building.route_name);
                      },
                      icon: const Icon(
                        Icons.home,
                        color: Colors.white,
                        size: 30,
                      ),
                      label: const Text(
                        'خانه',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      )),
                ),
                ListTile(
                  leading: TextButton.icon(
                      onPressed: () {
                        Navigator.of(context)
                            .pushReplacementNamed(MultiStepForm.routeName);
                      },
                      icon: const Icon(
                        Icons.attach_money,
                        color: Colors.green,
                        size: 30,
                      ),
                      label: const Text(
                        'تعیین شارژ',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      )),
                ),
                ListTile(
                  leading: TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.account_balance_wallet,
                        color: Colors.white,
                        size: 30,
                      ),
                      label: const Text(
                        'صندوق ساختمان',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      )),
                ),
                ListTile(
                  leading: TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.logout,
                        color: Colors.red,
                        size: 30,
                      ),
                      label: const Text(
                        'خروج از حساب',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      )),
                )
              ],
            )),
      ),
    );
  }
}
