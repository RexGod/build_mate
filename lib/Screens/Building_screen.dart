import 'package:flutter/material.dart';

class Building extends StatelessWidget {
  const Building({super.key});
  static const route_name = '/building_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back)),
            const SizedBox(
              width: 100,
            ),
            SizedBox(
              height: 80,
              width: 80,
              child: Image.asset(
                'lib/assets/Logo.png',
                height: 80,
                width: 80,
              ),
            ),
          ],
        ),
      ]),
    ));
  }
}
