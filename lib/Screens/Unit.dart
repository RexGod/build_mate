import 'package:flutter/material.dart';
import '../Widgets/Residence.dart';
class Unit extends StatelessWidget {
  const Unit({super.key});

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
        SizedBox(
          height: 30,
        ),
        Expanded(child: ResidenceList()),

        //BottomNavigationBar(items: )
      ]),
    ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
